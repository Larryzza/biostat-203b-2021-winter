tab_files <- list.files(path = "tabs/ui/vital", full.names = T)
suppressMessages(lapply(tab_files, source))

Vital <- tabPanel(title = "Vital", 
                      value = "Vital",
                      hr(),
                      tabsetPanel(
                        v_infor,
                        v_grouping,
                        v_correlation
                      )
)