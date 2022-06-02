#' rxtras package
#'
#' Extra functions and addins that you might find useful.
#'
#' @name rxtras
#' @docType package
#' @import methods shiny miniUI rstudioapi ggplot2
#'
"_PACKAGE"
.onAttach <- function(libname, pkgname) {
  theme_set(theme_science())
  options(ggplot2.discrete.fill = color_scheme)
  options(ggplot2.discrete.color = color_scheme)
}
