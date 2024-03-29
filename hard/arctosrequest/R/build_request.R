# library(httr2)

arctos_url <- "https://arctos.database.museum"
arctos_api_version <- "component/api/v2"

build_arctos_request <- function(endpoint, query, api_key) {
  req <- httr2::request(arctos_url) |>
    httr2::req_url_path_append(arctos_api_version) |>
    httr2::req_url_path_append(endpoint)

  if (!missing(api_key)) {
    req <- req |> httr2::req_url_query(`api_key`=api_key)
  }

  if (!missing(query)) {
    req <- req |> httr2::req_url_query(!!!query)
  }

  req
}

about_request <-function(query) {
  req <- build_arctos_request("/about.cfc", query) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}

catalog_request <- function(query, api_key) {
  req <- build_arctos_request("/catalog.cfc", query, api_key) |>
    httr2::req_url_query(`method`="getCatalogData", `queryformat`="struct") |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}

authority_request <- function(query, api_key) {
  req <- build_arctos_request("/authority.cfc", query, api_key) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
