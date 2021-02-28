home <- tabPanel(title = "Home", 
                 value = "home",
                 hr(),
                 br(), br(),
                 HTML("<h1><center>WELCOME TO <b>MIMIC-IV</b> data analysis
                      WEBPAGE</center></h1>"),
                 br(), br(), br(), br(),
                 column(width = 4, align = "center",
                        tab_zza(texto = "General analysis", cor = cores[1], icon = "brasil.png", id = "h_t1")
                        ),
                 column(width = 4, align = "center",
                        tab_zza(texto = "Lab data analysis", cor = cores[2], icon = "flag.png", id = "h_t2")
                 ),
                 column(width = 4, align = "center",
                        tab_zza(texto = "Vital data analysis", cor = cores[3], icon = "person.png", id = "h_t3")
                 ),
                 column(width = 12,
                        br(), br(), br(), br(),
                        wellPanel(
                          HTML("<h1><b>MIMIC-IV</b></h1>"),
                          HTML("<h4><b>MIMIC-IV</b> is a Database of patients 
                          admitted to the Beth Israel Deaconess 
                               Medical Center</h4>")
                        )
                 )
)
