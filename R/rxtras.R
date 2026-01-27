#' rxtras package
#'
#' Extra functions and addins that you might find useful.
#'
#' @name rxtras
#' @docType package
#' @import methods scales ggplot2
#'
"_PACKAGE"

.onAttach <- function(libname, pkgname) {
  packageStartupMessage("rxtras attached. Use ggplot2_settings_off() to disable theme and scales.")
}


#' @title Set options for ggplot2
#'
#' @description Set default ggplot2 theme to theme_science and default discrete scales to science palettes.
#' @export
#'
ggplot2_settings_on <- function() {
  ggplot2::theme_set(theme_science())

  # Set default discrete scales
  options(ggplot2.discrete.colour = scale_colour_science)
  options(ggplot2.discrete.fill = scale_fill_science)

  # Set default continuous scales
  options(ggplot2.continuous.colour = scale_colour_science_div)
  options(ggplot2.continuous.fill = scale_fill_science_div)

  return(invisible())
}

#' @title Reset options for ggplot2
#' @description Reset ggplot2 theme and scales to defaults.
#' @export
ggplot2_settings_off <- function() {
  ggplot2::theme_set(ggplot2::theme_grey())
  options(ggplot2.discrete.colour = NULL)
  options(ggplot2.discrete.fill = NULL)
  options(ggplot2.continuous.colour = NULL)
  options(ggplot2.continuous.fill = NULL)
  return(invisible())
}