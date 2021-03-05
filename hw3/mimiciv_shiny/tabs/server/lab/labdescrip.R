
lab_t1_data <- eventReactive(input$lab_t1_select, {
  
  x <- isolate(input$lab_t1_value)
  y <- isolate(input$lab_t1_sub)
  z <- isolate(input$lab_t1_group)
  
  if(y=="death30") icu_cohort <- subset(icu_cohort, death_30=="Yes")
  
  all_coligation <- select(icu_cohort,c(x,z))
  
  names(all_coligation) <- c("type","group")
  
  return(all_coligation = all_coligation)
})


output$lab_t1_plot1 <- renderPlotly({
  df <- lab_t1_data()
  na.num <- which(is.na(df$type)==T) %>% length
  
  df %>%
    filter(is.na(type)==F) %>%
    filter(type <= quantile(df$type , 0.975, na.rm=T),
           type >= quantile(df$type , 0.025, na.rm=T)) -> df
  
  plot_ly(df, x = ~type, color = ~group, type = "box") %>% 
    layout(title = paste0("missing value: ",na.num),
           xaxis = list(title = ''),
           yaxis = list(showgrid = FALSE, 
                        zeroline = FALSE, 
                        showticklabels = FALSE,
                        title = 'Groups'))
})

output$lab_t1_plot2 <- renderPlotly({
  df <- lab_t1_data()
  na.num <- which(is.na(df$type)==T) %>% length
  
  df %>%
    filter(is.na(type)==F) %>%
    filter(type <= quantile(df$type , 0.975, na.rm=T),
           type >= quantile(df$type , 0.025, na.rm=T)) -> df
  
  density1 <- density(df$type[which(is.na(df$type) == F)])
  
  plot_ly(x = ~density1$x, 
          y = ~density1$y, 
          type = 'scatter', 
          mode = 'lines', 
          name = 'Fair cut', 
          fill = 'tozeroy') %>% 
    layout(title = paste0("missing value: ",na.num),
           xaxis = list(title = ''),
           yaxis = list(title = 'Density'))
})