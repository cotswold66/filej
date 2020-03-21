#' Convert  multiple sas7bdat files
#'
#' Reads multiple files from a directory in sas7bdat format and converts to
#' either a comma separated value or an R serialized data format
#'
#' @param file_path
#' the name of the directory which the data are to be read from.
#' If it does not contain an absolute path, the directory is relative to the
#' current working directory.
#' @param write_path
#' the filepath to save the converted file. The directory will
#'  be created if not already present.
#' @param to_ext
#' either 'csv' or 'rds' options are available.
#'
#' @export
#'
convert_sas_dir <- function(file_path, write_path, to_ext = "rds"){
  file_names <- list.files(path = file_path, pattern = "sas7bdat", full.names = T)
  purrr::map(file_names, ~ convert_sas(., write_path, to_ext))
  return(invisible(NULL))
}
