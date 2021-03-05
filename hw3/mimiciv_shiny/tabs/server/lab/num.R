
lab_t4_data <- eventReactive(input$lab_t4_select, {
  
  x <- isolate(input$lab_t4_type)
  
  all_coligation <- icu_cohort %>% select(lab, x) %>%  
    rename("group" = x)

  return(all_coligation = all_coligation)
})

output$lab_t4_ns <- renderDataTable({
  df <- lab_t4_data()
  vars<-dput(names(df %>% select(-group)))
  tableOne <- CreateTableOne(vars = vars, strata = "group", 
                             data = df, addOverall = T,
                             testApprox = chisq.test,
                             testExact = fisher.test,
                             testNonNormal = kruskal.test,
                             includeNA = T)
  print(tableOne, nonnormal = T) %>% 
    datatable(., rownames = TRUE)
})


