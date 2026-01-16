pkgname <- "rxtras"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('rxtras')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("plotRanges")
### * plotRanges

flush(stderr()); flush(stdout())

### Name: plotRanges
### Title: Plot genomic ranges from the IRanges object or GRanges object.
### Aliases: plotRanges

### ** Examples

library(IRanges)
plotRanges(IRanges(1:10, width=10:1, names=letters[1:10]))



cleanEx()
nameEx("substrRight")
### * substrRight

flush(stderr()); flush(stdout())

### Name: substrRight
### Title: Extract substrings in a character vector counting from right.
### Aliases: substrRight

### ** Examples

substrRight("ABCD", 2)
#CD




### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
