#' @title FBref Big 5 Player Stats
#' @description Gathers the "Big 5" European leagues' stats FBref player data as a data frame.
#' @return A data frame of the player stats from the big 5 European leagues.
#' @import dplyr
#' @import xml2
#' @import rvest
#' @export
#' @examples
#' \dontrun{
#' mydata <- big5_player_stats()
#' }
#' @source https://fbref.com/

big5_player_stats <- function(){
  data <- xml2::read_html("https://fbref.com/en/comps/Big5/stats/players/Big-5-European-Leagues-Stats") %>%
    rvest::html_nodes("#stats_standard") %>% rvest::html_table()

  data <- data[[1]]
  cols <- as.character(data[1,])
  names(data) <- cols
  data <- data[-1,-c(1,3,4,7:8,34)] #sorted in Ranking order
  data <- data[!data$Player=="Player",] # removing header info from rows
  data$Squad <- factor(data$Squad)
  data$Comp <- factor(data$Comp)
  data <- data[!duplicated(data$Player),]
  data <- data[,!duplicated(colnames(data))]

  data$Min <- gsub("\\,", "", data$Min)

  class(data) <- "data.frame"
  return(data)
}
