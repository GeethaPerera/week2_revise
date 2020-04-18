library(tidyverse)

# examining raw data

bom_data <- read_csv("raw_data/BOM_data.csv")
bom_data

bom_stations <- read_csv("raw_data/BOM_stations.csv")
bom_stations 

# question 1 - for each station how many days have a minimum temperature
# maximum temperature and a rainfall measurment recorded
# produced a tibble 20x2, there are 20 stations and the days with minimum
# temperature, maximum temperature and rainfall for each station listed in 
# the num_rows column

bom_data_temp_rf <- bom_data %>% 
  separate(Temp_min_max,into = c("t_min", "t_max"), sep="/") %>% # needs to be separated into two separate columns
  filter(t_min != "-",t_max != "-", Rainfall !="-" ) %>% # need to get rid of the missing values
  group_by(Station_number) %>% 
  summarise(num_rows =n())

bom_data_temp_rf 

