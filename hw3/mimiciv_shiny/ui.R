library(shiny)
library(dplyr)
library(data.table)
library(shinydashboard)
library(shinyWidgets)
library(shinycssloaders)

# Define UI for application that draws a histogram
shinyUI(
    fluidPage(
        ##-- Favicon ----
        tags$head(
            tags$link(rel = "shortcut icon", href = "img/icon.png"),
            #-- biblio js ----
            tags$link(rel="stylesheet", type = "text/css",
                      href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"),
            tags$link(rel="stylesheet", type = "text/css",
                      href = "https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro")
        ),
        ##-- Logo ----
        list(tags$head(HTML('<link rel="icon", href="img/icon.png",
                        type="image/png" />'))),
        div(style="padding: 1px 0px; width: '100%'",
            titlePanel(
                title="", windowTitle = "zza"
            )
        ),
        ##-- Header ----
        navbarPage(title = div(img(src="img/icon.png",
                                   height = "75px"), 
                               style = "padding-left:100px;"),
                   id = "navbar",
                   selected = "home",
                   theme = "styles.css", 
                   fluid = T,
                   ##-- Abas ----
                   home
        ),
        ##-- Footer ----
        div(class = "footer",
            includeHTML("html/footer.html"))
    )
)