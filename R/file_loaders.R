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