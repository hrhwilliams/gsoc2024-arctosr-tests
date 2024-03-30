# ArctosR Tests

This repository contains implementations for all of the tests for the ArctosR project:

Easy: Found in the `easy/` folder of this repository with summary in that folder's README.md

- Install the package spocc and download occurrence data for one mammal species of your choice.
- Filter the data to keep only records with geographic coordinates.
- Filter the data to keep records with coordinate uncertainty less than or equal to 1000 meters.
- Filter the data to keep only the columns: species, decimalLongitude, decimalLatitude, day, month, and year.
- Prepare a summary of the number of records after each of the steps described above.

Medium: Found in the `medium/` folder of this repository with summary in that folder's README.md

- Create a function that downloads specimen records from the Arctos database (https://arctos.database.museum/) via their API (https://handbook.arctosdb.org/documentation/api.html) with queries using species scientific/Latin names.
- Demonstrate the use of the function with a mammal species of your choice.

Hard: Found in the `hard/` folder of this repository with summary in that folder's README.md. The `.yaml` file associated with the GitHub action set up for the last challenge is found in the repository's root folder inside `.github/`.

- Create an R package that contains the function created above (and helper functions if needed).
- Create an example of how to install the package and use the function.
- Document the function and the package in general.
- Check the package using GitHub actions (no errors, warnings, or notes).