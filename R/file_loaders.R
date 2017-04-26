#' Loads wig files.
#'
#' @param filename A name of your file.
#' @param filepath Path to file.
#' @return A loaded wig file.
#' @export
#' @examples
#' # load just one file
#' #library(rtracklayer)
#' #loadWigs("tobeloaded.wig", "path/to/file")
#'
#' # load all files from location
#' #fpath <- "/export/kjempetujafs/valen-group/projects/micropeptides/data/Ribo-Seq/Dome/fwd/fixed"
#' #forward <- list.files(fpath)
#' #FLOSSlengths <- sapply(forward, function(x) as.numeric(gsub("[^0-9]", "", x)), USE.NAMES = F) #lengths of footprints from names of files
#' #forwardFP <- lapply(forward, loadWigs, filepath = fpath)

loadWigs <- function(filename, filepath){
  if (!requireNamespace("rtracklayer", quietly = TRUE)) {
    stop("rtracklayer needed for this function to work. Please install it.",
         call. = FALSE)
  }
  import.wig(paste(filepath, filename, sep="/"))
}


#' @title Copy an object in the clipboard
#'
#' @description Copy an object in the clipboard
#'
#' @param sep The object to copy.
#' @param sep A character to be used as separator for each column of the object
#' @param row.names  Copy row names (default is FALSE)
#' @param col.names Copy column names (default is TRUE)
#' @return copy the object as character in the clipboard
#' @author freecube source:http://stackoverflow.com/questions/10959521/how-to-write-to-clipboard-on-ubuntu-linux-in-r

clipboard <- function(x, sep="\t", row.names=FALSE, col.names=TRUE){
  con <- pipe("xclip -selection clipboard -i", open="w")
  write.table(x, con, sep=sep, row.names=row.names, col.names=col.names)
  close(con)
}