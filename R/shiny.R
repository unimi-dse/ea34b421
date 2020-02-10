#' Sample GUI
#'
#' Runs a Graphical User Interface to show comparison between cost of living among different major cities of the world.
#'
#' @return shiny app
#'
#' @export
sampleGUI <- function(){

  shiny::runApp(system.file("shiny/sampleGUI", package = "citycostanalysis"))

}
