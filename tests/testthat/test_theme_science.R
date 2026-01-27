context("Theme Science")

test_that("theme_science accepts valid palette options", {
  expect_silent(theme_science(palette = "adj_colorblind"))
  expect_silent(theme_science(palette = "pastel"))
  expect_silent(theme_science(palette = "resurrect"))
})

test_that("theme_science throws error with valid options message for invalid palette", {
  expect_error(
    theme_science(palette = "invalid"),
    "Invalid palette: 'invalid'. Valid options: adj_colorblind, pastel, resurrect"
  )
})

test_that("theme_science defaults to adj_colorblind", {
  theme <- theme_science()
  expect_equal(theme$.palette, "adj_colorblind")
})

test_that("theme_science stores .palette in theme", {
  theme <- theme_science(palette = "pastel")
  expect_equal(theme$.palette, "pastel")
})

test_that("theme_science stores .palette in theme", {
  theme <- theme_science(palette = "resurrect")
  expect_equal(theme$.palette, "resurrect")
})

test_that("science_palette returns correct colors for adj_colorblind", {
  colors <- science_palette(3, palette = "adj_colorblind")
  expect_equal(length(colors), 3)
  expect_equal(colors[1], "#585858")
  expect_equal(colors[2], "#FE6100")
})

test_that("science_palette returns correct colors for pastel", {
  colors <- science_palette(2, palette = "pastel")
  expect_equal(length(colors), 2)
  expect_equal(colors[1], "#92d9f7ff")
  expect_equal(colors[2], "#ffa6d5ff")
})

test_that("science_palette returns correct colors for resurrect", {
  colors <- science_palette(5, palette = "resurrect")
  expect_equal(length(colors), 5)
  expect_equal(colors[1], "#625565")
})

test_that("science_palette reads from theme when palette = NULL", {
  old_theme <- ggplot2::theme_get()
  on.exit(ggplot2::theme_set(old_theme))

  ggplot2::theme_set(theme_science(palette = "pastel"))
  colors <- science_palette(2)
  expect_equal(colors, pastel[1:2])
})

test_that("science_palette falls back to resurrect when n > 10", {
  colors <- science_palette(12, palette = "adj_colorblind")
  expect_true(all(colors %in% resurrect))
})

test_that("science_palette validates and errors with helpful message", {
  expect_error(
    science_palette(5, palette = "invalid"),
    "Invalid palette: 'invalid'. Valid options: adj_colorblind, pastel, resurrect"
  )
})

test_that("validate_palette throws error with valid options", {
  expect_error(
    validate_palette("invalid"),
    "Invalid palette: 'invalid'. Valid options: adj_colorblind, pastel, resurrect"
  )

  expect_equal(validate_palette("adj_colorblind"), "adj_colorblind")
  expect_equal(validate_palette("pastel"), "pastel")
  expect_equal(validate_palette("resurrect"), "resurrect")
})

test_that("get_palette_from_theme returns correct palette from theme", {
  old_theme <- ggplot2::theme_get()
  on.exit(ggplot2::theme_set(old_theme))

  ggplot2::theme_set(theme_science(palette = "resurrect"))
  expect_equal(get_palette_from_theme(), "resurrect")
})

test_that("get_palette_from_theme returns adj_colorblind as fallback", {
  old_theme <- ggplot2::theme_get()
  on.exit(ggplot2::theme_set(old_theme))

  ggplot2::theme_set(ggplot2::theme_grey())
  expect_equal(get_palette_from_theme(), "adj_colorblind")
})

test_that("discrete scales use theme palette by default", {
  old_theme <- ggplot2::theme_get()
  on.exit(ggplot2::theme_set(old_theme))

  ggplot2::theme_set(theme_science(palette = "pastel"))

  scale <- scale_colour_science()
  expect_silent(scale)

  scale <- scale_fill_science()
  expect_silent(scale)
})

test_that("discrete scales can override palette explicitly", {
  scale <- scale_colour_science(palette = "resurrect")
  expect_silent(scale)

  scale <- scale_fill_science(palette = "pastel")
  expect_silent(scale)
})

