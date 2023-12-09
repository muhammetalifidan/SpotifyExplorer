library(testthat)

rm(list = ls())
file_path <- "Labex_Q3.R"
source(file_path)

result <- spotify_artist_top_tracks("0TnOYISbd1XYRBk9myaseg")

#--------------------------------Test 1.1--------------------------------#
test_that("Global Workspace’de spotify_artist_top_tracks adlı bir değişken olmalı.",{
  expect_true(exists("spotify_artist_top_tracks"))
})

#--------------------------------Test 1.2--------------------------------#
test_that("spotify_artist_top_tracks adlı değişkenin tipi “function” olmalı.",{
  expect_is(spotify_artist_top_tracks, "function")
})

#--------------------------------Test 1.3--------------------------------#
test_that("spotify_artist_top_tracks() herhangi bir artist_id ile çağrıldığında döndürdüğü çıktı bir list olmalı.",{
  expect_true(is.list(result))
})