#' Get user's collection
#'
#' @param username User name a user id.
#' @param cat Collection category, \code{watching} for anime and real,
#' \code{all_watching} for anime, real and book.
#' @param ids Numeric vector of subject id.
#' @param responseGroup Response of details type is set to be \code{medium},
#' setting \code{small} for simplified mode.
#' @param format Result will be a list of json data when set to \code{list}
#' (default), \code{response()} object when set to \code{default}, and a
#' \code{data.table} when set to \code{table}.
#'
#' @importFrom httr GET content
#'
#' @export
#'
#' @examples
#' bgm_user_collection(username = "sai", format = "table")
bgm_user_collection <- function(username,
                                cat = c("watching", "all_watching"),
                                ids = NULL,
                                responseGroup = c("medium", "small"),
                                format = c("list", "table", "default")) {
  # config
  base <- "https://api.bgm.tv/user/%s/collection"
  limited_args <- list(
    "cat" = cat,
    "responseGroup" = responseGroup,
    "format" = format
  )

  # arguments check
  .check_username(username)
  if (length(ids) > 0 && !is.numeric(ids)) {
    stop("Only accept numeric vector in `ids` argument.")
  }
  valid_args <- .valid_args(limited_args)

  # get resource
  res <- httr::GET(
    url = sprintf(base, username),
    query = c(
      valid_args,
      "username" = username,
      "ids" = ids
    )
  )
  content <- httr::content(res)

  # return
  return(switch(
    format,
    list = content,
    default = res,
    table = json_to_df(content)
  ))
}
