v_grouping <- tabPanel(title = "Vital grouping", 
                       value = "v_grouping", 
                       column(width = 10,
                              column(width = 2,
                                     pickerInput(inputId = "v_t2_value", 
                                                 label = "selected variable", 
                                                 choices = vital, 
                                                 selected = "heart_rate", 
                                                 options = list(`live-search` = TRUE))
                              )
                       ), 
                       column(width = 2, style = "padding-top: 50px;",
                              actionBttn(inputId = "v_t2_select", 
                                         label = "Select", 
                                         style = "fill", 
                                         color = "success", 
                                         icon = icon("check"), size = "sm") 
                       ),
                       conditionalPanel(condition = "input.v_t2_select < 1",
                                        column(width = 12,
                                               br(), 
                                               wellPanel(
                                                 HTML("<h1>Analysis between two key outcomes<h1>"),
                                                 HTML("<h4>
                                                      Please try to interact with images!
                                                      <h4>")
                                               )
                                        )
                       ),
                       ##-- Outputs ----
                       column(width = 12,
                              conditionalPanel(condition = "input.v_t2_select > 0",
                                               HTML("<center><h1>density plot compare</h1></center>"),
                                               column(width = 12,
                                                      withSpinner(plotlyOutput("v_t2_plot"), type = 6)
                                               )           
                              )
                              
                       )
)