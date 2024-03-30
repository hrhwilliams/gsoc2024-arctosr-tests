#' request_code_table
#'
#' Returns more detail about a code table in Arctos
#'
#' @param table Name of the Arctos table to query
#' @param api_key Your API key used to access Arctos
#' @returns list
request_code_table <- function(table, api_key) {
  authority_request(list(`method`="code_tables", tbl = table), api_key)
}
