#' Set theme for ggplot2 (Science Style)
#'
#' @inheritParams ggplot2::theme_bw
#' @param nomargin If true will remove all margins.
#' @param fc text colour, default is black
#' @param gM grid Major
#' @param gm grid minor
#' @param gc grid color
#' @param gl grid linetype
#' @param boxes whether to keep boxes around the plot
#' @param bc background color, default white
#' @param pc panel colour background, default transparent
#' @param lp legend position, default is top
#' @param axis 0, 1, 2, 3 - default is 1
#' @export
theme_science <- function(
    base_size = 12,
    base_family = "sans",
    nomargin = FALSE,
    fc = "black",
    gM = TRUE,
    gm = TRUE,
    gc = "grey",
    gl = "dashed",
    boxes = TRUE,
    bc = "white",
    pc = "transparent",
    lp = "top",
    axis = 1) {

  tc <- ifelse(pc == "transparent", bc, pc)

  # Base theme
  res <- ggplot2::theme_bw(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      text = ggplot2::element_text(family = base_family, colour = fc),
      plot.background = ggplot2::element_rect(fill = bc, colour = NA),
      panel.grid = ggplot2::element_line(colour = gc, linewidth = 0.2, linetype = gl),
      panel.grid.minor = ggplot2::element_line(linewidth = 0.1),
      axis.ticks = ggplot2::element_line(colour = gc, linewidth = 0.7),
      plot.title = ggplot2::element_text(colour = fc, face = "bold", size = ggplot2::rel(1.2)),
      axis.text = ggplot2::element_text(colour = fc, face = "plain", size = ggplot2::rel(0.8)),
      legend.text = ggplot2::element_text(colour = fc, face = "plain", size = ggplot2::rel(0.8)),
      legend.title = ggplot2::element_text(colour = fc, face = "italic", size = ggplot2::rel(1.0)),
      axis.title.x = ggplot2::element_text(colour = fc, face = "plain", size = ggplot2::rel(1.0)),
      axis.title.y = ggplot2::element_text(colour = fc, face = "plain", size = ggplot2::rel(1.0), angle = 90, vjust = 2),
      strip.text.x = ggplot2::element_text(colour = fc, face = "plain", size = ggplot2::rel(1.0)),
      strip.text.y = ggplot2::element_text(colour = fc, face = "plain", size = ggplot2::rel(1.0), angle = -90),
      legend.key = ggplot2::element_rect(colour = "transparent", fill = "transparent"),
      strip.background = ggplot2::element_rect(colour = gc, fill = "transparent"),
      panel.border = ggplot2::element_rect(fill = NA, colour = gc),
      panel.background = ggplot2::element_rect(fill = pc, colour = gc),
      legend.position = lp
    )

  # Toggle Boxes
  if (!boxes) {
    res <- res + ggplot2::theme(
      panel.border = ggplot2::element_rect(fill = NA, colour = tc),
      panel.background = ggplot2::element_rect(fill = pc, colour = tc)
    )
  }

  # Toggle Grids
  if (!gM) {
    res <- res + ggplot2::theme(panel.grid.major = ggplot2::element_blank())
  }
  if (!gm) {
    res <- res + ggplot2::theme(panel.grid.minor = ggplot2::element_blank())
  }

  # Margins
  if (nomargin) {
    res <- res + ggplot2::theme(plot.margin = ggplot2::unit(c(0.1, 0.1, 0.1, 0), "lines"))
  }

  # Axis Orientation logic
  if (axis == 0) {
    res <- res + ggplot2::theme(axis.text.y = ggplot2::element_text(angle = 90))
  } else if (axis == 2) {
    res <- res + ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, hjust = 1))
  } else if (axis == 3) {
    res <- res + ggplot2::theme(
      axis.text.y = ggplot2::element_text(angle = 90),
      axis.text.x = ggplot2::element_text(angle = 90, hjust = 1)
    )
  }
  res
}

#' Set theme for ggplot2 (Science Style)
#'
#' @param palette Science palette to use ("adj_colorblind", "pastel", "resurrect")
#' @param ... Additional arguments passed to theme_science()
#' @export
#'
theme_science_palette <- function(palette = "adj_colorblind", ...) {
  validate_palette(palette)
  list(theme_science(...), scale_color_science(palette), scale_fill_science(palette))
}