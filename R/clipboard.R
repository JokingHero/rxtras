#' @title Copy an object in the clipboard
#'
#' @description Copy an object in the clipboard (needs xclip to be installed)
#'
#' @param x The object to copy.
#' @param sep A character to be used as separator for each column of the object
#' @param row.names  Copy row names (default is FALSE)
#' @param col.names Copy column names (default is TRUE)
#' @return copy the object as character in the clipboard
#' @author freecube source:http://stackoverflow.com/questions/10959521/how-to-write-to-clipboard-on-ubuntu-linux-in-r
#' @export
#'
clipboard <- function(x, sep = "\t", row.names = FALSE, col.names = FALSE) {
  con <- pipe("xclip -selection clipboard -i", open="w")
  utils::write.table(x, con, sep=sep, row.names=row.names, col.names=col.names)
  close(con)
}


#' @title Paste an object from the clipboard
#'
#' @description Paste an object from the clipboard (needs xsel to be installed)
#'
#' @param header Is there a header?
#' @param ... What arguments to pass to the read.delim function?
#' @return copy the object as character in the clipboard
#' @author isomorphismes source:http://stackoverflow.com/questions/13438556/how-do-i-copy-and-paste-data-into-r-from-the-clipboard
#' @export
#'
cpaste <- function(header = FALSE, ...) {
  utils::read.delim(pipe("xsel -bo"), header = header, ...)
}

