tab_files <- list.files(path = "tabs/ui/lab", full.names = T)
suppressMessages(lapply(tab_files, source))

Lab <- tabPanel(title = "Lab", 
                     value = "Lab",
                     hr(),
                     tabsetPanel(
                       eleicoes_uf,
                       Lab_grouping,
                       lab_correlation
                     )
)