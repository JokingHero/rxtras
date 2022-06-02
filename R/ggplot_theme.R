#' @title Set theme for ggplot2
#'
#' @description The theme set supports 10 colors in the colorblind friendly, yet
#' beautiful pastille colors, and afterwards it backs out to 64 colors from
#' resurrect palette. Theme is based on `ggthemes::theme_pander()`.
#'
#' @param base_size Font size
#' @return a ggplot2 theme
#' @author See ggtheme package
#' @export
#'
theme_science <- function(base_size = 16) {
  base_family = "sans"
  nomargin = TRUE
  ff = NULL
  fc = "black"
  fs = NULL
  gM = TRUE
  gm = TRUE
  gc = "grey"
  gl = "dashed"
  boxes = TRUE
  bc = "white"
  pc = "transparent"
  lp = "top"
  axis = 1

  tc <- ifelse(pc == "transparent", bc, pc)  # 'transparent' color

  res <- theme(text = element_text(family = base_family),
               plot.background = element_rect(fill = bc, colour = NA),
               panel.grid = element_line(colour = gc,
                                         size = 0.2, linetype = gl),
               panel.grid.minor = element_line(size = 0.1),
               axis.ticks = element_line(colour = gc,
                                         size = 0.7),
               plot.title = element_text(colour = fc,
                                         face = "bold",
                                         size = base_size * 1.2),
               axis.text = element_text(colour = fc,
                                        face = "plain", size = base_size * 0.8),
               legend.text = element_text(colour = fc, face = "plain",
                                          size = base_size * 0.8),
               legend.title = element_text(colour = fc,
                                           face = "italic",
                                           size = base_size),
               axis.title.x = element_text(colour = fc,
                                           face = "plain",
                                           size = base_size),
               strip.text.x = element_text(colour = fc,
                                           face = "plain",
                                           size = base_size),
               axis.title.y = element_text(colour = fc,
                                           face = "plain",
                                           size = base_size,
                                           angle = 90),
               strip.text.y = element_text(colour = fc,
                                           face = "plain",
                                           size = base_size,
                                           angle = -90),
               legend.key = element_rect(colour = "transparent",
                                         fill = "transparent"),
               strip.background = element_rect(colour = gc,
                                               fill = "transparent"),
               panel.border = element_rect(fill = NA, colour = gc),
               panel.background = element_rect(fill = pc, colour = gc),

               legend.position = lp)

  ## disable box(es) around the plot
  if (!isTRUE(boxes)) {
    res <- res + theme(legend.key = element_rect(colour = "transparent",
                                                 fill = "transparent"),
                       strip.background = element_rect(colour = "transparent",

                                                       fill = "transparent"),
                       panel.border = element_rect(fill = NA,
                                                   colour = tc),
                       panel.background = element_rect(fill = pc,
                                                       colour = tc))
  }

  ## disable grid
  if (!isTRUE(gM)) {
    res <- res + theme(panel.grid = element_blank(),
                       panel.grid.major = element_blank(),
                       panel.grid.minor = element_blank())
  }
  ## disable minor grid
  if (!isTRUE(gm))
    res <- res + theme(panel.grid.minor = element_blank())

  ## margin
  if (nomargin)
    res <- res + theme(plot.margin = unit(c(0.1, 0.1, 0.1, 0), "lines"))

  ## axis angle (TODO: DRY with ifelse in the default color etc. section)
  if (axis == 0)
    res <- res + theme(axis.text.y = element_text(colour = fc,
                                                  family = base_family,
                                                  face = "plain",
                                                  size = base_size *  0.8,
                                                  angle = 90))

  if (axis == 2)
    res <- res + theme(axis.text.x = element_text(colour = fc,
                                                  family = base_family,
                                                  face = "plain",
                                                  size = base_size *  0.8,
                                                  angle = 90,
                                                  hjust = 1))

  if (axis == 3)
    res <- res + theme(axis.text.y = element_text(colour = fc,
                                                  family = base_family,
                                                  face = "plain",
                                                  size = base_size * 0.8,
                                                  angle = 90),
                       axis.text.x = element_text(colour = fc,
                                                  family = base_family,
                                                  face = "plain",
                                                  size = base_size * 0.8,
                                                  angle = 90,
                                                  hjust = 1))



  res
}