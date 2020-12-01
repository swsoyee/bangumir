#' Get bangumi user information
#'
#' @param username A vector of user name or id.
#' @param format Result will be a list of json data when set to \code{l} or
#' \code{list} (default), a list of \code{response()} object when set to
#' \code{d} or \code{default}, and a \code{data.frame} when set to \code{t} or
#' \code{table}.
#' @param force By default, you can get information of up to \code{10} users at
#' a time, but if you want to break the limit, set it to \code{TRUE} but it's
#' not recommended.
#'
#' @importFrom httr GET content
#' @importFrom methods hasArg
#'
#' @return A list of json data in list, \code{response()} object, or a
#' \code{data.frame} contains all users' information.
#' @export
#'
#' @examples
#' library(bangumir)
#' bgm_user_info(username = "sai")
#' bgm_user_info(username = c("sai", "infinityloop"), format = "t")
bgm_user_info <- function(username, format = "list", force = FALSE) {
  # settings
  URL_BASE <- "https://api.bgm.tv/user/"

  # arguments check
  check_username(username, force)

  # get resource
  res <- list()
  for (index in seq_len(length(username))) {
    res[[index]] <- httr::GET(paste0(URL_BASE, username[index]))
  }

  # return result
  if (format %in% c("d", "default")) {
    return(res)
  }

  res_list <- lapply(res, function(i) {
    httr::content(i)
  })
  if (format %in% c("l", "list")) {
    return(res_list)
  }
  if (format %in% c("t", "table")) {
    newList <- lapply(res_list, function(l) {
      unlist(l)
    })
    return(json_to_df(newList))
  }
}
