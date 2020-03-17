test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("my_lm throws error when parameters don't match the expected class", {
  expect_error(my_lm(x1 ~ x2 + x3,
                     matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), 3, 3)))
  expect_error(my_lm(dhf ~ gda + dasg, my_iris))
})
