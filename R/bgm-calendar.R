#' Get bangumi calendar
#'
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
#' result <- bgm_calendar("table")
#'
#' # Bangumi list on Monday
#' result$mon
bgm_calendar <- function(format = c("list", "table", "default")) {
  # config
  base <- "https://api.bgm.tv/calendar"
  limited_args <- list(
    "format" = match.arg(format, c("list", "table", "default"))
  )

  # get resource
  res <- httr::GET(
    url = base
  )
  content <- httr::content(res)

  # return
  return(switch(
    limited_args$format,
    list = content,
    default = res,
    table = {
      table_list <- lapply(content, function(day) {
        json_to_df(day$items)
      })
      name_list <- sapply(content, function(day) {
        tolower(day$weekday$en)
      })
      names(table_list) <- name_list
      table_list
    }
  ))
}
