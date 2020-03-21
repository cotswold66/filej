#' Convert sas7bdat file to either rds or csv format
#'
#' Reads a file in sas7bdat format and converts to either a comma separated
#' value or an R serialized data format
#'
#' @param file
#' the name of the file which the data are to be read from.
#' If it does not contain an absolute path, the file name is relative to the
#' current working directory.
#' @param write_path
#' the filepath to save the converted file. The directory will
#'  be created if not already present.
#' @param to_ext
#' either 'csv' or 'rds' options are available.
#'
convert_sas <- function(file, write_path, to_ext = "rds") {
  if(!file.exists(write_path)) dir.create(write_path, recursive = T)
  fn <- basename(file)
  df <- haven::read_sas(file)
  df <- dplyr::rename_all(df, toupper)
  if (to_ext == "rds"){
    readr::write_rds(
      df,
      paste0(write_path, "/", tools::file_path_sans_ext(fn), ".rds")
    )
  } else if (to_ext == "csv"){
    readr::write_csv(
      df,
      paste0(write_path, "/", tools::file_path_sans_ext(fn), ".csv")
    )
  }
  return(invisible(NULL))
}
