server <- function(input, output,session) {

library(dplyr)
library(magrittr)

  filter_city <- reactive ({costofliving %>%
      filter(city %in% input$City)


  })


  filter_total <-  reactive({total %>%
      filter(city %in% input$City)})

  graph_total <- reactive({tot %>%
     filter(Total %in% input$City)})

  output$mtble <- DT::renderDataTable({
    DT::datatable(data = filter_city() , options = list(pageLength = 10),
                  rownames = FALSE, class = 'display', escape = FALSE)

  })

  output$mtble2 <- DT::renderDataTable({
    DT::datatable(data = filter_total() , options = list(pageLength = 10),
                  rownames = FALSE, class = 'display', escape = FALSE)

  })

 reactive_data = reactive({total %>%
      filter(city %in% input$City)

  })

  output$costliving <- renderPlot({



    our_data <- reactive_data()

    ggplot2::ggplot(our_data, ggplot2::aes(x=Cities , y=total),
           ylab="Total",
           xlab=" Cities",
           names.arg = c(input$city))+
      ggplot2::geom_bar(stat="identity",fill="Pink",color="green")







  })


}






