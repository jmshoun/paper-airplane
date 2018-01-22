plot_method_means <- function(fit, model.name) {
  params <- extract(fit)
  mu.front <- params$mu[, 1]
  mu.back <- params$mu[, 2]
  mu.delta <- params$mu[, 2] - params$mu[, 1]

  plot.data <- data.frame(distance = mu.delta)
  
  ggplot(plot.data) +
    aes(x=distance) +
    geom_histogram(aes(y=..count../sum(..count..))) + 
    scale_y_continuous(labels=scales::percent) +
    geom_vline(xintercept=0) +
    labs(x="Difference in Distance (meters)", y="Proportion of Simulations", 
         title="Difference in Distance Between Back and Front Throws", subtitle=model.name) +
    theme_bw()
}
