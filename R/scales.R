#' Science Discrete Color Scales
#' @param palette Name of the palette. If NULL, uses the palette from the current theme.
#' @param ... other arguments passed to discrete_scale
#' @rdname scale_science
#' @export
scale_colour_science <- function(palette = "adj_colorblind", ...) {
  if (!is.null(palette)) validate_palette(palette)
  ggplot2::discrete_scale(
    aesthetics = "colour",
    palette = science_pal(palette),
    ...
  )
}

#' @rdname scale_science
#' @export
scale_color_science <- scale_colour_science

#' @rdname scale_science
#' @export
scale_fill_science <- function(palette = "adj_colorblind", ...) {
  if (!is.null(palette)) validate_palette(palette)
  ggplot2::discrete_scale(
    aesthetics = "fill",
    palette = science_pal(palette),
    ...
  )
}

#' Science Diverging Color Scale
#' @param palette Name of the palette.
#' @param ... other arguments passed to scale_colour_gradient2
#' @rdname scale_science_div
#' @export
scale_colour_science_div <- function(palette = "adj_colorblind", ...) {
  validate_palette(palette)
  cols <- science_gradient_colors[[palette]]
  ggplot2::scale_colour_gradient2(low = cols$low, mid = cols$mid, high = cols$high, ...)
}

#' @rdname scale_science_div
#' @export
scale_color_science_div <- scale_colour_science_div

#' @rdname scale_science_div
#' @export
scale_fill_science_div <- function(palette = "adj_colorblind", ...) {
  validate_palette(palette)
  cols <- science_gradient_colors[[palette]]
  ggplot2::scale_fill_gradient2(low = cols$low, mid = cols$mid, high = cols$high, ...)
}

#' Science Sequential Color Scale
#' @param palette Name of the palette.
#' @param ... other arguments passed to scale_colour_gradient
#' @rdname scale_science_seq
#' @export
scale_colour_science_seq <- function(palette = "adj_colorblind", ...) {
  validate_palette(palette)
  cols <- science_gradient_colors[[palette]]
  ggplot2::scale_colour_gradient(low = cols$mid, high = cols$high, ...)
}

#' @rdname scale_science_seq
#' @export
scale_color_science_seq <- scale_colour_science_seq

#' @rdname scale_science_seq
#' @export
scale_fill_science_seq <- function(palette = "adj_colorblind", ...) {
  validate_palette(palette)
  cols <- science_gradient_colors[[palette]]
  ggplot2::scale_fill_gradient(low = cols$mid, high = cols$high, ...)
}

# Helper for null default
`%||%` <- function(a, b) if (!is.null(a)) a else b