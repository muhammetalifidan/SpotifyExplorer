library(testthat)

rm(list = ls())
file_path <- "Labex_Q2.R"
source(file_path)

result <- spotify_search_artist("The Doors")

#--------------------------------Test 2.1--------------------------------#
test_that("Global Workspace’de spotify_search_artist adlı bir değişken olmalı.",{
  expect_true(exists("spotify_search_artist"))
})

#--------------------------------Test 2.2--------------------------------#
test_that("spotify_search_artist adlı değişkenin tipi “function” olmalı.",{
  expect_is(spotify_search_artist, "function")
})

#--------------------------------Test 2.3--------------------------------#
test_that("spotify_search_artist() herhangi bir artist ismi ile çağrıldığında döndürdüğü çıktı bir liste olmalı.",{
  expect_is(result, "list")
})