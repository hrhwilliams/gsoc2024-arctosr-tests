#'get_arctos_data
#'
#'Returns a dataframe of ten records for a
#'
#' @param scientific_name Scientific or Latin name for a species
#' @param api_key Your API key used to access Arctos
#' @returns dataframe
get_arctos_data <- function(scientific_name, api_key) {
  resp <- catalog_request(list(`scientific_name`=scientific_name), api_key)
  d = resp$DATA
  data.frame(matrix(unlist(d), nrow = length(d), byrow = TRUE)) |>
    setNames(names(d[[1]]))
}
