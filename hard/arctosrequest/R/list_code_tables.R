list_code_tables <- function(api_key) {
  authority_request(list(`method`="code_tables"), api_key)
}
