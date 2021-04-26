library(tidyverse)

# Read in raw data
tmp <- read.csv("../data-raw/laliga.csv")

# Remove columns associated with betting
tmp <- data.frame(fSeason=tmp$Season, tmp[c(2:23)])
tmp$fSeason[nchar(tmp$fSeason)==3] <- paste0("0", tmp$fSeason[nchar(tmp$fSeason)==3])
tmp$Season  = paste0("20", substr(tmp$fSeason, start = 1, stop = 2))

homeSub <- tmp %>%
  select(Season, fSeason, HomeTeam, FTHG, HS, HST, HC, HF, HY, HR) %>%
  rename(Team = HomeTeam,
         Goals = FTHG, 
         Shots = HS, 
         TargetShots = HST, 
         Corners = HC, 
         Fouls = HF, 
         Yellows = HY, 
         Reds = HR)

awaySub <- tmp %>%
  select(Season, fSeason, AwayTeam, FTAG, AS, AST, AC, AF, AY, AR) %>%
  rename(Team = AwayTeam,
         Goals = FTAG, 
         Shots = AS, 
         TargetShots = AST, 
         Corners = AC, 
         Fouls = AF, 
         Yellows = AY, 
         Reds = AR)

jointRes <- homeSub %>%
  rbind(., awaySub)

save(jointRes, file="../data/laliga_team.rda")

