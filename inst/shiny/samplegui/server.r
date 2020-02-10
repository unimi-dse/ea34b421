server <- function(input, output) {


  filter_city <- reactive({ dplyr::costofliving %>%
      filter(city %in% input$City)


  })

  import::from(here,jsonlite,roxygen2, xlsx)
  filter_total <- reactive({dplyr::total %>%
      dplyr::filter(city %in% input$City)})

  graph_total <- reactive({dplyr::tot %>%
      dplyr::filter(Total %in% input$City)})

  output$mtble <- DT::renderDataTable({
    DT::datatable(data = filter_city() , options = list(pageLength = 10),
                  rownames = FALSE, class = 'display', escape = FALSE)

  })

  output$mtble2 <- DT::renderDataTable({
    DT::datatable(data = filter_total() , options = list(pageLength = 10),
                  rownames = FALSE, class = 'display', escape = FALSE)

  })

 reactive_data = reactive({ dplyr::total %>%
      filter(city %in% input$City)

  })

  output$costliving <- renderPlot({



    our_data <- reactive_data()

    ggplot2::ggplot(our_data, aes(x=Cities , y=total),
           ylab="Total",
           xlab=" Cities",
           names.arg = c(input$city))+
      ggplot2::geom_bar(stat="identity",fill="Pink",color="green")







  })


}






