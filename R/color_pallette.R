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

pastel <- c("#666666", "#ffb17b", "#a4e4ff", "#c0ffa4", "#ffe8a3",
            "#ffa6d5", "#ff7e7e", "#aea1ff", "#6dbaff", "#d09b83")
bw <- c("#181425", "#ffffff")
color_scheme <- list(bw, pastel, resurrect)


# library(rxtras)
# n <- 11
# dt <- iris
# dt$letter <- LETTERS[sample(n, size = dim(dt)[1], replace = T)]
# ggplot(dt, aes(y = Sepal.Length, x = letter, fill = letter)) +
#   geom_boxplot()
#
# ggplot(dt, aes(x = Sepal.Length, fill = letter)) +
#   geom_density(alpha = 0.6)