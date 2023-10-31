#' mod_SequenceHandler UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList uiOutput verbatimTextOutput tagAppendAttributes
mod_SequenceHandler_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8,
             uiOutput(ns("DNA"))
             ),
      column(4,
               actionButton(
                  ns("generate"),
                  label="Generate a random DNA sample",
                  value=""
                  )
               )
    ),
    verbatimTextOutput(outputId = ns("peptide")) |>
    tagAppendAttributes(style = "white-space: pre-wrap;")

  )
}

#' mod_SequenceHandler Server Functions
#'
#' @importFrom BioSeqR replicate
#' @noRd
mod_SequenceHandler_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    dna <- reactiveVal()

    output$DNA <- renderUI({
      textAreaInput(
        inputId = ns("DNA"),
        label = "DNA sequence",
        placeholder = "Insert DNA sequence",
        value = dna(),
        height = 100,
        width = 600
      )
    })

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
