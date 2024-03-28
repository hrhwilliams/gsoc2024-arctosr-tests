# Results

Using:
```
data <- occ('Canis lupus', from='gbif', limit=50)
```

Number of records after download:

50

Number of records after filtering out null geographic coordinates:

50

Number of records after filtering out coordinate uncertainty > 1000:

34

Number of records after selecting only species, longitude, latitude, day, month, year:

34

Dataframe after performing all filter and select operations:

|species|longitude|latitude|day|month|year|
|-------|---------|--------|---|-----|----|
|Canis lupus|152.|-26.9|1|1|2024|
|Canis lupus|121.|24.7|1|1|2024|
|Canis lupus|-77.6|-11.1|2|1|2024|
|Canis lupus|24.6|-31.9|2|1|2024|
|Canis lupus|51.5|25.3|1|1|2024|
|Canis lupus|121.|24.2|3|1|2024|
|Canis lupus|121.|24.2|3|1|2024|
|Canis lupus|130.|-30.6|1|1|2024|
|Canis lupus|28.3|36.8|3|1|2024|
|Canis lupus|121.|24.2|4|1|2024|
|Canis lupus|133.|-12.4|4|1|2024|
|Canis lupus|-97.1|30.4|1|1|2024|
|Canis lupus|-96.9|30.3|1|1|2024|
|Canis lupus|105.|16.2|4|1|2024|
|Canis lupus|30.4|-29.7|4|1|2024|
|Canis lupus|18.4|43.9|4|1|2024|
|Canis lupus|-96.2|15.8|3|1|2024|
|Canis lupus|-74.3|4.97|5|1|2024|
|Canis lupus|-67.9|-9.96|4|1|2024|
|Canis lupus|122.|29.8|7|1|2024|
|Canis lupus|121.|23.4|7|1|2024|
|Canis lupus|35.3|52.2|1|1|2024|
|Canis lupus|28.3|36.9|7|1|2024|
|Canis lupus|-114.|47.4|7|1|2024|
|Canis lupus|153.|-28.2|8|1|2024|
|Canis lupus|-102.|33.9|3|1|2024|
|Canis lupus|103.|52.4|9|1|2024|
|Canis lupus|-97.0|36.1|9|1|2024|
|Canis lupus|121.|23.3|10|1|2024|
|Canis lupus|73.8|18.5|11|1|2024|
|Canis lupus|-104.|25.6|11|1|2024|
|Canis lupus|-112.|26.2|11|1|2024|
|Canis lupus|-16.2|11.5|12|1|2024|
|Canis lupus|-77.6|-11.1|12|1|2024|