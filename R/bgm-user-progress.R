#' Get user's progress
#'
#' @param username User name a user id.
#' @param subject_id
#' @param format Result will be a list of json data when set to \code{list}
#' (default), \code{response()} object when set to \code{default}, and a
#' \code{data.table} when set to \code{table}.
#'
#' @return
#'
#' @examples
#' bgm_user_progress(username = "sai")
bgm_user_progress <- function(username,
                              subject_id = NULL,
                              format = c("list", "table", "default")) {
  # config
  base <- "https://api.bgm.tv/user/%s/progress"
  limited_args <- list(
    "format" = match.arg(format, c("list", "table", "default"))
  )

  # arguments check
  .check_username(username)

  # get resource
  res <- httr::GET(
    url = sprintf(base, username),
    query = c(
      limited_args,
      "subject_id" = subject_id
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
