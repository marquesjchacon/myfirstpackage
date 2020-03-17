#' k-Nearest Neighbors Cross-Validation
#'
#' This function predicts the output class from a given set of covariates and
#' actual class values using the k-nearest neighbors approach of identifying
#' patterns in data points near each other.
#'
#' @param train An input data frame with all the values of the predictor
#'   variables.
#' @param cl The (actual) response values corresponding to each of the values
#'   from \code{train}.
#' @param k_nn A numeric integer representing the number of neighbors
#'   considered.
#' @param k_cv A numeric integer representing the number of folds for which to
#'   divide the observations in \code{train}.
#' @keywords prediction
#'
#' @return A list with elements \code{class} and \code{cv_err}, where
#'   \code{class} is a vector of the predicted classes for all
#'   observations, and \code{cv_err} is a numeric with the cross-validation
#'   misclassification error.
#'
#' @examples
#' my_knn_cv(my_iris[, 1:4], as.data.frame(my_iris[, 5]), 1, 5)
#' my_knn_cv(my_iris[, 1:4], as.data.frame(my_iris[, 5]), 5, 5)
#'
#' @import magrittr class stats dplyr
#' @export
my_knn_cv <- function(train, cl, k_nn, k_cv) {
  fold <- sample(rep(1:k_cv, length = nrow(train)))
  data <- cbind(train, fold)
  cv_errs <- c()
  for(i in 1:k_cv) {
    # Filter the data into a training set and test set based off the current fold
    data_train <- data[fold != i, ] %>%
      select(-c(fold))
    data_test <- data[fold == i, ] %>%
      select(-c(fold))
    cl_train <- cl[fold != i,]

    prediction <- knn(data_train, data_test, as.matrix(cl_train), k_nn)

    # Computes the proportion of observations that were classified incorrectly
    cv_errs[i] <- 1 - mean(as.matrix(cl[fold == i,]) == as.matrix(prediction))
  }
  class <- knn(train, train, as.matrix(cl), k_nn)
  cv_err <- mean(cv_errs)

  return(list("class" = class,
              "cv_err" = cv_err))
}
