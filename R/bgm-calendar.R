#' Get bangumi calendar
#'
#' @param format Result will be a list of json data when set to \code{list}
#' (default), \code{response()} object when set to \code{default}. Set to
#' \code{table} will convert the list to a \code{data.frame} for ease of use.
#'
#' @importFrom httr GET content
#' @importFrom data.table rbindlist set
#'
#' @return A list of response content or a \code{response()} object according to
#' the \code{format} option.
#' @export
#'
#' @examples
#' bgm_calendar("table")
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
      table <- data.table::rbindlist(table_list, use.names = TRUE)
      col_name <- colnames(table)[grepl(
        "(rating|collection|rank)",
        colnames(table)
      )]
      for (col in col_name) {
        data.table::set(table, j = col, value = as.numeric(table[[col]]))
      }
      for (col in c("type", "air_weekday")) {
        data.table::set(table, j = col, value = as.factor(table[[col]]))
      }
      data.table::set(table, j = "air_date", value = as.Date(table$air_date))
      table
    }
  ))
}
