reference_data <- data.frame(
  catch = c(100, 200, 300),
  effort = c(10, 10, 10),
  expected_cpue = c(10, 20, 30)
)

test_that("cpue matches reference data", {
  result <- cpue(reference_data$catch, reference_data$effort)

  expect_equal(result, reference_data$expected_cpue)
})
