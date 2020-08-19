{-# LANGUAGE OverloadedStrings #-}

module App where

import           Web.Scotty
import           Data.Text
import           Network.HTTP.Types

main :: IO ()
main = scotty 3000 $ do
  get "/health" $ text "OK"

  post "/login" handleLogin

handleLogin :: ActionM ()
handleLogin = do
  username <- param "user"
  password <- param "password"
  if login username password then text "Success" else status status403

login :: Text -> Text -> Bool
login "admin" "admin" = True
login _       _       = False
