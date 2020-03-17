#' Linear Model
#'
#' This function performs multiple regression using a given formula and dataset.
#'
#' @param formula An object of class `formula`, which represents the
#'   overall relationship between our predictor variable(s) from \code{data} and
#'   our response variable from \code{data}.
#' @param data An input data frame from which \code{formula} extracts from.
#' @keywords inference prediction
#'
#' @return A `table` with rows for the coefficients of each predictor variable
#'   (including the intercept) and columns for their estimated value, standard
#'   error, t-value, and p-value (`Estimate`, `Std. Error`, `t value`, and
#'   `Pr(>|t|)` respectively).
#'
#' @examples
#' my_lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, my_iris)
#' my_lm(lifeExp ~ gdpPercap + continent, my_gapminder)
#'
#' @import Matrix stats
#' @export
my_lm <- function(formula, data) {
  x <- model.matrix(formula, data)
  y <- model.response(model.frame(formula, data))
  coeff <- solve(t(x) %*% x) %*% t(x) %*% y
  df <- nrow(x) - ncol(x)
  est_var <- sum(((y - (x %*% coeff)) ^ 2) / df)
  s_e <- diag(sqrt(est_var * solve(t(x) %*% x)))
  test_stat <- coeff / s_e
  p_vals <- pt(abs(test_stat), df, lower.tail = FALSE) * 2
  mat <- cbind(coeff, s_e, test_stat, p_vals)
  colnames(mat) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
  return(mat)
}
