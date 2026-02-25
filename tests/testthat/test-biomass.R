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
