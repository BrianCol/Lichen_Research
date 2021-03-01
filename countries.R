library(tidyverse)
library(DataExplorer)
library(sf)

data_tle <- read_csv("tle.csv")
colnames(data) <- c("Input", 'Voucher Number',	"Herbarium",	"DNA Number",	"family",	"Genus",	"Species",	"DNA DATA",	"Sequence",	"Country",	"region")

data_gen <- read_csv("genbank.csv")

plot_missing(data_tle)

WorldData <- map_data('world')

num_countries <- data_tle %>% count(Country)

ggplot() +
  geom_map(data = WorldData, map = WorldData,
           aes(x = long, y = lat, group = group, map_id=region),
           fill = "white", colour = "#7f7f7f", size=0.5) + 
  geom_map(data = num_countries, map=WorldData,
           aes(fill=n, map_id=Country))


us_states <- data %>% filter(Country == "USA") %>% count(region)
us_states$region <- us_states$region %>% tolower()

USData <- map_data("state")

#new_data <- left_join(USData, us_states)


ggplot() +
  geom_map(data = USData, map = USData,
           aes(x = long, y = lat, group = group, map_id=region),
           fill = "white", colour = "#7f7f7f", size=0.5) + 
  geom_map(data = us_states, map=USData,
           aes(fill=n, map_id=region))


#genbank
num_countries <- data_gen %>% count(Country)

ggplot() +
  geom_map(data = WorldData, map = WorldData,
           aes(x = long, y = lat, group = group, map_id=region),
           fill = "white", colour = "#7f7f7f", size=0.5) + 
  geom_map(data = num_countries, map=WorldData,
           aes(fill=n, map_id=Country))
colnames(data_gen)[11] <- "region"

us_states <- data_gen %>% filter(Country == "USA") %>% count(region)
us_states$region <- us_states$region %>% tolower()

ggplot() +
  geom_map(data = USData, map = USData,
           aes(x = long, y = lat, group = group, map_id=region),
           fill = "white", colour = "#7f7f7f", size=0.5) + 
  geom_map(data = us_states, map=USData,
           aes(fill=n, map_id=region))



#working
data_working <- read_csv("working.csv")
plot_missing(data_working)
str(data_working)

