library(httr)

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
  token <- content(response)$access_token
  bearer_token <- paste("Bearer", token)
  
  result <- list(
    status_code <- status_code,
    token <- bearer_token
  )
  
  return(result)
}