test_that("discrete scales validate palette parameter", {
  expect_error(
    scale_colour_science(palette = "invalid"),
    "Invalid palette"
  )

  expect_error(
    scale_fill_science(palette = "invalid"),
    "Invalid palette"
  )
})

test_that("continuous scales use correct gradient colors for adj_colorblind", {
  old_theme <- ggplot2::theme_get()
  on.exit(ggplot2::theme_set(old_theme))

  ggplot2::theme_set(theme_science(palette = "adj_colorblind"))

  scale <- scale_colour_science_div()
  expect_silent(scale)

  scale <- scale_fill_science_seq()
  expect_silent(scale)
})

test_that("continuous scales use correct gradient colors for pastel", {
  old_theme <- ggplot2::theme_get()
  on.exit(ggplot2::theme_set(old_theme))

  ggplot2::theme_set(theme_science(palette = "pastel"))

  scale <- scale_colour_science_div()
  expect_silent(scale)

  scale <- scale_fill_science_seq()
  expect_silent(scale)
})

test_that("continuous scales use correct gradient colors for resurrect", {
  old_theme <- ggplot2::theme_get()
  on.exit(ggplot2::theme_set(old_theme))

  ggplot2::theme_set(theme_science(palette = "resurrect"))

  scale <- scale_colour_science_div()
  expect_silent(scale)

  scale <- scale_fill_science_seq()
  expect_silent(scale)
})

test_that("continuous scales can override palette explicitly", {
  scale <- scale_colour_science_div(palette = "pastel")
  expect_silent(scale)

  scale <- scale_fill_science_seq(palette = "resurrect")
  expect_silent(scale)
})

test_that("continuous scales validate palette parameter", {
  expect_error(
    scale_colour_science_div(palette = "invalid"),
    "Invalid palette"
  )

  expect_error(
    scale_fill_science_seq(palette = "invalid"),
    "Invalid palette"
  )
})

test_that("science_gradient_colors has all three palette entries", {
  expect_true("adj_colorblind" %in% names(science_gradient_colors))
  expect_true("pastel" %in% names(science_gradient_colors))
  expect_true("resurrect" %in% names(science_gradient_colors))
})

test_that("science_gradient_colors entries have low, mid, high", {
  for (palette in names(science_gradient_colors)) {
    colors <- science_gradient_colors[[palette]]
    expect_true("low" %in% names(colors))
    expect_true("mid" %in% names(colors))
    expect_true("high" %in% names(colors))
  }
})

test_that("plots with theme_science use correct palette", {
  skip_if_not_installed("ggplot2")
  old_theme <- ggplot2::theme_get()
  on.exit(ggplot2::theme_set(old_theme))

  p <- ggplot2::ggplot(mtcars, ggplot2::aes(x = mpg, y = wt, colour = factor(cyl))) +
    ggplot2::geom_point() +
    theme_science(palette = "pastel")

  expect_warning(ggplot2::ggplot_build(p), ".palette")
})

test_that("plots with theme_science use correct palette with scale functions", {
  skip_if_not_installed("ggplot2")
  old_theme <- ggplot2::theme_get()
  on.exit(ggplot2::theme_set(old_theme))

  p <- ggplot2::ggplot(mtcars, ggplot2::aes(x = mpg, y = wt, colour = factor(cyl))) +
    ggplot2::geom_point() +
    scale_colour_science() +
    theme_science(palette = "pastel")

  expect_warning(ggplot2::ggplot_build(p), ".palette")
})

test_that("scale_colour_science_div creates a valid diverging scale", {
  skip_if_not_installed("ggplot2")

  scale <- scale_colour_science_div()
  expect_s3_class(scale, "ScaleContinuous")
})

test_that("scale_colour_science_seq creates a valid sequential scale", {
  skip_if_not_installed("ggplot2")

  scale <- scale_colour_science_seq()
  expect_s3_class(scale, "ScaleContinuous")
})

