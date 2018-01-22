back_superiority_probability <- function(fit) {
  params <- extract(fit)
  prob <- mean(params$mu[, 2] > params$mu[, 1])
  sprintf("%.02f%%", prob * 100)
}

back_superiority_distance <- function(fit) {
  params <- extract(fit)
  delta <- mean(params$mu[, 2] - params$mu[, 1])
  round(delta, 2)
}

back_superiority_percent <- function(fit) {
  params <- extract(fit)
  delta <- mean(params$mu[, 2] - params$mu[, 1])
  delta.percent <- exp(delta) - 1
  sprintf("%.02f%%", delta.percent * 100)
}
