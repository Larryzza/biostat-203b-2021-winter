v_num <- tabPanel(title = "Descriptive statistics", 
                    value = "v_num",
                    column(width = 10,
                           column(width = 2,
                                  pickerInput(inputId = "v_t4_type", 
                                              label = "Group by", 
                                              choices = c(demo_groups, "death_30"), 
                                              selected = "death_30", 
                                              options = list(`live-search` = TRUE))
                           )
                    ),
                    column(width = 2, style = "padding-top: 50px;",
                           actionBttn(inputId = "v_t4_select", 
                                      label = "Select", 
                                      style = "fill", 
                                      color = "success", 
                                      icon = icon("check"), size = "sm") 
                    ),
                    conditionalPanel(condition = "input.v_t4_select < 1",
                                     column(width = 12,
                                            br(), 
                                            wellPanel(
                                              HTML("<h1>Descriptive statistics<h1>"),
                                              HTML("<h4>
                                                         Choose the group you would like to explore. 
                                                         Click 'Select' button to 
                                                         see descriptive statistics <br>
                                                         <b>For more visualization information, 
                                                         please refer to other panels.</b>
                                                         <h4>")
                                            )
                                     )
                    ),
                    column(width = 12,
                                  conditionalPanel(condition = "input.v_t4_select > 0",
                                                   br(), hr(), br(),
                                                   HTML("<center><h1>Numerical Summaries</h1></center>"),
                                                   column(width = 12,
                                                          withSpinner(dataTableOutput("v_t4_ns"), type = 6)
                                                   )           
                                  )
                    )
)