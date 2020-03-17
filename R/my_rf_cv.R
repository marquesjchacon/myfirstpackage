#' Random Forest Cross-Validation
#'
#' This function uses the \code{my_gapminder} dataset and predicts the Life
#' Expectancy at birth (in years) from GDP per capita, using Random Forest
#' Cross-Validation.
#'
#' @param k Numeric indicating the number of folds with which to separate our
#'   dataset.
#' @keywords prediction
#'
#' @return Numeric representing the average Mean Squared Error across all
#'   \code{k} folds (the cross-validation error).
#'
#' @examples
#' my_rf_cv(4)
#' my_rf_cv(10)
#'
#' @import magrittr randomForest dplyr stats
#' @export
my_rf_cv <- function(k) {
  fold <- sample(rep(1:k, length = nrow(my_gapminder)))
  data <- cbind(my_gapminder[, c(4, 6)], fold)
  mses <- c()
  for (i in 1:k) {
    # Filter the data into a training and test set based off the current fold
    data_train <- data[fold != i, ] %>%
      select(-c(fold))
    data_test <- data[fold == i, ] %>%
      select(-c(fold))

    # Creates a model from the training set which is then used to make predictions on the test set
    mod <- randomForest(lifeExp ~ gdpPercap,
                        data = data_train, ntree = 100)
    prediction <- predict(mod, newdata = data_test)

    # Computes the MSE for the current fold
    mses[i] <- mean((prediction - data_test[, 1])^2)
  }

  # Average MSE across all folds
  return(mean(mses))
}
