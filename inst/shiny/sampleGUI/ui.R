ui <-

  load("data/costofliving.rda")
  load("data/total.rda")
  city <- costofliving[,1]
  shiny::fluidPage(shinythemes::shinytheme("cerulean"),
                shiny::sidebarLayout(
                  shiny::sidebarPanel(width = 4,
                               shiny::selectInput(
                                 inputId = "City",
                                 label = "Please select City",
                                 choices = city,
                                 multiple = TRUE  ),
                               ),

                  shiny::mainPanel(shiny::tabsetPanel(type="tabs",
                                        shiny::tabPanel("Comparison Graph",  DT::dataTableOutput(outputId = "mtble2"),
                                                 shiny::plotOutput("costliving")),

                                        shiny::tabPanel("Data",  DT::dataTableOutput(outputId = "mtble"))



                  )
                  )))




