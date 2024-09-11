library(dplyr)
library(tidyr)

data_ori <- read.csv(paste0(getwd(), "/data/SeoulBikeData.csv"))

# Date : year-month-day
# Rented Bike count - Count of bikes rented at each hour
# Hour - Hour of he day
# Temperature-Temperature in Celsius
# Humidity - %
# Windspeed - m/s
# Visibility - 10m
# Dew point temperature - Celsius 
# Solar radiation - MJ/m2
# Rainfall - mm
# Snowfall - cm
# Seasons - Winter, Spring, Summer, Autumn
# Holiday - Holiday/No holiday
# Functional Day - NoFunc(Non Functional Hours), Fun(Functional hours)


# 1. Summary Statistics Table

data <- data_ori %>% dplyr::filter(Functioning.Day == "Yes") %>%                # filter out invalid data
  dplyr::select(-Functioning.Day) %>%                                               # drop unnecessary col
  dplyr::mutate(row_no = row_number())
  
data_encoded <- data %>% 
  dplyr::mutate(value = 1) %>% tidyr::spread(Seasons, value, fill = 0) %>%  
  dplyr::mutate(Holiday = ifelse(Holiday ==  "No Holiday", 0, 1))
  


data %>% group_by(Date, Seasons) %>%
  summarize(
    Avg_rented_bike = mean(Rented.Bike.Count)
  )

# 2. Bad Data Visualization

# 3. Good Data Visualization

# 4. Simple analysis