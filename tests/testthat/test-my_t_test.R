test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("my_t.test works as expected", {
  expect_equal(my_t.test(1:10,"two.sided", 8)$test_stat, -2.611165,
               tolerance = 1e-3)
  expect_identical(my_t.test(1:10, "less", 3)$df, 9)
  expect_match(my_t.test(1:10, "two.sided", 5.5)$alternative, "two.sided")
  expect_equal(my_t.test(1:10, "two.sided", 5.5)$p_val, 1, tolerance = 1e-3)
})

test_that("Non-exact input for alternative throws an informative error", {
  expect_error(my_t.test(1:10, "two.sed", 5.5))
  expect_error(my_t.test(1:10, "twosided", 5.5))
  expect_error(my_t.test(1:10, "two", 5.5))
})

test_that("Non numeric input for either x or mu throws a warning/error", {
  expect_warning(my_t.test(c("Sfasf", "ads"), "two.sided", 5))
  expect_error(my_t.test(1:10, "two.sided", "asd"))
})
