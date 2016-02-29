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
  if (is(xlim, "Ranges"))
      xlim <- c(min(start(xlim)), max(end(xlim)))
  bins <- disjointBins(IRanges(start(x), end(x) + 1))
  plot.new()
  plot.window(xlim, c(0, max(bins) * (height + sep)))
  ybottom <- bins * (sep + height) - height
  rect(start(x) - 0.5, ybottom, end(x) + 0.5, ybottom + height, col = col, ...)
  title(main)
  axis(1)
}