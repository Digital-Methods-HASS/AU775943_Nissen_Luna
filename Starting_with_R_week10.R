rooms <- c(1, 5, 2, 3, 1, NA, 3, 1, 3, 2, NA, 1, 8, 3, 1, 4, NA, 1, 3, 1, 2, 1, 7, 1, NA, 4, 3 ,1 ,7 ,2 ,1 ,NA ,1, 1, 3)
sum(rooms > 2, na.rm = TRUE)
typeof(rooms)
median(rooms, na.rm = TRUE)
install.packages("tidyverse")    
library(tidyverse)
download.file(
  "https://ndownloader.figshare.com/files/11492171",
  destfile = "SAFI_clean.csv"
)
interviews <- read_csv("SAFI_clean.csv")
