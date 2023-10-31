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
      column(8,
             shiny::uiOutput(ns("DNA"))
             ),
      column(4,
               actionButton(
                  ns("generate"),
                  label="Generate a random DNA sample",
                  value=""
                  )
               )
    ),
    shiny::verbatimTextOutput(outputId = ns("peptide")) |>
    shiny::tagAppendAttributes(style = "white-space: pre-wrap;")

  )
}

#' mod_SequenceHandler Server Functions
#'
#' @importFrom BioSeqR replicate
#' @noRd
mod_SequenceHandler_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
      output$DNA <- renderText({
        if(input$generate != 0)
        replicate(20)
        }
      )
  })
}

## To be copied in the server
# mod_SequenceHandler_ui("mod_SequenceHandler_1")

## To be copied in the server
# mod_SequenceHandler_server("mod_SequenceHandler_1")
