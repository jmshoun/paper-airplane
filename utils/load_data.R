load_throws <- function() {
  read_tsv("data/airplane_throws.tsv") %>% 
    mutate(trial = 1:n(),
           method = recode(method, front="Front", back="Back"))
}

throws_to_stan_data <- function(data) {
  list(N = nrow(data),
       distance_ = data$distance,
       method = recode(data$method, Front=1, Back=2))
}
