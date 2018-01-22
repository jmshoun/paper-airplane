data {
  int<lower=1> N;
  int<lower=1, upper=2> method[N];
  real<lower=0> distance_[N];
}
parameters {
  real<lower=0> mu[2];
  real<lower=0> sigma[2];
}
model {
  distance_ ~ normal(mu[method], sigma[method]);
}
