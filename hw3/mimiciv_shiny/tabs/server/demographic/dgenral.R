
d_t1_data <- eventReactive(input$d_t1_select, {
  
  x <- isolate(input$d_t1_type)
  y <- isolate(input$d_t1_sub)
    
  if(y=="death30") icu_cohort <- subset(icu_cohort, death_30=="Yes")
  
  all_coligation <- select(icu_cohort,c(x, death_30))
  names(all_coligation) <- c("type", "death_30")
  
  return(all_coligation = all_coligation)
})


output$d_t1_plot <- renderPlotly({
  df <- d_t1_data()
  na.num <- which(is.na(df$type)==T) %>% length
  
  if(unique(df$type) %>% length > 30){
    if(length(which(df$death_30=="No"))>0){
       df %>%
        filter(is.na(type)==F) %>%
        filter(type <= quantile(df$type , 0.975, na.rm=T),
               type >= quantile(df$type , 0.025, na.rm=T)) -> df
      
      d1 <- df %>%
        filter(death_30=="Yes")
      d2 <- df %>%
        filter(death_30=="No") 
      density1 <- density(d1$type)
      density2 <- density(d2$type)
      
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
               xaxis = list(title = 'selected variable'),
               yaxis = list(title = 'Density'))
    }else{
       p <- ggplot(df, aes(x = type)) +
      stat_density(position="identity",geom="line") + theme_classic()
    ggplotly(p) %>% 
      layout(title = paste0("missing value: ",na.num),
             xaxis = list(showgrid = FALSE, 
                          zeroline = FALSE, 
                          showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, 
                          zeroline = FALSE, 
                          showticklabels = FALSE))
    }
  } else{
    df %>% 
      group_by(type) %>% summarize(count = n()) %>% 
      plot_ly(labels = ~type, values = ~count) %>% add_pie(hole = 0.6) %>% 
      layout(title = paste0("missing value: ",na.num),  showlegend = T,
             xaxis = list(showgrid = FALSE, 
                          zeroline = FALSE, 
                          showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, 
                          zeroline = FALSE, 
                          showticklabels = FALSE))
  }
})

output$d_t1_ns <- renderPrint({
  df <- d_t1_data()
  
  if(unique(df$type) %>% length > 30){
    df$type %>% summary()
  } else {
    df$type %>% as.factor() %>% summary()
  }
})
