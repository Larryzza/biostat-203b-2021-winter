
lab_t3_data <- eventReactive(input$lab_t3_select, {
  
  x <- isolate(input$lab_t3_valuex)
  y <- isolate(input$lab_t3_sub)
  z <- isolate(input$lab_t3_valuey)
  
  if(y=="death30") icu_cohort <- subset(icu_cohort, death_30=="Yes")
  
  all_coligation <- select(icu_cohort,c(x,z))
  
  names(all_coligation) <- c("x", "y")
  
  return(all_coligation = all_coligation)
})


output$lab_t3_plot1 <- renderPlotly({
  df <- lab_t3_data()
  na.num <- which(is.na(df$x)==T) %>% length
  
  df %>%
    filter(is.na(x)==F, is.na(y)==F) %>%
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

output$lab_t3_plot2 <- renderPlotly({
  df <- lab_t3_data()
  na.num <- which(is.na(df$x)==T) %>% length
  
  df %>%
    filter(x <= quantile(df$x , 0.975, na.rm=T),
           x >= quantile(df$x , 0.025, na.rm=T),
           y <= quantile(df$y , 0.975, na.rm=T),
           y >= quantile(df$y , 0.025, na.rm=T)) -> df
  
  plot_ly(data = sample_n(df, 7000), x = ~x, y = ~y,
          marker = list(size = 4,
                        color = 'rgba(255, 182, 193, .9)',
                        line = list(color = 'rgba(152, 0, 0, .8)',
                                    width = 1))) %>% 
    layout(title = paste0("missing value: ",na.num),
           yaxis = list(title = 'value_x'),
           xaxis = list(title = 'value_y'))
})
