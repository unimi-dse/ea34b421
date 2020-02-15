#' Total Cost of living Calculator
#'
#' @param data Reflects back sum of Total Cost of living of the selected city in data table
#'
#' @return  Sum of cost of living
#' @export
#'
#' @examples
filter_total <-  function (data) {reactive({total %>%
    filter(citycostanalysis::city %in% input$City)})
}
