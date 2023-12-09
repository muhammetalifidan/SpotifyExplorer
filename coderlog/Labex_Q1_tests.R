library(testthat)

rm(list = ls())
file_path <- "Labex_Q1.R"
source(file_path)

result <- spotify_token()

#--------------------------------Test 1.1--------------------------------#
test_that("Global Workspace'de spotify_token adlı bir değişken olmalı", {
  expect_true(exists("spotify_token"))
})

#--------------------------------Test 1.2--------------------------------#
test_that("spotify_token adlı değişken bir 'function' tipinde olmalı", {
  expect_true(is.function(spotify_token))
})

#--------------------------------Test 1.3--------------------------------#
test_that("spotify_token() çağrıldığında döndürdüğü çıktı bir liste olmalı", {
  expect_true(is.list(result))
})