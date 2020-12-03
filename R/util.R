json_to_df <- function(l) {
  element <- lapply(l, function(list) {
    as.list(unlist(list))
  })
  return(data.table::rbindlist(element, fill = TRUE))
}

check_username <- function(username, force = FALSE) {
  LIMIT_USER_COUNT <- 10
  if (!methods::hasArg(username)
  || !is.vector(username)
  || length(username) == 0) {
    stop("The argument `username` should be a vector and must be passed in.")
  }
  if (length(username) > LIMIT_USER_COUNT && force == FALSE) {
    stop(sprintf("You are fetch over than %s users info in a short time,
         which is not recommended.", LIMIT_USER_COUNT))
  }
}

.check_username <- function(username) {
  if (missing(username) || length(username) != 1) {
    stop("The argument `username` should be a character and must be passed in.")
  }
}
