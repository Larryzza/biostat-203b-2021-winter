d_num <- tabPanel(title = "descriptive summary", 
                    value = "d_num",
                    column(width = 10,
                           column(width = 2,
                                  pickerInput(inputId = "d_t4_type", 
                                              label = "selected variable", 
                                              choices = demo, 
                                              selected = "ethnicity", 
                                              options = list(`live-search` = TRUE))
                           )
                    ),
                    column(width = 2, style = "padding-top: 50px;",
                           actionBttn(inputId = "d_t4_select", 
                                      label = "Select", 
                                      style = "fill", 
                                      color = "success", 
                                      icon = icon("check"), size = "sm") 
                    ),
                    conditionalPanel(condition = "input.d_t4_select < 1",
                                     column(width = 12,
                                            br(), 
                                            wellPanel(
                                              HTML("<h1>Demographic information plot<h1>"),
                                              HTML("<h4>
                                                         Choose the variable you would like to explore. 
                                                         Then decide to keep either all data set or only death within 30 day cases. 
                                                         Click 'Select' button to plot. <br>
                                                         <b>Please try to interact with images to 
                                                    find out more numerical summaries!</b>
                                                         <h4>")
                                            )
                                     )
                    ),
                    column(width = 12,
                                  conditionalPanel(condition = "input.d_t1_select > 0",
                                                   br(), hr(), br(),
                                                   HTML("<center><h1>Numerical Summaries</h1></center>"),
                                                   column(width = 12,
                                                          withSpinner(verbatimTextOutput("d_t4_ns"), type = 6)
                                                   )           
                                  )
                    )
)