# options(ggplot2.continuous.colour and ggplot2.continuous.fill)

#' @title Scale gradient for ggplot2
#'
#' @description Depending on min and max will apply gradient to the plot
#' if min < 0, use 3 colours and set limits to -max_val, +max_val
#' else use 2 colours and set limits to 0, max
#'
#' Alternative dark red-blue: c("#750e13", "#ffffff", "#003a6d")
#' Alternative violet-green: c("#491d8b", "#ffffff", "#004144")
#'
#' @param min Minimal value in the data
#' @param max Maximal value in the data
#' @param aesthetics "colour" or "fill" or both
#' @param gradient A vector of 3 colours: low, middle and high
#' @param na.value What colour to put on the na.value
#' @return a scale_fill_gradient
#' @export
#'
scale_gradient <- function(
  min, max,
  aesthetics = "fill",
  gradient = c("#D62929", "#ffffff", "#2982D6"),
  na.value = "#dddddd") {

  max_val <- max(c(abs(min), abs(max)))

  if (min < 0) { # 3 colours
    return(
      scale_fill_gradientn(aesthetics = aesthetics,
                           colors = gradient,
                           limits = c(-max_val, max_val),
                           na.value = na.value)
    )
  }

  # 2 colours
  scale_fill_gradient(aesthetics = aesthetics,
                      low = gradient[2], high = gradient[3],
                      limits = c(min, max),
                      na.value = na.value)
}

# library(rxtras)
# dt <- iris
# ggplot(dt, aes(x = Sepal.Length,
#                y = Sepal.Width,
#                color = Petal.Width)) +
#   geom_point(size = 5) +
#   scale_gradient(-3, max(dt$Petal.Width), aesthetics = "color", gradient = c("#491d8b", "#ffffff", "#004144"))
