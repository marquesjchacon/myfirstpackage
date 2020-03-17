#' t-Test Application
#'
#' This function performs a one sample t-test.
#'
#' @param x Numeric vector representing sample data values.
#' @param alternative String that indicates the alternative hypothesis of the
#'   t-test, must be one of "two.sided", "greater" or "less".
#' @param mu Numeric indicating the value of the null hypothesis value of the
#'   mean.
#' @keywords inference
#'
#' @return List with elements \code{test_stat}, the value of the t-statistic,
#'   \code{df}, the degrees of freedom for the t-statistic, \code{alternative},
#'   the value of the parameter \code{alternative}, and \code{p_val}, the
#'   numeric p-value that was calculated by the t-test.
#'
#' @examples
#' my_t.test(1:10, "two.sided", 8)
#' my_t.test(1:10, "less", 3)
#'
#' @import stringr stats
#' @export
my_t.test <- function(x, alternative, mu) {
  if (str_detect(alternative, "two.sided|less|greater") == FALSE) {
    stop("Use an appropriate string (\"two.sided\", \"less\", or \"greater\")")
  }
  std_error <- sd(x) / sqrt(length(x))
  test_stat <- (mean(x) - mu) / std_error
  df <- length(x) - 1
  if (alternative == "two.sided") {
    p_val <- pt(abs(test_stat), df, lower.tail = FALSE) * 2
  } else if (alternative == "less") {
    p_val <- pt(test_stat, df, lower.tail = TRUE)
  } else if (alternative == "greater") {
    p_val <- pt(test_stat, df, lower.tail = FALSE)
  }
  return(list("test_stat" = test_stat,
              "df" = df,
              "alternative" = alternative,
              "p_val" = p_val))
}
