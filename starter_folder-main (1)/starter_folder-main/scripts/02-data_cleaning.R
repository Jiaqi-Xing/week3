#### Preamble ####
# Purpose: Cleans the raw marriage data into an analysis dataset
# Author: Ariel Xing
# Date: 19 September 2024 
# Contact: ariel.xingr@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("~/sta304/starter_folder-main/data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  separate(col = time_period,
           into = c("year", "month"),
           sep = "-") |>
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-")))

cleaned_data |>
  ggplot(aes(x = year,
             y = marriage_licenses)) + 
  geom_point()


#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
