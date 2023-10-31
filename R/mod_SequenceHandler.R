#' mod_SequenceHandler UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_SequenceHandler_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8, "DNA_sequence"),
      column(4, sliderInput(ns("sequence_size", label="Size of the DNA sample")), actionButton(ns("generate"), label="Generate a random DNA sample"))
    ),
    "peptide_sequence"

  )
}

#' mod_SequenceHandler Server Functions
#'
#' @noRd
mod_SequenceHandler_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the server
# mod_SequenceHandler_ui("mod_SequenceHandler_1")

## To be copied in the server
# mod_SequenceHandler_server("mod_SequenceHandler_1")
