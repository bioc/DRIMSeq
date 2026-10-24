
.ZENODO_STUB1 <- "https://zenodo.org/records/23612905/files/"
.ZENODO_STUB2 <- ".rds?download=1"

.load_rds_into_parent <- function(link, name, verbose = TRUE) {
  if (verbose)
    message(paste0("Assigning ", link, " to '", name, "' object."))
  assign(name, readRDS(url(link)), envir = .GlobalEnv)
}
.zenodo_url <- function(u) paste0(.ZENODO_STUB1, u, .ZENODO_STUB2)

.load_data <- function(flavour = NULL) {
  if(flavour == "geuvadis") {
    objs <- c("counts", "genotypes", "gene_ranges", "snp_ranges")
  } else if(flavour == "pasilla") {
    objs <- c("pasilla_metadata", "pasilla_counts", "gene_id_subset")
  } else {
    stop("'flavour' parameter needs to be specified.")
  }
  
  invisible(lapply(objs, function(u) .load_rds_into_parent(.zenodo_url(u), u)))
}
