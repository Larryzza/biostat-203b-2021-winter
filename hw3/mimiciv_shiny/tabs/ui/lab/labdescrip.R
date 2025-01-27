lab_des <- tabPanel(title = "General information", 
                        value = "lab_des",
                        column(width = 10,
                               column(width = 2,
                                      pickerInput(inputId = "lab_t1_value", 
                                                  label = "selected variable", 
                                                  choices = lab, 
                                                  selected = "chloride", 
                                                  options = list(`live-search` = TRUE))
                               ),
                               column(width = 2,
                                      pickerInput(inputId = "lab_t1_group", 
                                                  label = "group by", 
                                                  choices = demo_groups, 
                                                  selected = "insurance",
                                                  options = list(`live-search` = TRUE))
                               ),
                               column(width = 2,
                                      pickerInput(inputId = "lab_t1_sub", 
                                                  label = "keep", 
                                                  choices = c("all", "death30"), 
                                                  selected = "all",
                                                  options = list(`live-search` = TRUE))
                               )
                        ), 
                        column(width = 2, style = "padding-top: 50px;",
                               actionBttn(inputId = "lab_t1_select", 
                                          label = "Select", 
                                          style = "fill", 
                                          color = "success", 
                                          icon = icon("check"), size = "sm") 
                        ),
                        conditionalPanel(condition = "input.lab_t1_select < 1",
                                         column(width = 12,
                                                br(), 
                                                wellPanel(
                                                  HTML("<h1>Lab information analysis<h1>"),
                                                  HTML("<h4>
                                                    Choose the variable you would like to explore.
                                                    Also select the criteria to group the data set. 
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
                                      conditionalPanel(condition = "input.lab_t1_select > 0",
                                                       HTML("<center><h1>Box plot by groups</h1></center>"),
                                                       column(width = 12,
                                                              withSpinner(plotlyOutput("lab_t1_plot1"), type = 6)
                                                       )           
                                      )
                                      
                               ),
                               column(width = 6,
                                      conditionalPanel(condition = "input.lab_t1_select > 0",
                                                       HTML("<center><h1>Density plot for all</h1></center>"),
                                                       column(width = 12,
                                                              withSpinner(plotlyOutput("lab_t1_plot2"), type = 6)
                                                       )           
                                      )
                                      
                               )
                               
                        )
)