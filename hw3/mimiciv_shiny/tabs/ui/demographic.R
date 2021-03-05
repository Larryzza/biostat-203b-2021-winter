tab_files <- list.files(path = "tabs/ui/demographic", full.names = T)
suppressMessages(lapply(tab_files, source))

demographic <- tabPanel(title = "demographic", 
                    value = "demographic",
                    hr(),
                     tabsetPanel(
                       d_num,
                       d_geral,
                       d_group
                     )
)