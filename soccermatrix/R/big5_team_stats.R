#' @title FBref Big 5 Team Stats
#' @description Gathers the "Big 5" European leagues' stats FBref team data as a data frame.
#' @return A data frame team stats from the big 5 European leagues.
#' @import dplyr
#' @import xml2
#' @import rvest
#' @export
#' @examples
#' \dontrun{
#' mydata <- big5_team_stats()
#' }
#' @source \url{https://fbref.com/}

big5_team_stats <- function(){
  data <- xml2::read_html("https://fbref.com/en/comps/Big5/stats/squads/Big-5-European-Leagues-Stats") %>%
    rvest::html_nodes("#stats_squads_standard_for") %>% rvest::html_table()

  data <- data[[1]]
  cols <- as.character(data[1,])
  names(data) <- cols
  data <- data[-1,-1] #sorted in Ranking order
  data$Squad <- factor(data$Squad)
  data$Comp <- factor(data$Comp)
  data$Min <- gsub("\\,", "", data$Min)
  data <- data[,!duplicated(colnames(data))]

  class(data) <- "data.frame"
  return(data)
}
