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

# question 2 - which month saw the lowest average temperature difference

temp_diff <- bom_data %>% 
  separate(Temp_min_max,into = c("t_min", "t_max"), sep="/")%>% 
  filter(t_min != "-",t_max != "-") %>% 
  mutate(t_min = as.numeric(t_min))%>% # need to convert values in these columns to numerics
  mutate(t_max = as.numeric(t_max ))%>%
  mutate(temp_difference = t_max-t_min) %>% # to calculate the temperature difference
select(Station_number, Year, Month, Day, temp_difference) 

month_lowest_temp_diff <- temp_diff %>% 
  group_by(Month) %>% 
  summarise(mean_temp_diff=mean(temp_difference))%>% # calculate the mean temperature difference
  arrange(mean_temp_diff) 

month_lowest_temp_diff

# June was the month with lowest average daily temperature difference (8.74)

# question 3

# which state saw the lowest average daily temperature difference?

# the station data is not in a tidy format 
# as stations are listed in columns and the information on each station
# are listed in rows

bom_stations_long <- gather(bom_stations,Station_number,value="value",2:21) # arrange the station numbers
# in one column and all the other data in the next column
bom_stations_long                           
bom_stations_spread <- spread(bom_stations_long, info, value="value") # to arrange other data into
# separate columns next to the station number column
bom_stations_spread
bom_stations_final <- mutate(bom_stations_spread,Station_number=as.numeric(Station_number)) # to change data in the 
# station number column to numeric values
bom_stations_final

bom_final <- full_join(bom_data,bom_stations_final)
bom_final

temp_diff_by_state <- bom_final %>% 
  separate(Temp_min_max,into = c("t_min", "t_max"), sep="/")%>% 
  filter(t_min != "-",t_max != "-") %>% 
  mutate(t_min = as.numeric(t_min))%>% # need to convert values in these columns to numerics
  mutate(t_max = as.numeric(t_max ))%>%
  mutate(temp_difference = t_max-t_min) %>% # to calculate the temperature difference
  group_by(state)
temp_diff_by_state 

state_lowest_temp_diff <- temp_diff_by_state %>% 
  summarise(mean_temp_diff=mean(temp_difference))%>% # calculate the mean temperature difference
  arrange(mean_temp_diff)
state_lowest_temp_diff

# The state that showed the lowest average temperature difference is Queensland 
#with a temperature difference of 7.36

# question 4

library(tidyverse) # had to run this again as I closed the session at the end of question 3
# and started the session again

bom_data <- read_csv("raw_data/BOM_data.csv")
bom_data

bom_stations <- read_csv("raw_data/BOM_stations.csv")
bom_stations 

bom_stations_long <- gather(bom_stations,Station_number,value="value",2:21) 
bom_stations_long                           
bom_stations_spread <- spread(bom_stations_long, info, value="value") 
bom_stations_spread
bom_stations_final <- mutate(bom_stations_spread,Station_number=as.numeric(Station_number))

bom_stations_final

bom_final <- full_join(bom_data,bom_stations_final)
bom_final

bom_solar_exposure <- bom_final %>% 
  mutate(lon = as.numeric(lon), Solar_exposure = as.numeric(Solar_exposure)) %>% # to change values for 
  #longitude and Solar_exposure to neumeric values
  filter (Solar_exposure!="NA") %>% # after changing solar exposure values to neumeric
  # the values with a '-' converted to NA
  group_by(lon)%>% # to groups the longitudes together
  summarise(average_solar_exposure=mean(Solar_exposure))%>% # to calculate averages for each longitude
  arrange (average_Solar_exposure)
bom_solar_exposure

# the eastmost (highest longitude) 
#weather station have the higher average solar exposure
