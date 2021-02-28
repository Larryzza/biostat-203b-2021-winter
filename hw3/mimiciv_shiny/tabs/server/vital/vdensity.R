
v_t2_data <- eventReactive(input$v_t2_select, {
  
  x <- isolate(input$v_t2_value)
  
  all_coligation <- select(icu_cohort,c(x,death_30))
  
  names(all_coligation) <- c("x", "death_30")
  
  return(all_coligation = all_coligation)
})


output$v_t2_plot <- renderPlotly({
  df <- v_t2_data()
  na.num <- which(is.na(df$x)==T) %>% length
  
  df %>%
    filter(is.na(x)==F) %>%
    filter(x <= quantile(df$x , 0.975, na.rm=T),
           x >= quantile(df$x , 0.025, na.rm=T)) -> df
  
  d1 <- df %>%
    filter(death_30=="Yes")
  d2 <- df %>%
    filter(death_30=="No") 
  density1 <- density(d1$x)
  density2 <- density(d2$x)
  
  plot_ly(x = ~density1$x, 
                 y = ~density1$y, 
                 type = 'scatter', 
                 mode = 'lines', 
                 name = 'Death within 30 days', 
                 fill = 'tozeroy') %>% 
    add_trace(x = ~density2$x, 
              y = ~density2$y, 
              name = 'Survive longer than 30 days', 
              fill = 'tozeroy') %>% 
    layout(title = paste0("missing value: ",na.num),
           xaxis = list(title = ''),
           yaxis = list(title = 'Density'))
})