-- module Main where

-- import Lib

-- main :: IO ()
-- main = someFunc

{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Spock
import Web.Spock.Config
import Web.Spock.Lucid (lucid)
import Lucid

import Control.Monad.Trans
import Data.IORef
import Data.Monoid()
import qualified Data.Text as T

data MySession = EmptySession
-- newType ServerState = ServerState {notes :: IORef [Note]}
data MyAppState = DummyAppState (IORef Int)

main :: IO ()
main =
    do ref <- newIORef 0
       spockCfg <- defaultSpockCfg EmptySession PCNoDatabase (DummyAppState ref)
       runSpock 8080 (spock spockCfg app)

app :: SpockM () MySession MyAppState ()
app =
    do get root $ lucid $ do
        doctype_
        ""
        html_ [lang_ "en"] $ do
            ""
            head_ $ do
                meta_ [charset_ "UTF-8"]
                meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1"]
                title_ "Generate Report"
                link_ [ rel_ "stylesheet", href_ "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" ]
                -- script_ [ src_ "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ] $ ""
                -- script_ [ src_ "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ] $ ""
            body_ $ do
                nav_ [ class_ "navbar navbar-default" ] $ do
                    ul_ [ class_ "nav navbar-nav" ] $ do
                        li_ [ class_ "active" ] $ a_ [ href_ "/" ] $ "Home"
                        li_ $ a_ [ href_ "/Tutorial" ] $ "Tutorial"
                        li_ $ a_ [ href_ "/Report" ] $ "Report"
            div_ [id_ "mainDiv", class_ "container"] $ do
                h1_ "Hello!"
                p_  "Welcome to the Soccer Stats Match Report Application"
       get ("hello" <//> var) $ \name ->
           do (DummyAppState ref) <- getState
              visitorNumber <- liftIO $ atomicModifyIORef' ref $ \i -> (i+1, i+1)
              text ("Hello " <> name <> ", you are visitor number " <> T.pack (show visitorNumber))
       get "Tutorial" $ lucid $ do
        doctype_
        ""
        html_ [lang_ "en"] $ do
            ""
            head_ $ do
                meta_ [charset_ "UTF-8"]
                meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1"]
                title_ "Generate Report"
                link_ [ rel_ "stylesheet", href_ "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" ]
                -- script_ [ src_ "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ] $ ""
                -- script_ [ src_ "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ] $ ""
            body_ $ do
                nav_ [ class_ "navbar navbar-default" ] $ do
                    ul_ [ class_ "nav navbar-nav" ] $ do
                        li_ [ class_ "active" ] $ a_ [ href_ "/" ] $ "Home"
                        li_ $ a_ [ href_ "/Tutorial" ] $ "Tutorial"
                        li_ $ a_ [ href_ "/Report" ] $ "Report"
            div_ [id_ "mainDiv", class_ "container"] $ do
                h4_ "Enter Stats below"
                textarea_ [ class_ "form-control", rows_ "5", cols_ "50", id_ "textArea" ] $ ""
       get "Report" $ lucid $ do 
        doctype_
        ""
        html_ [lang_ "en"] $ do
            ""
            head_ $ do
                meta_ [charset_ "UTF-8"]
                meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1"]
                title_ "Generate Report"
                link_ [ rel_ "stylesheet", href_ "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" ]
                -- script_ [ src_ "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ] $ ""
                -- script_ [ src_ "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ] $ ""
            body_ $ do
                nav_ [ class_ "navbar navbar-default" ] $ do
                    ul_ [ class_ "nav navbar-nav" ] $ do
                        li_ [ class_ "active" ] $ a_ [ href_ "/" ] $ "Home"
                        li_ $ a_ [ href_ "/Tutorial" ] $ "Tutorial"
                        li_ $ a_ [ href_ "/Report" ] $ "Report"
            div_ [ id_ "mainDiv", class_ "container" ] $ do
                a_ [ id_ "linkToPage", href_ "attempt2/app/" ] $ "Link"
                a_ [ id_ "otherLink", class_ "btn btn-primary", href_ "ExamplePage" ] $ "Other Link"
                input_ [id_ "inputValue"]                
            ""