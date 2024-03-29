library(httr2)

arctos_url = "https://arctos.database.museum"
arctos_api_version = "component/api/v2"
api_key = readline('Arctos API key: ')


build_arctos_request <- function(endpoint, query, api_key) {
  req <- request(arctos_url) |>
    req_url_path_append(arctos_api_version) |>
    req_url_path_append(endpoint)

  if (!missing(api_key)) {
    req <- req |> req_url_query(`api_key`=api_key)
  }

  if (!missing(query)) {
    req <- req |> req_url_query(!!!query)
  }

  req
}


about_request <-function(query) {
  req <- build_arctos_request("/about.cfc", query) |>
    req_perform() |>
    resp_body_json()
}

catalog_request <- function(query, api_key) {
  req <- build_arctos_request("/catalog.cfc", query, api_key) |>
    req_url_query(`method`="getCatalogData", `queryformat`="struct") |>
    req_perform() |>
    resp_body_json()
}

authority_request <- function(query, api_key) {
  req <- build_arctos_request("/authority.cfc", query, api_key) |>
    req_perform() |>
    resp_body_json()
}


request_api_map <- function() {
  about_request(list(`method`="api_map"))
}

list_code_tables <- function() {
  authority_request(list(`method`="code_tables"), api_key)
}

request_code_table <- function(table) {
  authority_request(list(`method`="code_tables", tbl = table), api_key)
}

get_arctos_data <- function(scientific_name) {
  catalog_request(list(`scientific_name`=scientific_name), api_key)
}


req = get_arctos_data('Canis lupus')

l = req$DATA
df <- data.frame(matrix(unlist(l), nrow = length(l), byrow = TRUE)) |>
  setNames(names(l[[1]]))
df