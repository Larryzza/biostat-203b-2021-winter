Lab_grouping <- tabPanel(title = "Lab grouping", 
                         value = "Lab_grouping",
                         column(width = 10,
                                column(width = 2,
                                       pickerInput(inputId = "lab_t2_value", 
                                                   label = "selected variable", 
                                                   choices = lab, 
                                                   selected = "chloride", 
                                                   options = list(`live-search` = TRUE))
                                )
                         ), 
                         column(width = 2, style = "padding-top: 50px;",
                                actionBttn(inputId = "lab_t2_select", 
                                           label = "Select", 
                                           style = "fill", 
                                           color = "success", 
                                           icon = icon("check"), size = "sm") 
                         ),
                         conditionalPanel(condition = "input.lab_t2_select < 1",
                                          column(width = 12,
                                                 br(), 
                                                 wellPanel(
                                                   HTML("<h1>Analysis between two key outcomes (death within 30 days or not)<h1>"),
                                                   HTML("<h4>
                                                    Choose the variable you would like to explore.
                                                    Click 'Select' button to plot. <br>
                                                    <b>Please try to interact with images!</b>
                                                           <h4>")
                                                 )
                                          )
                         ),
                         ##-- Outputs ----
                         column(width = 12,
                                conditionalPanel(condition = "input.lab_t2_select > 0",
                                                 HTML("<center><h1>Density plot between two key outcomes (death within 30 days or not)</h1></center>"),
                                                 column(width = 12,
                                                        withSpinner(plotlyOutput("lab_t2_plot"), type = 6)
                                                 )           
                                )
                                
                         )
)