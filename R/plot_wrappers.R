#' Plot genomic ranges from the IRanges object or GRanges object.
#'
#' @param x a IRanges object.
#' @param xlim like in plot.
#' @param main A title of the plot.
#' @param col color. Default "black". e.g. "blue".
#' @param sep Default 0.5.
#' @param ... Other params you can pass to plot function.
#' @return A plot.
#' @export
#' @examples
#' library(IRanges)
#' plotRanges(IRanges(1:10, width=10:1, names=letters[1:10]))

plotRanges <- function(x, xlim = x, main = deparse(substitute(x)),  col = "black", sep = 0.5, ...){
  if (!requireNamespace("IRanges", quietly = TRUE)) {
    stop("IRanges needed for this function to work. Please install it.",
         call. = FALSE)
  }
  height <- 1
  if (methods::is(xlim, "Ranges")) {
    xlim <- c(min(IRanges::start(xlim)), max(IRanges::end(xlim)))
  }
  bins <- IRanges::disjointBins(IRanges::IRanges(IRanges::start(x), IRanges::end(x) + 1))
  graphics::plot.new()
  graphics::plot.window(xlim, c(0, max(bins) * (height + sep)))
  ybottom <- bins * (sep + height) - height
  graphics::rect(IRanges::start(x) - 0.5, ybottom, IRanges::end(x) + 0.5, ybottom + height, col = col, ...)
  graphics::title(main)
  graphics::axis(1)
}


#' Wrapper around gglplot2::ggsave with presets.
#'
#' @inheritParams ggplot2::ggsave
#' @return A plot saved as .png and .pdf, returns nothing.
#' @export
#'
as.pngpdf <- function(filename, plot = ggplot2::last_plot(), scale = 1,
                      width = 12, height = 8, units = "in", dpi = 400){
  ggsave(paste0(filename, ".png"), plot = plot, scale = scale, width = width,
         height = height, units = units, dpi = dpi, limitsize = FALSE)
  ggsave(paste0(filename, ".pdf"), plot = plot, scale = scale, width = width,
         height = height, units = units, dpi = dpi, limitsize = FALSE,
         device = grDevices::cairo_pdf)
}