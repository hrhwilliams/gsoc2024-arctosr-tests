#' list_code_tables
#'
#' Returns a list of code tables used by Arctos
#'
#' @param api_key Your API key used to access Arctos
#' @returns list
list_code_tables <- function(api_key) {
  authority_request(list(`method`="code_tables"), api_key)
}
