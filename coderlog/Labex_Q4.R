library(httr)

#----------------- Spotify Token Alma -----------------# 
spotify_token <- function() {
  endpoint_uri <- "https://accounts.spotify.com/api/token"
  
  body <- list(
    grant_type = "client_credentials",
    client_id = (Sys.getenv("SPOTIFY_ID")),
    client_secret = (Sys.getenv("SPOTIFY_SECRET"))
  )
  
  response <- POST(
    url = endpoint_uri,
    body = body,
    add_headers("Content-Type" = "application/x-www-form-urlencoded"),
    encode = "form"
  )
  
  status_code <- status_code(response)
  
  if (status_code == 200) {
    token <- content(response)$access_token
    bearer_token <- paste("Bearer",token)
    
    result <- list(
      status_code = status_code,
      token = bearer_token
    )
    
    return(result)
  } else 
  {
    error <- content(response)
    return(error)
  }
}
token <- spotify_token()
print(token)



#----------------- Sanatçı Adı ile Çıkan Sonuçları Listeleme -----------------# 
spotify_search_artist <- function(artist_name) {
  if(!is.character(artist_name)) stop("Artist name must be character type.");
  
  search_url <- paste0(
    "https://api.spotify.com/v1/search?q=", URLencode(artist_name),
    "&type=artist&limit=",5)
  token <- spotify_token()
  
  response <- GET(
    url = search_url,
    add_headers("Authorization" = token$token)
  )
  
  status_code <- status_code(response)
  
  if (status_code == 200) {
    search_result <- content(response, type = "application/json")
    artists <- search_result$artists$items[seq_len(5)]
    
    search_results <- data.frame(
      artist = sapply(artists, function(x) x$name),
      id = sapply(artists, function(x) x$id)
    )
    
    result <- list(
      status_code = status_code,
      search_results = search_results
    )
    
    return(result)
  }
  else {
    error <- content(response)
    return(error)
  }
}
artists <- spotify_search_artist("Eminem")
print(artists)



#----------------- Sanatçı ID ile Popüler Şarkıları Çekme -----------------# 
spotify_artist_top_tracks <- function(artist_id) {
  endpoint_uri <- paste0("https://api.spotify.com/v1/artists/", artist_id, 
                         "/top-tracks?market=US")
  token <- spotify_token()
  
  response <- GET(
    url = endpoint_uri,
    add_headers('Authorization' = token$token)
  )
  
  status_code <- status_code(response)
  search_result <- content(response, type = "application/json")
  
  tracks_list <- lapply(search_result$tracks, function(track) {
    list(
      id = track$id,
      name = track$name,
      artist = track$artists[[1]]$name,
      album = track$album$name,
      year = substr(track$album$release_date, 1, 10)
    )
  })
  
  tracks <- list(
    status_code <- status_code,
    resultdf <- as.data.frame(do.call(rbind, tracks_list), stringAsFactors=FALSE)
  )
  
  return(tracks)
}
