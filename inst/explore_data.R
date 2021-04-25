library(futbol)
library(ggplot2)



ggplot(data=laliga) + geom_histogram(aes(x=FinalScore)) + facet_wrap(~Season)

ggplot(data=laliga) + geom_bar(aes(x=FinalRes)) + facet_wrap(~Season)

