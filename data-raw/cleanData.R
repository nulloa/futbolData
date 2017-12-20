# Read in raw data
tmp <- read.csv("laliga.csv")

# Remove columns associated with betting
tmp <- tmp[2:22]

# Create differences: Home - Away
laliga = data.frame(tmp[1:3],
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

save(laliga, file="laliga.rda")