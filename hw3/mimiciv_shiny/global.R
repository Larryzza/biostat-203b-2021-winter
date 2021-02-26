
cores <- c("#098ebb", "#fdc23a", "#e96449", "#818286")

box_zza <- function(texto, cor){
  HTML(paste('<div class = "box_voronoys" style = "border:1px solid', 
             cor, '; background-color: ', 
             cor, ';">', 
             h3(texto), '</div>'))
}

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

tab_files <- list.files(path = "tabs", 
                        full.names = T, 
                        recursive = T)
tab_files <- tab_files[-grep(x = tab_files, 
                             pattern = "server")]
suppressMessages(lapply(tab_files, source))
