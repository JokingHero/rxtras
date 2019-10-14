#' Find all TODO comments in a current Project
#'
#' Call this as an addin to find all comments with TODO, make list of them,
#' click on them ponts to clicked TODO location.
#'
#' @export
#'
TODO <- function() {

  ui <- miniUI::miniPage(

    includeHighlightJs(),
    miniUI::gadgetTitleBar("TODO"),
    miniUI::miniContentPanel(
      htmltools::h4("Found TODOs."),
      htmltools::hr(),
      stableColumnLayout(
        shiny::checkboxInput("boundaries", "Use Word Boundaries?", value = TRUE),
        shiny::uiOutput("changes")
      ),
      stableColumnLayout(
        shiny::textInput("from", "From:"),
        shiny::textInput("to", "To:")
      ),
      shiny::uiOutput("document", container = rCodeContainer)
    )
  )

  server <- function(input, output, session) {

    context <- rstudioapi::getActiveDocumentContext()
    original <- context$contents

    reactiveRefactor <- shiny::reactive({

      from <- input$from
      to <- input$to
      boundaries <- input$boundaries

      valid <- nzchar(from) && nzchar(to)
      if (valid)
        return(performRefactor(original, from, to, boundaries))
      else
        return(list(refactored = original, changes = 0))

    })

    output$changes <- shiny::renderUI({
      spec <- reactiveRefactor()
      if (spec$changes == 0)
        return(htmltools::div("No changes to be made."))

      instances <- if (spec$changes == 1) "instance" else "instances"
      htmltools::div(paste(spec$changes, instances, "will be replaced."))
    })

    output$document <- renderCode({
      spec <- reactiveRefactor()
      highlightCode(session, "document")
      paste(spec$refactored, collapse = "\n")
    })

    shiny::observeEvent(input$done, {
      spec <- reactiveRefactor()
      transformed <- paste(spec$refactored, collapse = "\n")
      rstudioapi::setDocumentContents(transformed, id = context$id)
      invisible(shiny::stopApp())
    })

  }

  viewer <- shiny::dialogViewer("Find and Replace", width = 1000, height = 800)
  shiny::runGadget(ui, server, viewer = viewer)
}

performRefactor <- function(contents, from, to, useWordBoundaries = TRUE) {

  reFrom <- if (useWordBoundaries)
    paste("\\b", from, "\\b", sep = "")
  else
    from

  reTo <- to
  matches <- gregexpr(reFrom, contents, perl = TRUE)
  changes <- sum(unlist(lapply(matches, function(x) {
    if (x[[1]] == -1) 0 else length(x)
  })))

  refactored <- unlist(lapply(contents, function(x) {
    gsub(reFrom, reTo, x, perl = TRUE)
  }))

  list(
    refactored = refactored,
    changes = changes
  )
}