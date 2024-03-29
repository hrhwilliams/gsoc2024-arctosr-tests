request_code_table <- function(table, api_key) {
  authority_request(list(`method`="code_tables", tbl = table), api_key)
}
