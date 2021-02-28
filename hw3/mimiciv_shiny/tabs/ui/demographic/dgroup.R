d_group <- tabPanel(title = "Demographic grouping", 
                    value = "d_group",
                    column(width = 10,
                           column(width = 2,
                                  pickerInput(inputId = "d_t2_value", 
                                              label = "selected variable", 
                                              choices = demo, 
                                              selected = "los", 
                                              options = list(`live-search` = TRUE))
                           ),
                           column(width = 2,
                                  pickerInput(inputId = "d_t2_group", 
                                              label = "group by", 
                                              choices = demo_groups, 
                                              selected = "ethnicity",
                                              options = list(`live-search` = TRUE))
                           ),
                           column(width = 2,
                                  pickerInput(inputId = "d_t2_sub", 
                                              label = "Keep", 
                                              choices = c("all", "death30"), 
                                              selected = "all",
                                              options = list(`live-search` = TRUE))
                           )
                    ), 
                    column(width = 2, style = "padding-top: 50px;",
                           actionBttn(inputId = "d_t2_select", 
                                      label = "Select", 
                                      style = "fill", 
                                      color = "success", 
                                      icon = icon("check"), size = "sm") 
                    ),
                    conditionalPanel(condition = "input.d_t2_select < 1",
                                     column(width = 12,
                                            br(), 
                                            wellPanel(
                                              HTML("<h1>Demographic plot by group<h1>"),
                                              HTML("<h4>
                                                    Please try to interact with images!
                                                    <h4>")
                                            )
                                     )
                    ),
                    ##-- Outputs ----
                    column(width = 12,
                           conditionalPanel(condition = "input.d_t2_select > 0",
                                            HTML("<center><h1>Demographic plot by group</h1></center>"),
                                            column(width = 12,
                                                   withSpinner(plotlyOutput("d_t2_plot"), type = 6)
                                            )           
                           )
                           
                    )
)