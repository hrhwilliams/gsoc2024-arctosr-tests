library(tidyverse)
library(spocc)

data <- occ('Canis lupus', from='gbif', limit=100)
gbif_data <- data$gbif
canis_lupus <- gbif_data$data$Canis_lupus

filtered <- canis_lupus %>%
  filter(!is.null(longitude) && !is.null(longitude)) %>%
  filter(coordinateUncertaintyInMeters < 1000) %>%
  select(c(species, longitude, latitude, day, month, year))
