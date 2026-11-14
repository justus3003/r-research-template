# Reusable helper functions. Load them with:
#   source(here::here("R", "helpers.R"))

#' Mean of a column per group
#'
#' @param data A data frame.
#' @param value Name of the numeric column to average.
#' @param group Name of the grouping column.
#' @return A data frame with one row per group.
mean_by_group <- function(data, value, group) {
  stopifnot(is.data.frame(data), all(c(value, group) %in% names(data)))
  result <- aggregate(data[[value]], by = list(data[[group]]), FUN = mean)
  names(result) <- c(group, paste0("mean_", value))
  result
}
