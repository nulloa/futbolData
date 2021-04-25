# Read in raw data
tmp <- read.csv("laliga.csv")

# Remove columns associated with betting
tmp <- data.frame(fSeason=tmp$Season, tmp[c(2:22)])
tmp$Season  = paste0("20", substr(tmp$fSeason, start = 1, stop = 2))


# Create differences: Home - Away
laliga = data.frame(tmp["Season"],
                    tmp[1:4],
                    FinalScore = tmp$FTHG - tmp$FTAG,
                    FinalRes   = tmp$FTR,
                    HalfScore  = tmp$HTHG - tmp$HTAG,
                    HalfRes    = tmp$HTR,
                    Shots      = tmp$HS - tmp$AS,
                    ShotsTarg  = tmp$HST - tmp$AST,
                    Corner     = tmp$HC - tmp$AC,
                    Fouls      = tmp$HF - tmp$AF,
                    Yellow     = tmp$HY - tmp$AY,
                    Red        = tmp$HR - tmp$AR)

save(laliga, file="../Data/laliga.rda")
