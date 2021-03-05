shinyUI(
  fluidPage(
    tags$head(
      tags$link(rel = "shortcut icon", href = "img/zzapic.jpg"),
      
      tags$link(rel="stylesheet", type = "text/css",
                href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"),
      tags$link(rel="stylesheet", type = "text/css",
                href = "https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro")
    ),
    ##-- Logo ----
    list(tags$head(HTML('<link rel="icon", href="img/zzapic.jpg",
                        type="image/png" />'))),
    div(style="padding: 1px 0px; width: '100%'",
        titlePanel(
          title="", windowTitle = "MIMIC-IV EXPLORER"
        )
    ),
    ##-- Header ----
    navbarPage(title = div(img(src="img/zzapic.jpg",
                               height = "75px"), style = "padding-left:100px;"),
               id = "navbar",
               selected = "home",
               theme = "styles.css", 
               fluid = T,
               home,
               demographic,
               Lab,
               Vital
    ),
    ##-- Footer ----
    div(class = "footer",
        includeHTML("html/footer.html")
    )
  )
)