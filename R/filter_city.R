#' City Filter
#'
#' @param Data This function returns back the selected city for data
#'
#' @return Selected city to show cost of living
#' @export
#'
#' @examples
filter_city <- function (Data) {reactive ({ citycostanalysis::costofliving %>%
    filter(city %in% input$City)


})}
