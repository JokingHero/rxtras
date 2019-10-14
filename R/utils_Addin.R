injectHighlightHandler <- function() {

  code <- "
  Shiny.addCustomMessageHandler('highlight-code', function(message) {
  var id = message['id'];
  setTimeout(function() {
  var el = document.getElementById(id);
  hljs.highlightBlock(el);
  }, 100);
  });
  "

  tags$script(code)
}

includeHighlightJs <- function() {
  resources <- system.file("www/shared/highlight", package = "shiny")
  list(
    htmltools::includeScript(file.path(resources, "highlight.pack.js")),
    htmltools::includeCSS(file.path(resources, "rstudio.css")),
    injectHighlightHandler()
  )
}

highlightCode <- function(session, id) {
  session$sendCustomMessage("highlight-code", list(id = id))
}

rCodeContainer <- function(...) {
  code <- htmltools::HTML(as.character(tags$code(class = "language-r", ...)))
  htmltools::div(htmltools::pre(code))
}

renderCode <- function(expr, env = parent.frame(), quoted = FALSE) {
  func <- NULL
  shiny::installExprFunction(expr, "func", env, quoted)
  shiny::markRenderFunction(textOutput, function() {
    paste(func(), collapse = "\n")
  })
}

stableColumnLayout <- function(...) {
  dots <- list(...)
  n <- length(dots)
  width <- 12 / n
  class <- sprintf("col-xs-%s col-md-%s", width, width)
  shiny::fluidRow(
    lapply(dots, function(el) {
      htmltools::div(class = class, el)
    })
  )
}

isErrorMessage <- function(object) {
  inherits(object, "error_message")
}

errorMessage <- function(type, message) {
  structure(
    list(type = type, message = message),
    class = "error_message"
  )
}