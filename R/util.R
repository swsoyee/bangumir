json_to_df <- function(l) {
  # source:
  # https://stackoverflow.com/questions/4227223/convert-a-list-to-a-data-frame
  df <- data.frame(matrix(unlist(l), nrow = length(l), byrow = T))
  names(df) <- names(l[[1]])
  return(df)
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
