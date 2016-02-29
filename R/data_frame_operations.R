#' expands rows - i dont remember what it was for.
#'
#' @param dataset a data frame.
#' @param count numeric. Expand rows by how many.
#' @param count_is_col boolean.
#' @return A data.frame with extended rows from \code{x}.
#' @export
#' @examples
#' #ExpandRows(???)
#' #??

expandRows <- function(dataset, count, count_is_col = TRUE) {
  if (!isTRUE(count_is_col)) {
      if (length(count) == 1) {
        dataset[rep(rownames(dataset), each = count), ]
      } else {
        if (length(count) != nrow(dataset)) {
          stop("Expand vector does not match number of rows in data.frame")
        }
        dataset[rep(rownames(dataset), count), ]
      }
  } else {
      dataset[rep(rownames(dataset), dataset[[count]]),
      setdiff(names(dataset), names(dataset[count]))]
  }
}