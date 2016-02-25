#' Extract substrings in a character vector counting from right.
#'
#' @param x a character vector.
#' @param n integer. The first element to be replaced.
#' @return A substracted character from \code{x}.
#' @examples
#' substrRight("ABCD", 2)
#' #CD

substrRight <- function(x, n){
    substr(x, nchar(x) - n + 1, nchar(x))
}

