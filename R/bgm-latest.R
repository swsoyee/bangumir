#' Get summary of user's collection
#'
#' @param username User name a user id.
#' @param type Category type, \code{anime}, \code{book}, \code{game},
#' \code{music} and \code{real} are available.
#' @param max Max result number, default is the \code{25} (Maximum value).
#' @param format Result will be a list of json data when set to \code{list}
#' (default), \code{response()} object when set to \code{default}, and list of
#' \code{data.table} when set to \code{table}.
#' @param key Your application key (ID). \code{bangumir} already comes with a
#' key/secret but you are welcome to swap out with our own. Since these keys are
#' shipped with the package, there is a small chance they could be voided if
#' someone abuses the key. If you plan to use this in production, or for an
#' internal tool, the recommended practice is to create a new application on
#' \href{https://bgm.tv/dev/app}{Bangumi} and use those keys for your purposes.
#'
#' @importFrom httr GET content
#'
#' @return A list of json data in list, \code{response()} object, or a
#' \code{data.table} contains the latest collections.
#' @export
#'
#' @examples
#' result <- bgm_latest(username = "sai", format = "table")
#'
#' # Result of watching
#' result$do
bgm_latest <- function(username,
                       type = c("anime", "book", "game", "music", "real"),
                       max = 25,
                       format = c("list", "table", "default"),
                       key = "bgm2725b1fa2fea5582") {
  # config
  base <- "https://api.bgm.tv/user/%s/collections/%s"
  limited_args <- list(
    "format" = match.arg(format, c("list", "table", "default"))
  )

  # arguments check
  .check_username(username)
  type <- match.arg(type, c("anime", "book", "game", "music", "real"))

  # get resource
  res <- httr::GET(
    # no matter the user name or id, only return authenticated user's progress
    url = sprintf(base, username, type),
    query = c(
      limited_args,
      "username" = username,
      "app_id" = key,
      "max_results" = max
    ),
  )
  content <- httr::content(res)

  # return
  return(switch(
    limited_args$format,
    list = content,
    default = res,
    table = {
      contents <- content[[1]]
      tables <- lapply(contents$collects, function(collect) {
        dt <- json_to_df(collect$list)
        # clean useless column and rename
        drops <- c(
          "subject.id",
          "subject.summary",
          "subject.air_date",
          "subject.air_weekday",
          "subject.images.common",
          "subject.images.medium",
          "subject.images.small",
          "subject.images.grid"
        )
        dt <- dt[, !(names(dt) %in% drops)]
        dt$subject.type <- contents$name
        dt
      })
      types <- sapply(contents$collects, function(collect) {
        collect$status$type
      })
      names(tables) <- types
      c(
        tables,
        "type" = contents$type,
        "name" = contents$name,
        "name_cn" = contents$name_cn
      )
    }
  ))
}
