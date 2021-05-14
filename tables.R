data_tle <- read_csv("tle.csv")

#set column names
colnames(data_tle) <- c("Input", 'Voucher Number',	"Herbarium",	"DNA Number",	"family",	"Genus",	"Species",	"DNA DATA",	"Sequence",	"Country",	"region")

table(data_tle["Country"])
table(data_tle['Genus'])
table(data_tle['family'])
table(data_tle["Herbarium"])
mean(apply(data_tle['Sequence'], 1, length))
data_tle %>% slect()