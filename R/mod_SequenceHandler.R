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
    sidebarLayout(
      sidebarPanel(
        "DNA_sequence"
      ),
      mainPanel(
        "plot"
      )
    )

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


if(FALSE){ # Testing
  golem::detach_all_attached()
  golem::document_and_reload()
  ui <- mod_SequenceHandler_ui("mod_SequenceHandler_1") # replace NAME here
  server <- function( input,output,session){
    mod_SequenceHandler_server("mod_SequenceHandler_1") # and here
  }
  shiny::shinyApp(ui, server)
}
