library(rstan)



# Setup data for model and MCMC parameters
nchains=3
dat = list(n_games,
           n_teams = length(unique(group)), 
           n_seasons = length(y),
           n_leagues,
           league,
           home_team,
           away_team,
           goal_difference
           )



if(nchains>1){
  rstan_options(auto_write = TRUE)
  options(mc.cores = parallel::detectCores())
}

# Set up the model in stan
m <- stan(file = "ZeroInfHier.stan", 
          data = dat, iter = niter, warmup=nwarmup, chains = nchains, 
          control = list(adapt_delta = 0.99, max_treedepth = 15))



