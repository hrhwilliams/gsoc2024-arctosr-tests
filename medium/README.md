# Results

### Functions Created

For this test, I created four functions which visit each of the four services from the Arctos API documentation to perform some interaction with the API. https://handbook.arctosdb.org/documentation/api.html

- `request_api_map()` - Returns the Arctos API map as a JSON
- `list_code_tables()` - Broadly lists the tables used by Arctos
- `request_code_table(table)` - Returns more information about a specific `table`
- `get_arctos_data <- function(scientific_name)` - Performs a specimen search using only `scientific_name` at the moment and returns the result as a JSON

These functions are meant to be the only functions the user interacts with. Each function calls another function for the specific endpoint the function uses (one of : `about.cfm/`, `authority.cfm/`, `catalog.cfm/`) that builds the query and performs the request on behalf of the caller. The request itself is performed using the `httr2` library, while my implementation of rarctos plans on writing code to perform the requests from scratch to reduce the number of external libraries any user of rarctos will need to install alongside it. `httr2` is only used for these coding challenges because the code for correctly performing network requests and downloading data is nontrivial and likely outside of the scope of the challenge.

### Results

The top-level of the file requests the user to enter their Arctos API key. After entering my API key, I called my function `get_arctos_data` with the query `'Canis lupus'` like so:

```
req = get_arctos_data('Canis lupus')
```

This has the same effect of going to the URL
`https://arctos.database.museum/component/api/v2/catalog.cfc?api_key=[OMITTED]&method=getCatalogData&queryformat=struct&scientific_name=Canis_lupus` and downloading the JSON response from Arctos into R.

I then converted the data from the request into an R dataframe with the code:

```
l = req$DATA
df <- data.frame(matrix(unlist(l), nrow = length(l), byrow = TRUE)) |>
  setNames(names(l[[1]]))
```

the resulting df:

```
> df
   collection_object_id       country verbatim_date coordinateuncertaintyinmeters   dec_lat   dec_long
1              30116230 United States    June. 2006                                                   
2              29608944        Canada      4/2/1954                                                   
3              29607567 United States       Unknown                                                   
4              29607569 United States       Unknown                                                   
5              29607570 United States       Unknown                                                   
6              29607572 United States       Unknown                                                   
7              29607427 United States       Unknown                                                   
8              30303779                                                                               
9              31965089                                                                               
10             28656018 United States    1969-04-17                          2289 31.195707 -98.728938

                guid state_prov        scientific_name                  spec_locality
1   ACUNHC:Mamm:1828     Alaska            Canis lupus                  Port Alsworth
2    ALMNH:Mamm:1429    Alberta            Canis lupus                     Whitecourt
3    ALMNH:Mamm:2352                       Canis lupus No specific locality recorded.
4    ALMNH:Mamm:2354                       Canis lupus No specific locality recorded.
5    ALMNH:Mamm:2355                       Canis lupus No specific locality recorded.
6    ALMNH:Mamm:2357                       Canis lupus No specific locality recorded.
7    ALMNH:Mamm:2383                       Canis lupus No specific locality recorded.
8  Arctos:Entity:134               Canis lupus baileyi                               
9  Arctos:Entity:319               Canis lupus baileyi                               
10    ASNHC:Mamm:400      Texas Canis lupus familiaris                       San Saba
```
