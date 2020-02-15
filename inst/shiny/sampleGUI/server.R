
server <- function(input, output,session) {
#even after defining packages in namespace with roxygen and decription file,
  #dplyr was not picking up pipe function(%>%) so in the end,had to introduce
  #librray of dplyr in the server,after many attempts.

library(magrittr)
  library(dplyr)
  filter_city <- reactive ({ citycostanalysis::costofliving %>%
      filter(city %in% input$City)


  })


  filter_total <-  reactive({total %>%
      filter(citycostanalysis::city %in% input$City)})

  graph_total <- reactive({tot %>%
     filter(citycostanalysis::Total %in% input$City)})

  output$mtble <- DT::renderDataTable({
    DT::datatable(data = filter_city() , options = list(pageLength = 10),
                  rownames = FALSE, class = 'display', escape = FALSE)

  })

  output$mtble2 <- DT::renderDataTable({
    DT::datatable(data = filter_total() , options = list(pageLength = 10),
                  rownames = FALSE, class = 'display', escape = FALSE)

  })

 reactive_data = reactive({citycostanalysis::total %>%
      filter(city %in% input$City)

  })

  output$costliving <- renderPlot({



    our_data <- reactive_data()

    ggplot2::ggplot( our_data, ggplot2::aes(x=Cities , y=total),
           ylab="Total",
           xlab=" Cities",
           names.arg = c(input$city))+
      ggplot2::geom_bar(stat="identity",fill="Pink",color="green")







  })


}






