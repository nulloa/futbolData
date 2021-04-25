library(readr)
library(dplyr)

# Setup locations of csv files
files = c("http://www.football-data.co.uk/mmz4281/1718/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/1617/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/1516/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/1415/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/1314/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/1213/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/1112/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/1011/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/0910/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/0809/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/0708/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/0607/SP1.csv",
          "http://www.football-data.co.uk/mmz4281/0506/SP1.csv")

# Create function to read csv and add season
read_football_csv = function(x){
  tmp = read_csv(x)
  tmp$Season = unlist(strsplit(x, c("/")))[5]
  return(tmp)
}

# Merge into one data set
laliga = lapply(files, read_football_csv) %>% bind_rows()

write.csv(laliga, file="laliga.csv", row.names=FALSE)
