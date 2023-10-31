#' AAPlot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_AAPlot_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' AAPlot Server Functions
#'
#' @noRd 
mod_AAPlot_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_AAPlot_ui("AAPlot_1")
    
## To be copied in the server
# mod_AAPlot_server("AAPlot_1")
