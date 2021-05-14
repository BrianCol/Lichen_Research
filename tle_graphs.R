<<<<<<< HEAD
library(tidyverse)
library(sf)

tle_world_map <- function(){
  
  #read in tle data
  data_tle <- read_csv("tle.csv")
  
  #set column names
  colnames(data_tle) <- c("Input", 'Voucher Number',	"Herbarium",	"DNA Number",	"family",	"Genus",	"Species",	"DNA DATA",	"Sequence",	"Country",	"region")
  
  #read in world data
  WorldData <- map_data('world')
  
  #count number of sequences per country
  num_countries <- data_tle %>% count(Country)
  
  #plot world map for tle
  ggplot() +
  geom_map(data = WorldData, map = WorldData,
       aes(x = long, y = lat, group = group, map_id=region),
       fill = "white", colour = "#7f7f7f", size=0.5) + 
  geom_map(data = num_countries, map=WorldData,
       aes(fill=n, map_id=Country)) +
  labs(title = "TLE World Map")
  
  dev.copy(jpeg,filename="tle_world_map.jpg");
  dev.off()
}

states_tle_map <- function(){
  
  #read in tle data
  data_tle <- read_csv("tle.csv")
  
  #set column names
  colnames(data_tle) <- c("Input", 'Voucher Number',	"Herbarium",	"DNA Number",	"family",	"Genus",	"Species",	"DNA DATA",	"Sequence",	"Country",	"region")
  
  #states tle data
  us_states <- data_tle %>% filter(Country == "USA") %>% count(region)
  us_states$region <- us_states$region %>% tolower()
  
  #states data
  USData <- map_data("state")
  
  #plot states tle map
  ggplot() +
    geom_map(data = USData, map = USData,
             aes(x = long, y = lat, group = group, map_id=region),
             fill = "white", colour = "#7f7f7f", size=0.5) + 
    geom_map(data = us_states, map=USData,
             aes(fill=n, map_id=region)) +
    labs(title = "TLE States Map")
  
  #same map
  dev.copy(jpeg,filename="tle_states_map.jpg");
  dev.off ()
}

=======
library(tidyverse)
library(sf)

tle_world_map <- function(){
  
  #read in tle data
  data_tle <- read_csv("tle.csv")
  
  #set column names
  colnames(data_tle) <- c("Input", 'Voucher Number',	"Herbarium",	"DNA Number",	"family",	"Genus",	"Species",	"DNA DATA",	"Sequence",	"Country",	"region")
  
  #read in world data
  WorldData <- map_data('world')
  
  #count number of sequences per country
  num_countries <- data_tle %>% count(Country)
  
  #plot world map for tle
  ggplot() +
  geom_map(data = WorldData, map = WorldData,
       aes(x = long, y = lat, group = group, map_id=region),
       fill = "white", colour = "#7f7f7f", size=0.5) + 
  geom_map(data = num_countries, map=WorldData,
       aes(fill=n, map_id=Country)) +
  labs(title = "TLE World Map")
  
  dev.copy(jpeg,filename="tle_world_map.jpg");
  dev.off()
}

tle_states_map <- function(){
  
  #read in tle data
  data_tle <- read_csv("tle.csv")
  
  #set column names
  colnames(data_tle) <- c("Input", 'Voucher Number',	"Herbarium",	"DNA Number",	"family",	"Genus",	"Species",	"DNA DATA",	"Sequence",	"Country",	"region")
  
  #states tle data
  us_states <- data_tle %>% filter(Country == "USA") %>% count(region)
  us_states$region <- us_states$region %>% tolower()
  
  #states data
  USData <- map_data("state")
  
  #plot states tle map
  ggplot() +
    geom_map(data = USData, map = USData,
             aes(x = long, y = lat, group = group, map_id=region),
             fill = "white", colour = "#7f7f7f", size=0.5) + 
    geom_map(data = us_states, map=USData,
             aes(fill=n, map_id=region)) +
    labs(title = "TLE States Map")
  
  #same map
  dev.copy(jpeg,filename="tle_states_map.jpg");
  dev.off ()
}

>>>>>>> 44861a532b78598fa60112a9062d06e02450bec7
