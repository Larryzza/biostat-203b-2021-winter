observeEvent(input$navbar,{
  if(input$navbar == "home"){
    sendSweetAlert(
      session = session,
      title = "welcome to the MIMIC-IV data explorer!",
      text = HTML("Click here to see more details of the data set:
                  <form action='https://physionet.org/content/mimiciv/0.4/'>
                  <i class='fa fa-arrow-right'></i>
                  <input type='submit' value='MIMIC-IV' />
                  <i class='fa fa-arrow-left'></i>
                  </form> From the data provider"),
      type = "info", 
      html = TRUE,
      closeOnClickOutside = TRUE
    )
  }
})


observeEvent(input$h_t1,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "demographic")
})
observeEvent(input$h_t2,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "Lab")
})
observeEvent(input$h_t3,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "Vital")
})
