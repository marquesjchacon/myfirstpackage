test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("my_rf_cv produces relatively correct numerics", {
  expect_equal(my_rf_cv(5), 76, tolerance = 5)
  expect_equal(my_rf_cv(2), 76, tolerance = 10)
  expect_equal(my_rf_cv(10), 76, tolerance = 2)
})

test_that("my_rf_cv throws an error when k = 1", {
  expect_error(my_rf_cv(1))
})
