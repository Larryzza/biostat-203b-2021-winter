function(input, output) {
  output$scatterPlot <- renderPlotly({plot_ly(d, 
                                              x = ~carat, 
                                              y = ~price, 
                                              color = ~carat,
                                              size = ~carat, 
                                              text = ~paste("Clarity: ", clarity))})
    
}