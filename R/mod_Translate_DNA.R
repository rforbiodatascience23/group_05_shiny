#' Translate_DNA UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Translate_DNA_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' Translate_DNA Server Functions
#'
#' @noRd 
mod_Translate_DNA_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_Translate_DNA_ui("Translate_DNA_1")
    
## To be copied in the server
# mod_Translate_DNA_server("Translate_DNA_1")
