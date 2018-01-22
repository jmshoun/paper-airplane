plot_method_means <- function(fit, model.name, log.scale=FALSE) {
  params <- extract(fit)
  mu.front <- params$mu[, 1]
  mu.back <- params$mu[, 2]
  mu.delta <- params$mu[, 2] - params$mu[, 1]
  if (log.scale) mu.delta <- exp(mu.delta) - 1

  plot.data <- data.frame(distance = mu.delta)
  
  base.plot <- ggplot(plot.data) +
    aes(x=distance) +
    geom_histogram(aes(y=..count../sum(..count..)), bins=30) + 
    geom_vline(xintercept=0) +
    scale_y_continuous(labels=scales::percent) +
    labs(x="Difference in Distance (meters)", y="Proportion of Simulations", 
         title="Difference in Distance Between Back and Front Throws", subtitle=model.name) +
    theme_bw()
  
  if (log.scale) {
    base.plot <- base.plot + 
      scale_x_continuous("Difference in Distance (%)", labels=scales::percent)
  }
  base.plot
}
