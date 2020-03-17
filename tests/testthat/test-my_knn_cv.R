test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("an error is thrown when parameters are of the wrong class", {
  expect_error(my_knn_cv("sfaf", my_iris[, 5], 1, 5))
  expect_error(my_knn_cv(my_iris[, 1:4], "faaf", 1, 5))
  expect_error(my_knn_cv(my_iris[, 1:4], my_iris[, 5], "asfas", 5))
  expect_error(my_knn_cv(my_iris[, 1:4], my_iris[, 5], 1, "adsf"))
  expect_error(my_knn_cv(my_iris$Sepal.Length, my_iris[, 5], 1, 5))
  expect_error(my_knn_cv(my_iris[, 5], my_iris$Sepal.Length, 1, 5))
})
