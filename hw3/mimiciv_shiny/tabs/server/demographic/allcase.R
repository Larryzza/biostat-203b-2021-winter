function(input, output) {
  output$value <- renderPrint(input$somevalue)
}