home <- tabPanel(title = "Home", 
                 value = "home",
                 hr(),
                 br(), br(),
                 HTML("<h1><center>WELCOME TO <b>MIMIC-IV</b> data analysis
                      WEBPAGE</center></h1>"),
                 br(), br(), br(), br(),
                 column(width = 3, align = "center",
                        tab_zza(texto = "General analysis", 
                                     cor = cores[1], 
                                     icon = "icon.png", 
                                     id = "analise_geral")
                        ),
                 column(width = 3, align = "center",
                        tab_zza(texto = "Party analysis", 
                                     cor = cores[2], 
                                     icon = "icon.png", 
                                     id = "analise_partidos")
                 ),
                 column(width = 3, align = "center",
                        tab_zza(texto = "Candidates", 
                                     cor = cores[3], 
                                     icon = "icon.png", 
                                     id = "analise_candidatos")
                 ),
                 column(width = 3, align = "center",
                        tab_zza(texto = "About us", 
                                     cor = cores[4], 
                                     icon = "icon.png", 
                                     id = "sobre")
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
