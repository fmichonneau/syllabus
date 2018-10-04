build_lessons <- function(path = ".") {

  list_chapters <- list.files(path = path, pattern = "Rmd$",
                              full.names = TRUE)

  ## All chapters go to the _en folder expect index that stays at the root
  dest <- ifelse(grepl("index", basename(list_chapters)),
                 file.path(path, basename(list_chapters)),
                 file.path(path, "_en", basename(list_chapters)))

  ## Rename extensions to md
  dest <- gsub("\\.Rmd$", "\\.md", dest)

  ## Convert Rmd files to me
  mapply(function(s, d) {
    knitr::knit(input = s, output = d)
  }, list_chapters, dest, SIMPLIFY=FALSE)

}

build_lessons()
