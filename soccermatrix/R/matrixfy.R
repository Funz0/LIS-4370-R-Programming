#' @title Soccer Data Matrix Conversion
#' @description Converts FBref data into matrix form.
#' @param data The data you wish to convert to matrix form. Make sure to have your data with the player or team name as the first observation or column..
#' @return A numeric matrix of the data used inside the function. The player or team name will be the row names.
#' @import dplyr
#' @export
#' @examples
#' df = big5_team_stats()

#' # removing unwanted cols for heatmap specifically
#' df <- df %>%
#' select(-c("Starts","Min","PK","PKatt","CrdR","xG+xA","G+A-PK","G+A","npxG+xA","CrdY"))
#'
#' df_m = matrixfy(data = df)
#'
#' heatmap(df_m)

matrixfy <- function(data){
  cols <- colnames(data)
  rows <- data[,1]

  data <- select(data, -starts_with(c("Player", "Squad", "Comp")))

  data <- data %>%
    mutate_if(is.character, as.numeric)

  data <- data.matrix(data)
  row.names(data) <- rows

  return(data)
}
