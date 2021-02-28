
d_t3_data <- eventReactive(input$d_t3_select, {
  
  x <- isolate(input$d_t3_valuex)
  y <- isolate(input$d_t3_sub)
  z <- isolate(input$d_t3_valuey)
  
  if(y=="death30") icu_cohort <- subset(icu_cohort, death_30=="Yes")
  
  all_coligation <- select(icu_cohort,c(x,z))
  
  names(all_coligation) <- c("x", "y")
  
  return(all_coligation = all_coligation)
})


output$d_t3_plot <- renderPlotly({
  df <- d_t3_data()
  na.num <- which(is.na(df$x)==T) %>% length
  
  df %>%
    filter(x <= quantile(df$x , 0.975, na.rm=T),
           x >= quantile(df$x , 0.025, na.rm=T),
           y <= quantile(df$y , 0.975, na.rm=T),
           y >= quantile(df$y , 0.025, na.rm=T)) -> df
  
  plot_ly(df, x = ~x, y = ~y) %>%
    add_trace(type='histogram2dcontour') %>% 
    layout(title = paste0("missing value: ",na.num),
           xaxis = list(title = 'value_x'),
           yaxis = list(title = 'value_y'))
})

