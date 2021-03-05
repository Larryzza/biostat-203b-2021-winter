v_correlation <- tabPanel(title = "Correlation", 
                          value = "v_correlation",
                          column(width = 10,
                                 column(width = 2,
                                        pickerInput(inputId = "v_t3_valuex", 
                                                    label = "value_x", 
                                                    choices = vital, 
                                                    selected = "heart_rate" , 
                                                    options = list(`live-search` = TRUE))
                                 ),
                                 column(width = 2,
                                        pickerInput(inputId = "v_t3_valuey", 
                                                    label = "value_y", 
                                                    choices = vital, 
                                                    selected = "non_invasive_blood_pressure_systolic" ,
                                                    options = list(`live-search` = TRUE))
                                 ),
                                 column(width = 2,
                                        pickerInput(inputId = "v_t3_sub", 
                                                    label = "keep", 
                                                    choices = c("all", "death30"), 
                                                    selected = "all",
                                                    options = list(`live-search` = TRUE))
                                 )
                          ), 
                          column(width = 2, style = "padding-top: 50px;",
                                 actionBttn(inputId = "v_t3_select", 
                                            label = "Select", 
                                            style = "fill", 
                                            color = "success", 
                                            icon = icon("check"), size = "sm") 
                          ),
                          conditionalPanel(condition = "input.v_t3_select < 1",
                                           column(width = 12,
                                                  br(), 
                                                  wellPanel(
                                                    HTML("<h1>2 variables density plot<h1>"),
                                                    HTML("<h4>
                                                          Choose two variables you would like to explore.
                                                    Then decide to keep either all data set or only death within 30 day cases. 
                                                    Click 'Select' button to plot. <br>
                                                    <b>Please try to interact with images to 
                                                    find out more numerical summaries!</b>
                                                           <h4>")
                                                  )
                                           )
                          ),
                          ##-- Outputs ----
                          column(width = 12,
                                 column(width = 6,
                                        conditionalPanel(condition = "input.v_t3_select > 0",
                                                         HTML("<center><h1>2 Variables density plot</h1></center>"),
                                                         column(width = 12,
                                                                withSpinner(plotlyOutput("v_t3_plot1"), type = 6)
                                                         )           
                                        )
                                 ),
                                 column(width = 6,
                                        conditionalPanel(condition = "input.v_t3_select > 0",
                                                         HTML("<center><h1>2 Variables Scatter plot</h1></center>"),
                                                         column(width = 12,
                                                                withSpinner(plotlyOutput("v_t3_plot2"), type = 6)
                                                         )           
                                        )
                                 )
                          )
)