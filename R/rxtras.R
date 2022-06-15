#' rxtras package
#'
#' Extra functions and addins that you might find useful.
#'
#' @name rxtras
#' @docType package
#' @import methods ggplot2
#'
"_PACKAGE"
.onAttach <- function(libname, pkgname) {
  ggplot2_settings_on()
}


#' @title Set options for ggplot2
#'
#' @description Set theme to theme science and colors and fill.
#' @export
#'
ggplot2_settings_on <- function() {
  theme_set(theme_science())
  options(ggplot2.discrete.fill = color_scheme)
  options(ggplot2.discrete.color = color_scheme)
  return(invisible())
}
