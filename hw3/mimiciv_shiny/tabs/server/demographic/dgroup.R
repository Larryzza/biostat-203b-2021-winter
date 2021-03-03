
d_t2_data <- eventReactive(input$d_t2_select, {
  
  x <- isolate(input$d_t2_value)
  y <- isolate(input$d_t2_sub)
  z <- isolate(input$d_t2_group)
  
  if(y=="death30") icu_cohort <- subset(icu_cohort, death_30=="Yes")
  
  all_coligation <- select(icu_cohort,c(x,z))
  
  names(all_coligation) <- c("type","group")
  
  return(all_coligation = all_coligation)
})


output$d_t2_plot <- renderPlotly({
  df <- d_t2_data()
  na.num <- which(is.na(df$type)==T) %>% length
  
  if(unique(df$type) %>% length > 30){
    df %>%
      filter(is.na(type)==F) %>%
      filter(type <= quantile(df$type , 0.975, na.rm=T),
             type >= quantile(df$type , 0.025, na.rm=T)) -> df
    
    plot_ly(df, x = ~type, color = ~group, type = "box") %>% 
    layout(title = paste0("missing value: ",na.num),
           xaxis = list(title = ''))
  }else{
     plot_ly(df, x = ~type, color = ~group) %>%
    add_histogram() %>% 
      layout(title = paste0("missing value: ",na.num),
             xaxis = list(title = ''))
  }
})

