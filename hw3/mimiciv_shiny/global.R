library(DT)
library(shiny)
library(dplyr)
library(plotly)
library(tableone)
library(data.table)
library(tidyverse)
library(shinydashboard)
library(shinyWidgets)
library(shinycssloaders)
library(wesanderson)

cores <- wes_palette("BottleRocket1", 5)[3:5]

icu_cohort <- readRDS("icu_cohort.rds")

icu_cohort <- icu_cohort %>% mutate_at(vars(hospital_expire_flag), as.factor)

tab_zza <- function(texto, cor, icon, id){
  HTML(paste0('<a id="', id,'" href="#" class="action-button">
                  <div class = "voronoys-block" style = "background-color:', cor, ';"> 
                  <span class = "name">', texto, '</span>
                  <div class="img_block">
                    <div class="img_block_conteiner">
                      <img src="img/',icon,'">
                    </div>
                  </div>
              </div></a>'))
}

demo <- c("first_careunit", "last_careunit", "gender", "anchor_age", 
  "anchor_year_group",  "los", "admission_type", "admission_location", 
  "discharge_location", "ethnicity", "edregtime", 
  "insurance", "language", "marital_status", "anchor_year", 
  "edouttime", "hospital_expire_flag", "age_at_adm")

demo_groups <- icu_cohort[,demo] %>% select_if(is.character) %>% names()
demo_value <- icu_cohort[,demo] %>% select_if(is.numeric) %>% names()

lab <- c("bicarbonate", "calcium", "chloride", 
           "creatinine", "glucose", "magnesium", 
           "potassium", "sodium", "hematocrit", "wbc", "lactate")
vital <- c("heart_rate", "non_invasive_blood_pressure_systolic", 
           "non_invasive_blood_pressure_mean", 
           "respiratory_rate", "temperature_fahrenheit", 
           "arterial_blood_pressure_systolic", 
           "arterial_blood_pressure_mean")

tab_files <- list.files(path = "tabs", full.names = T, recursive = T)
tab_files <- tab_files[-grep(x = tab_files, pattern = "server")]

suppressMessages(lapply(tab_files, source))
