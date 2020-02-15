#' Reactive Data
#'
#' @param this function returnd city input for toal cost of living for graph input
#'
#' @return
#' @export
#'
#' @examples
reactive_data = function (Data) {reactive({citycostanalysis::total %>%
    filter(city %in% input$City)

})
}
