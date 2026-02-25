test_that("biomass_index returns correct numeric results", {
  expect_equal(biomass_index(2, 5), 10)
  expect_equal(biomass_index(0.5, 4), 2)
})

test_that("biomass_index handles vector inputs correctly", {
  cpue <- c(1, 2, 3)
  area  <- c(10, 20, 30)
  expect_equal(biomass_index(cpue, area), c(10, 40, 90))
})

test_that("biomass_index returns zero when cpue or area_swept is zero", {
  expect_equal(biomass_index(0, 5), 0)
  expect_equal(biomass_index(5, 0), 0)
})

test_that("biomass_index handles NA values", {
  expect_true(is.na(biomass_index(NA, 5)))
  expect_true(is.na(biomass_index(5, NA)))
})

test_that("biomass_index errors on non-numeric input", {
  expect_error(biomass_index("a", 5))
  expect_error(biomass_index(5, "b"))
  expect_error(biomass_index("a", "b"))
})

test_that("biomass_index uses verbosity when set as an option", {
  withr::local_options(fishr.verbose = TRUE)

  expect_snapshot(biomass_index(cpue = 5, area_swept = 100))
})

test_that("biomass_index verbosity falls back to FALSE when not set", {
  withr::local_options(fishr.verbose = NULL)

  expect_no_message(biomass_index(cpue = 5, area_swept = 100))
})
