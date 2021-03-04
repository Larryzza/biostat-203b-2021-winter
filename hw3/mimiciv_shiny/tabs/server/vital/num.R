
v_t4_data <- eventReactive(input$v_t4_select, {
  
  x <- isolate(input$v_t4_type)
  
  all_coligation <- icu_cohort %>% select(vital, x) %>%  
    rename("group" = x)

  return(all_coligation = all_coligation)
})

output$v_t4_ns <- renderDataTable({
  df <- v_t4_data()
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


