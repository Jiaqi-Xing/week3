#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Ariel Xing
# Date: 19 September 2024 [...UPDATE THIS...]
# Contact: ariel.xing@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# Any other information needed? None.


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
package <- show_package("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")
package

resources <- list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")

datastore_resources <- filter(resources, tolower(format) %in% c("csv", "geojson"))
           
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save data ####

write_csv(data, file = "~/sta304/starter_folder-main/data/raw_data/raw_data.csv") 

         
