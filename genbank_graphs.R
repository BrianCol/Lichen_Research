library(tidyverse)
library(sf)

gen_world_map <- function(){
  
  #read in genbank data
  data_gen <- read_csv("genbank.csv")
  
  #read in world data
  WorldData <- map_data('world')
  
  #count countries
  num_countries <- data_gen %>% count(Country)
  
  #plot world map
  ggplot() +
    geom_map(data = WorldData, map = WorldData,
             aes(x = long, y = lat, group = group, map_id=region),
             fill = "white", colour = "#7f7f7f", size=0.5) + 
    geom_map(data = num_countries, map=WorldData,
             aes(fill=n, map_id=Country)) +
    labs(title = "Genbank World Map")

  #same map
  dev.copy(jpeg,filename="genbank_world_map.jpg");
  dev.off ()
}

gen_states_map <- function(){
  
  #read in genbank data
  data_gen <- read_csv("genbank.csv")
  
  #states data
  USData <- map_data("state")
  
  
  colnames(data_gen)[11] <- "region"
  
  us_states <- data_gen %>% filter(Country == "USA") %>% count(region)
  us_states$region <- us_states$region %>% tolower()
  
  ggplot() +
    geom_map(data = USData, map = USData,
             aes(x = long, y = lat, group = group, map_id=region),
             fill = "white", colour = "#7f7f7f", size=0.5) + 
    geom_map(data = us_states, map=USData,
             aes(fill=n, map_id=region)) +
    labs(title = "Genbank States Map")
  
  #same map
  dev.copy(jpeg,filename="genbank_states_map.jpg");
  dev.off ()
  
}
