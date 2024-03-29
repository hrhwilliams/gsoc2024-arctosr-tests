get_arctos_data <- function(scientific_name, api_key) {
  catalog_request(list(`scientific_name`=scientific_name), api_key)
}
