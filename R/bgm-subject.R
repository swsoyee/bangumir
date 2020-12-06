#' Get subject information.
#'
#' @param id Subject id.
#' @param responseGroup Response of details type is set to be \code{small}
#' (simplified mode), \code{medium} and \code{large} are also available.
#' @param format Result will be a list of json data when set to \code{list}
#' (default), \code{response()} object when set to \code{default}.
#'
#' @importFrom httr GET content
#'
#' @return A list of response content or a \code{response()} object according to
#' the \code{format} option.
#' @export
#'
#' @examples
#' bgm_subject(10380)
bgm_subject <- function(id = NULL,
                        responseGroup = c("small", "medium", "large"),
                        format = c("list", "default")) {
  # config
  base <- "https://api.bgm.tv/subject/%s"
  limited_args <- list(
    "responseGroup" = match.arg(responseGroup, c("small", "medium", "large")),
    "format" = match.arg(format, c("list", "default"))
  )

  # arguments check
  if (missing(id)) {
    stop("`id` should be passed in.")
  }

  # get resource
  res <- httr::GET(
    url = sprintf(base, id),
    query = c(
      limited_args
    )
  )
  content <- httr::content(res)

  # return
  return(switch(
    limited_args$format,
    list = content,
    default = res,
    table = json_to_df(content)
  ))
}

#' Get subject episode information.
#'
#' @param id Subject id.
#' @param format Result will be a list of json data when set to \code{list}
#' (default), \code{response()} object when set to \code{default}. Set to
#' \code{table} will convert the episode list to a \code{data.frame} for ease of
#' use.
#'
#' @importFrom httr GET content
#'
#' @return A list of response content or a \code{response()} object according to
#' the \code{format} option.
#' @export
#'
#' @examples
#' bgm_subject_ep(10380, "table")
bgm_subject_ep <- function(id = NULL,
                           format = c("list", "table", "default")) {
  # config
  base <- "https://api.bgm.tv/subject/%s/ep"
  limited_args <- list(
    "format" = match.arg(format, c("list", "table", "default"))
  )

  # arguments check
  if (missing(id)) {
    stop("`id` should be passed in.")
  }

  # get resource
  res <- httr::GET(
    url = sprintf(base, id),
    query = c(
      limited_args
    )
  )
  content <- httr::content(res)

  # return
  return(switch(
    limited_args$format,
    list = content,
    default = res,
    table = {
      content$eps <- json_to_df(content$eps)
      content
    }
  ))
}
