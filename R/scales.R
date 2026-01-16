#' @title Get Palette from Current Theme
#'
#' @description Reads the palette setting from the current ggplot2 theme.
#' Returns "adj_colorblind" as default if no palette is set.
#'
#' @return Character string with palette name
#'
get_palette_from_theme <- function() {
  theme <- ggplot2::theme_get()
  if (!is.null(theme$.palette)) {
    return(theme$.palette)
  }
  "adj_colorblind"
}

#' @title Validate Palette Parameter
#'
#' @description Validates that the palette parameter is one of the allowed values.
#' Throws an error with helpful message if invalid.
#'
#' @param palette Character string with palette name
#' @return The validated palette name
#'
validate_palette <- function(palette) {
  valid_palettes <- c("adj_colorblind", "pastel", "resurrect")
  if (!palette %in% valid_palettes) {
    stop(paste0("Invalid palette: '", palette, "'. ",
                "Valid options: ", paste(valid_palettes, collapse = ", ")),
         call. = FALSE)
  }
  palette
}

#' @title Science Color Scale for Discrete Data
#'
#' @description Discrete color scale using science palette colors.
#' Automatically uses the palette from the current theme, unless explicitly overridden.
#'
#' @param palette Palette name: "adj_colorblind", "pastel", or "resurrect".
#'   If NULL, reads from current theme.
#' @param ... Additional arguments passed to ggplot2::scale_colour_manual()
#' @return A discrete color scale
#' @export
#'
scale_colour_science <- function(palette = NULL, ...) {
  if (is.null(palette)) {
    palette <- get_palette_from_theme()
  }
  palette <- validate_palette(palette)
  
  max_colors <- 10
  colors <- science_palette(max_colors, palette = palette)
  
  ggplot2::scale_colour_manual(values = colors, ...)
}

#' @title Science Fill Scale for Discrete Data
#'
#' @description Discrete fill scale using science palette colors.
#' Automatically uses the palette from the current theme, unless explicitly overridden.
#'
#' @param palette Palette name: "adj_colorblind", "pastel", or "resurrect".
#'   If NULL, reads from current theme.
#' @param ... Additional arguments passed to ggplot2::scale_fill_manual()
#' @return A discrete fill scale
#' @export
#'
scale_fill_science <- function(palette = NULL, ...) {
  if (is.null(palette)) {
    palette <- get_palette_from_theme()
  }
  palette <- validate_palette(palette)
  
  max_colors <- 10
  colors <- science_palette(max_colors, palette = palette)
  
  ggplot2::scale_fill_manual(values = colors, ...)
}

#' @title Science Diverging Color Scale (3-color)
#'
#' @description Diverging color scale using blue-white-red gradient derived from
#' the science palette colors. Automatically uses the palette from the current
#' theme, unless explicitly overridden.
#'
#' @param palette Palette name: "adj_colorblind", "pastel", or "resurrect".
#'   If NULL, reads from current theme.
#' @param ... Additional arguments passed to ggplot2::scale_colour_gradient2()
#' @return A diverging color scale
#' @export
#'
scale_colour_science_div <- function(palette = NULL, ...) {
  if (is.null(palette)) {
    palette <- get_palette_from_theme()
  }
  palette <- validate_palette(palette)
  
  colors <- science_gradient_colors[[palette]]
  
  ggplot2::scale_colour_gradient2(
    low = colors$low,
    mid = colors$mid,
    high = colors$high,
    ...
  )
}

#' @title Science Diverging Fill Scale (3-color)
#'
#' @description Diverging fill scale using blue-white-red gradient derived from
#' the science palette colors. Automatically uses the palette from the current
#' theme, unless explicitly overridden.
#'
#' @param palette Palette name: "adj_colorblind", "pastel", or "resurrect".
#'   If NULL, reads from current theme.
#' @param ... Additional arguments passed to ggplot2::scale_fill_gradient2()
#' @return A diverging fill scale
#' @export
#'
scale_fill_science_div <- function(palette = NULL, ...) {
  if (is.null(palette)) {
    palette <- get_palette_from_theme()
  }
  palette <- validate_palette(palette)
  
  colors <- science_gradient_colors[[palette]]
  
  ggplot2::scale_fill_gradient2(
    low = colors$low,
    mid = colors$mid,
    high = colors$high,
    ...
  )
}

#' @title Science Sequential Color Scale (2-color)
#'
#' @description Sequential color scale using blue-red gradient derived from
#' the science palette colors. Automatically uses the palette from the current
#' theme, unless explicitly overridden.
#'
#' @param palette Palette name: "adj_colorblind", "pastel", or "resurrect".
#'   If NULL, reads from current theme.
#' @param ... Additional arguments passed to ggplot2::scale_colour_gradient()
#' @return A sequential color scale
#' @export
#'
scale_colour_science_seq <- function(palette = NULL, ...) {
  if (is.null(palette)) {
    palette <- get_palette_from_theme()
  }
  palette <- validate_palette(palette)
  
  colors <- science_gradient_colors[[palette]]
  
  ggplot2::scale_colour_gradient(
    low = colors$low,
    high = colors$high,
    ...
  )
}

#' @title Science Sequential Fill Scale (2-color)
#'
#' @description Sequential fill scale using blue-red gradient derived from
#' the science palette colors. Automatically uses the palette from the current
#' theme, unless explicitly overridden.
#'
#' @param palette Palette name: "adj_colorblind", "pastel", or "resurrect".
#'   If NULL, reads from current theme.
#' @param ... Additional arguments passed to ggplot2::scale_fill_gradient()
#' @return A sequential fill scale
#' @export
#'
scale_fill_science_seq <- function(palette = NULL, ...) {
  if (is.null(palette)) {
    palette <- get_palette_from_theme()
  }
  palette <- validate_palette(palette)
  
  colors <- science_gradient_colors[[palette]]
  
  ggplot2::scale_fill_gradient(
    low = colors$low,
    high = colors$high,
    ...
  )
}
