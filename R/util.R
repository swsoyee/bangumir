json_to_df <- function(l) {
  # source:
  # https://stackoverflow.com/questions/4227223/convert-a-list-to-a-data-frame
  df <- data.frame(matrix(unlist(l), nrow = length(l), byrow = T))
  names(df) <- names(l[[1]])
  return(df)
}
