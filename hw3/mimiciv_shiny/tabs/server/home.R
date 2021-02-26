observeEvent(input$navbar,{
  if(input$navbar == "home"){
    sendSweetAlert(
      session = session,
      title = "welcome!",
      text = HTML("Click here and see more details of the data set:
                  <form action='https://physionet.org/content/mimiciv/0.4/'>
                  <i class='fa fa-arrow-right'></i>
                  <input type='submit' value='MIMIC-IV' />
                  <i class='fa fa-arrow-left'></i>
                  </form> From the data provider"),
      type = "info", 
      html = TRUE,
      closeOnClickOutside = FALSE
    )
  }
})

##-- + Atualizando abas conforme os cliques ----
observeEvent(input$analise_geral,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "eleicoes")
})
observeEvent(input$analise_partidos,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "partidos")
})
observeEvent(input$analise_candidatos,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "candidatos")
})
observeEvent(input$sobre,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "sobre")
})
observeEvent(input$link_info,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "candidatos_perfil_eleitorado")
  closeSweetAlert(session = session)
})