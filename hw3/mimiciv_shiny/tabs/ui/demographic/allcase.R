allcase <- tabPanel(title = "All case", 
                   value = "allcase",
                   br(), hr(),
                   pickerInput(
                     inputId = "somevalue",
                     label = "A label",
                     choices = c("a", "b")
                   )
)