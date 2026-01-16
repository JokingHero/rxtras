# 64 colors from RESURRECT, currently as backup
resurrect <- c(
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
ressurect_order <- c(
  3, 18, 48, 31, 53, 61, 19, 49, 21,
  59, 9, 37, 23, 28, 35, 45, 24, 12, 13, 10, 36, 32, 25, 20, 5, 15,
  62, 17, 51, 40, 33, 26, 57, 64, 56, 7, 52, 58, 63, 11, 29, 44, 42,
  38, 55, 50, 39, 1, 47, 43, 6, 30, 46, 4, 34, 27, 54, 60, 14, 22, 2, 8, 41, 16)
resurrect <- resurrect[ressurect_order]

pastel <- c("#92d9f7ff", "#ffa6d5ff", "#c0eeac", "#9e9e9eff", "#ffa4a4",
  "#ffb17b", "#aea1ff", "#ffe8a3", "#d09b83", "#6dbaff")

#https://davidmathlogic.com/colorblind
# /#%23585858-%23FE6100-%23648FFF-%2323CC90-%23DC267F-%233844D4-%23FFB000-%23785EF0-%23FFE21C-%2341DDE6
adj_colorblind_mine <- c("#585858", "#FE6100", "#648FFF", "#23CC90", "#DC267F", "#3844D4", "#FFB000",
                         "#785EF0", "#FFE21C", "#41DDE6")
color_scheme <- list(adj_colorblind_mine, resurrect)

science_gradient_colors <- list(
  adj_colorblind = list(
    low = "#DC267F",
    mid = "white",
    high = "#648FFF"
  ),
  pastel = list(
    low = "#ffa6d5ff",
    mid = "white",
    high = "#92d9f7ff"
  ),
  resurrect = list(
    low = "#d5695d",
    mid = "white",
    high = "#016392"
  )
)

#' @title Get Science Palette Colors
#'
#' @description Returns colors from the science palettes. The function
#' respects the palette setting from the current theme if no palette is
#' specified.
#'
#' @param n Number of colors to return
#' @param palette Palette name: "adj_colorblind" (default), "pastel", or "resurrect"
#' @return Character vector of hex color codes
#' @export
#'
science_palette <- function(n, palette = NULL) {
  if (is.null(palette)) {
    current_theme <- ggplot2::theme_get()
    if (!is.null(current_theme$.palette)) {
      palette <- current_theme$.palette
    } else {
      palette <- "adj_colorblind"
    }
  }

  valid_palettes <- c("adj_colorblind", "pastel", "resurrect")
  if (!palette %in% valid_palettes) {
    stop(paste0("Invalid palette: '", palette, "'. ",
                "Valid options: ", paste(valid_palettes, collapse = ", ")),
         call. = FALSE)
  }

  colors <- switch(palette,
    adj_colorblind = adj_colorblind_mine,
    pastel = pastel,
    resurrect = resurrect
  )

  if (n > length(colors)) {
    colors <- resurrect
  }

  colors[seq_len(n)]
}


# library(ggplot2)
# options(ggplot2.discrete.fill = color_scheme)
# options(ggplot2.discrete.color = color_scheme)
# n <- 12
# dt <- iris
# dt$letter <- LETTERS[sample(n, size = dim(dt)[1], replace = T)]
# ggplot(dt, aes(y = Sepal.Length, x = letter, fill = letter)) +
#   geom_boxplot() +
#   theme_science()
#
# ggplot(dt, aes(x = Sepal.Length, fill = letter)) +
#   geom_density(alpha = 0.6)