tab_files <- list.files(path = "tabs/ui/lab", full.names = T)
suppressMessages(lapply(tab_files, source))

Lab <- tabPanel(title = "Lab", 
                     value = "Lab",
                     hr(),
                     tabsetPanel(
                       lab_des,
                       lab_num,
                       Lab_grouping,
                       lab_correlation
                     )
)