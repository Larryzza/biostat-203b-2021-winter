d_correlation <- tabPanel(title = "Correlation", 
                          value = "d_correlation",
                          column(width = 10,
                                 column(width = 2,
                                        pickerInput(inputId = "d_t3_valuex", 
                                                    label = "value_x", 
                                                    choices = demo_value, 
                                                    selected = "los", 
                                                    options = list(`live-search` = TRUE))
                                 ),
                                 column(width = 2,
                                        pickerInput(inputId = "d_t3_valuey", 
                                                    label = "value_y", 
                                                    choices = "age_at_adm", 
                                                    selected = NULL,
                                                    options = list(`live-search` = TRUE))
                                 ),
                                 column(width = 2,
                                        pickerInput(inputId = "d_t3_sub", 
                                                    label = "keep", 
                                                    choices = c("all", "death30"), 
                                                    selected = "all",
                                                    options = list(`live-search` = TRUE))
                                 )
                          ), 
                          column(width = 2, style = "padding-top: 50px;",
                                 actionBttn(inputId = "d_t3_select", 
                                            label = "Select", 
                                            style = "fill", 
                                            color = "success", 
                                            icon = icon("check"), size = "sm") 
                          ),
                          conditionalPanel(condition = "input.d_t3_select < 1",
                                           column(width = 12,
                                                  br(), 
                                                  wellPanel(
                                                    HTML("<h1>2 Variables density plot<h1>"),
                                                    HTML("<h4>
                                                          Please try to interact with images!
                                                          <h4>")
                                                  )
                                           )
                          ),
                          ##-- Outputs ----
                          column(width = 12,
                                 conditionalPanel(condition = "input.d_t3_select > 0",
                                                  HTML("<center><h1>2 Variables density plot</h1></center>"),
                                                  column(width = 12,
                                                         withSpinner(plotlyOutput("d_t3_plot"), type = 6)
                                                  )           
                                 )
                                 
                          )
)