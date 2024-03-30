#' request_api_map
#'
#' Returns a list representing an API map for using the Arctos API
#'
#' @returns list
request_api_map <- function() {
  about_request(list(`method`="api_map"))
}
