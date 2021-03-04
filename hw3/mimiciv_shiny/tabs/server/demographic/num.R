
d_t1_data <- eventReactive(input$d_t1_select, {
  
  x <- isolate(input$d_t1_type)
  y <- isolate(input$d_t1_sub)
  
  if(y=="death30") icu_cohort <- subset(icu_cohort, death_30=="Yes")
  
  all_coligation <- select(icu_cohort,c(x, death_30))
  names(all_coligation) <- c("type", "death_30")
  
  return(all_coligation = all_coligation)
})

output$d_t1_ns <- renderPrint({
  df <- d_t1_data()
  
  if(unique(df$type) %>% length > 30){
    df$type %>% summary()
  } else {
    df$type %>% as.factor() %>% summary()
  }
})
