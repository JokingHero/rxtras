# Internal color vectors
#' Pastel color palette
#' @export
pastel <- c("#92d9f7ff", "#ffa6d5ff", "#c0eeac", "#9e9e9eff", "#ffa4a4",
            "#ffb17b", "#aea1ff", "#ffe8a3", "#d09b83", "#6dbaff")

.adj_colorblind <- c("#585858", "#FE6100", "#648FFF", "#23CC90", "#DC267F", "#3844D4", "#FFB000",
                     "#785EF0", "#FFE21C", "#41DDE6")

.resurrect_raw <- c(
  "#2e222f", "#3e3546", "#625565", "#966c6c", "#ab947a", "#694f62", "#7f708a",
  "#9babb2", "#c7dcd0", "#ffffff", "#6e2727", "#b33831", "#ea4f36", "#f57d4a",
  "#ae2334", "#e83b3b", "#fb6b1d", "#f79617", "#f9c22b", "#7a3045", "#9e4539",
  "#cd683d", "#e6904e", "#fbb954", "#4c3e24", "#676633", "#a2a947", "#d5e04b",
  "#fbff86", "#165a4c", "#239063", "#1ebc73", "#91db69", "#cddf6c", "#313638",
  "#374e4a", "#547e64", "#92a984", "#b2ba90", "#0b5e65", "#0b8a8f", "#0eaf9b",
  "#30e1b9", "#8ff8e2", "#323353", "#484a77", "#4d65b4", "#4d9be6", "#8fd3ff",
  "#45293f", "#6b3e75", "#905ea9", "#a884f3", "#eaaded", "#753c54", "#a24b6f",
  "#cf657f", "#ed8099", "#831c5d", "#c32454", "#f04f78", "#f68181", "#fca790",
  "#fdcbb0")
.resurrect_order <- c(
  3, 18, 48, 31, 53, 61, 19, 49, 21,
  59, 9, 37, 23, 28, 35, 45, 24, 12, 13, 10, 36, 32, 25, 20, 5, 15,
  62, 17, 51, 40, 33, 26, 57, 64, 56, 7, 52, 58, 63, 11, 29, 44, 42,
  38, 55, 50, 39, 1, 47, 43, 6, 30, 46, 4, 34, 27, 54, 60, 14, 22, 2, 8, 41, 16)
#' Resurrect color palette
#' @export
resurrect <- .resurrect_raw[.resurrect_order]

#' Science Palettes Colors
#' @description
#' Define the color vectors for the science theme.
#' @export
science_colors <- list(
  adj_colorblind = .adj_colorblind,
  pastel = pastel,
  resurrect = resurrect
)

#' Science Gradient Colors
#' @description
#' Define the low, mid, and high colors for science gradients.
#' @export
science_gradient_colors <- list(
  adj_colorblind = list(low = "#DC267F", mid = "white", high = "#648FFF"),
  pastel = list(low = "#ffa6d5ff", mid = "white", high = "#92d9f7ff"),
  resurrect = list(low = "#d5695d", mid = "white", high = "#016392")
)

#' Alias for science_gradient_colors
#' @description
#' Alias for science_gradient_colors for compatibility.
#' @export
science_gradients <- science_gradient_colors

#' Validate palette name
#' @param palette Palette name to validate.
#' @return The palette name if valid, throws error otherwise.
#' @export
validate_palette <- function(palette) {
  valid <- names(science_colors)
  if (!palette %in% valid) {
    stop(sprintf("Invalid palette: '%s'. Valid options: %s", 
                 palette, paste(valid, collapse = ", ")))
  }
  palette
}

#' Get palette from current theme
#' @description
#' Attempts to retrieve the .palette element from the current ggplot2 theme.
#' Defaults to "adj_colorblind" if not found.
#' @return A character string naming the palette.
#' @export
get_palette_from_theme <- function() {
  theme <- ggplot2::theme_get()
  if (!is.null(theme$.palette)) {
    return(theme$.palette)
  }
  "adj_colorblind"
}

#' Science Palette Generator
#' @description
#' Returns a vector of colors for a given palette name and number of colors.
#' @param n Number of colors to return.
#' @param palette Name of the palette ("adj_colorblind", "pastel", "resurrect").
#' @return A character vector of hex colors.
#' @export
science_palette <- function(n, palette = NULL) {
  if (is.null(palette)) {
    palette <- get_palette_from_theme()
  }
  validate_palette(palette)
  
  if (n > 10 && palette != "resurrect") {
    palette <- "resurrect"
  }
  
  cols <- science_colors[[palette]]
  if (n > length(cols)) {
    return(rep(cols, length.out = n))
  }
  cols[1:n]
}

#' Science Palette function for discrete_scale
#' @description
#' Returns a function that generates a vector of colors.
#' @param palette Name of the palette.
#' @return A function that takes an integer n and returns n colors.
#' @export
science_pal <- function(palette = "adj_colorblind") {
  validate_palette(palette)
  function(n) science_palette(n, palette = palette)
}