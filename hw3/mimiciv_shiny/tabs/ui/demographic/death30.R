death30 <- tabPanel(title = "Cases death within 30 days hospital stay", 
                    value = "death30",
                    br(), hr(),
                    
                    column(width = 10,
                           column(width = 2,
                                  pickerInput(inputId = "s", 
                                              label = "sss", 
                                              choices = c("s","ss"), 
                                              selected = "s", 
                                              options = list(`live-search` = TRUE))
                           )),
                    
                    column(width = 12,
                           column(width = 6,
                                  conditionalPanel(condition = "s==s",
                                                   HTML("<center><h1>PROPORTION OF VOTES</h1></center>"),
                                                   column(width = 12,
                                                          withSpinner(plotlyOutput("scatterPlot"), type = 6)
                                                   )
                                  )
                           )
                    )
                    
        
)

