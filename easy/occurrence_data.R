library(tidyverse)
library(spocc)

data <- occ('Canis lupus', from='gbif', limit=50)
gbif_data <- data$gbif
canis_lupus <- gbif_data$data$Canis_lupus

print('Number of records after download:')
print(nrow(canis_lupus))

filtered <- canis_lupus %>% filter(!is.null(longitude) && !is.null(longitude))

print('Number of records after filtering out null geographic coordinates:')
print(nrow(filtered))

filtered <- filtered %>% filter(coordinateUncertaintyInMeters <= 1000)

print('Number of records after filtering out coordinate uncertainty > 1000:')
print(nrow(filtered))

filtered <- filtered  %>% select(c(species, longitude, latitude, day, month, year))

print('Number of records after selecting only species, longitude, latitude, day, month, year:')
print(nrow(filtered))

print('Dataframe after performing all filter and select operations')
print(filtered, n = 50)
