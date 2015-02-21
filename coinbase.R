# define your oauth2 app to get "Client ID" and "Client Secret" at https://www.coinbase.com/settings/api
# and store them in ~/.coinbase.R
#appKey="<MY_CLIENT_ID>"
#appSecret="<MY_CLIENT_SECRET>"
source("~/.coinbase.R")

# UNDER CONSTRUCTION
# UNDER CONSTRUCTION
# UNDER CONSTRUCTION not actually working yet
# UNDER CONSTRUCTION
# UNDER CONSTRUCTION

require(httr)
require(jsonlite)
require(httpuv)

endpoints <- oauth_endpoint(
  authorize = "https://www.coinbase.com/oauth/authorize",
  access="https://www.coinbase.com/oauth/token"
)

myapp <- oauth_app("coinbase", key=appKey, secret=appSecret)

ctoken <- oauth2.0_token(endpoints, myapp, cache=FALSE,scope="user")

req <- GET("https://api.coinbase.com/v1/accounts", config(token = ctoken))
stop_for_status(req)
content(req)

