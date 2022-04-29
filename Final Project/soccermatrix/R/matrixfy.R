#' @title Soccer Data Matrix Conversion
#' @description Converts FBref data into matrix form.
#' @param data The data you wish to convert to matrix form. Make sure to have your data with the player or team name as the first observation or column..
#' @return A numeric matrix of the data used inside the function. The player or team name will be the row names.
#' @import dplyr
#' @examples
#' \dontrun{
#' matrixfy(data = df)
#' }

matrixfy <- function(data = NULL){

  cols <- colnames(data)
  rows <- rownames(data)

  row.names(data) <- data[,1]
  data <- data[,-1]

  data <- data.matrix(data)

  return(data)
}
