-- module Main where

-- import Lib

-- main :: IO ()
-- main = someFunc

{-# LANGUAGE OverloadedStrings #-}
-- {-#LANGUAGE ExtendedDefaultRules#-}
-- {-#LANGUAGE NoMonomorphismRestriction#-}

module Main where

import Web.Spock
-- import Web.Spock.Simple
import Web.Spock.Config
import Web.Spock.Lucid (lucid)
import Lucid
import Network.Wai.Middleware.Static
-- import Lucid.Base

-- import Control.Monad.Trans
import Data.IORef
import Data.Monoid()
-- import Data.Monoid((</>))
import qualified Data.Text as T
-- import Data.List (intersperse)
-- import Data.Foldable (foldMap,Foldable)

data MySession = EmptySession
-- newType ServerState = ServerState {notes :: IORef [Note]}
data MyAppState = DummyAppState (IORef Int)

-- class With script  where
--     -- | With the given element(s), use the given attributes.
--     with :: script -- ^ Some element, either @Html a@ or @Html a -> Html a@.
--          -> [src]
--          -> a

-- instance TermRaw Text Attribute where
--   termRawWith key _ value = makeAttribute key value

-- includeJS :: [T.Text] -> Html ()
-- includeJS = foldMap (\s-> script_ [src_ s] "")
-- Found: https://github.com/aleator/LambdaLuento/blob/master/Slides.hs

-- myScript :: Html()
-- myScript = (script_ [ src_ "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ] $ "")

main :: IO ()
main =
    do ref <- newIORef 0
       spockCfg <- defaultSpockCfg EmptySession PCNoDatabase (DummyAppState ref)
       runSpock 8080 (spock spockCfg app)
    --    quickHttpServe $ 
    --        ensure Cookie >> route
    --         [("static/reportGenerate", sendFile "static/reportGenerate")]

app :: SpockM () MySession MyAppState ()
app =
    do middleware (staticPolicy (addBase "static"))
       get root $ lucid $ do
        doctype_
        ""
        html_ [lang_ "en"] $ do
            ""
            head_ $ do
                meta_ [charset_ "UTF-8"]
                meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1"]
                title_ "Home"
                link_ [ rel_ "stylesheet", href_ "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" ]
                --(toHtml "<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>")
                script_ [ src_ ("https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" :: T.Text) ] $ ( "" :: T.Text)
                script_ [ src_ ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" :: T.Text )] $ ( "" :: T.Text)
            body_ $ do
                nav_ [ class_ "navbar navbar-default" ] $ do
                    ul_ [ class_ "nav navbar-nav" ] $ do
                        li_ [ class_ "active" ] $ a_ [ href_ "/" ] $ "Home"
                        li_ $ a_ [ href_ "/Tutorial" ] $ "Tutorial"
                        li_ $ a_ [ href_ "/GenerateReport" ] $ "Generate Report"
            div_ [id_ "mainDiv", class_ "container"] $ do
                h1_ "Hello!"
                p_  "Welcome to the Soccer Stats Match Report Application"

            ""
       get ("Hello" <//> var) $ \name ->
           do text ("<div id="<> name <> "><div>")
               -- html ("reportTable.js")
               -- do div_ ""
              
              -- html ("<div><div>")
              
              -- html ("<div>")
       
       get "ViewReport" $ lucid $  -- <//> wildcard ) $ \myParam -> text ("Hello" <> myParam ) $ lucid $
        do doctype_ 
           ""
           html_ [lang_ "en"] $ do
             ""
             head_ $ do
                meta_ [charset_ "UTF-8"]
                meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1"]
                title_ "View Report"
                link_ [ rel_ "stylesheet", href_ "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" ]
                script_ [ src_ ("https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" :: T.Text) ] $ ( "" :: T.Text)
                script_ [ src_ ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" :: T.Text )] $ ( "" :: T.Text)
                script_ [ src_ ("https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js" :: T.Text) ] $ ( "" :: T.Text)
                script_ [src_ ("reportTable.js" :: T.Text)] $ ("" :: T.Text)
             body_ $ do
                nav_ [ class_ "navbar navbar-default" ] $ do
                    ul_ [ class_ "nav navbar-nav" ] $ do
                        li_ [ class_ "active" ] $ a_ [ href_ "/" ] $ "Home"
                        li_ $ a_ [ href_ "/Tutorial" ] $ "Tutorial"
                        li_ $ a_ [ href_ "/GenerateReport" ] $ "Generate Report"   
             div_ [id_ "mainDiv", class_ "container"] $ do
                h4_ "Match Report Table Below"        

       get "Tutorial" $ lucid $ do
        doctype_
        ""
        html_ [lang_ "en"] $ do
            ""
            head_ $ do
                meta_ [charset_ "UTF-8"]
                meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1"]
                title_ "Tutorial"
                link_ [ rel_ "stylesheet", href_ "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" ]
                script_ [ src_ ("https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" :: T.Text) ] $ ( "" :: T.Text)
                script_ [ src_ ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" :: T.Text )] $ ( "" :: T.Text)
                -- includeJS [ "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" 
                --     , "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ]
                    
            body_ $ do
                nav_ [ class_ "navbar navbar-default" ] $ do
                    ul_ [ class_ "nav navbar-nav" ] $ do
                        li_ [ class_ "active" ] $ a_ [ href_ "/" ] $ "Home"
                        li_ $ a_ [ href_ "/Tutorial" ] $ "Tutorial"
                        li_ $ a_ [ href_ "/GenerateReport" ] $ "Generate Report"
            div_ [id_ "mainDiv", class_ "container"] $ do
                h4_ "Enter Stats below"
                textarea_ [ class_ "form-control", rows_ "5", cols_ "50", id_ "textArea" ] $ ""
       get "GenerateReport" $ lucid $ do 
        doctype_
        ""
        html_ [lang_ "en"] $ do
            ""
            head_ $ do
                meta_ [charset_ "UTF-8"]
                meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1"]
                title_ "Generate Report"
                link_ [ rel_ "stylesheet", href_ "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" ]
                script_ [ type_ ("text/javascript" :: T.Text ), src_ ("https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" :: T.Text )] $ ("" :: T.Text) 
                script_ [ src_ ("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" :: T.Text) ] $ ( "" :: T.Text)
                script_ [ src_ ("https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js" :: T.Text) ] $ ( "" :: T.Text)
                script_ [ src_ ("reportGenerate.js" :: T.Text)] $ ("" :: T.Text)
            body_ $ do
                nav_ [ class_ "navbar navbar-default" ] $ do
                    ul_ [ class_ "nav navbar-nav" ] $ do
                        li_ [ class_ "active" ] $ a_ [ href_ "/" ] $ "Home"
                        li_ $ a_ [ href_ "/Tutorial" ] $ "Tutorial"
                        li_ $ a_ [ href_ "/GenerateReport" ] $ "Generate Report"
            div_ [ id_ "mainDiv", class_ "container" ] $ do
                div_ [ class_ "form-group"] $ do 
                    label_ [ for_ "team0Name", class_ "col-form-label"] $ "Home Team"
                    input_ [ type_ "text", class_ "form-control", id_ "team0Name", value_ ""]
                div_ [ class_ "form-group"] $ do
                    label_ [for_ "team1Name", class_ "col-form-label"] $ "Away Team"
                    input_ [type_ "text", class_ "form-control", id_ "team1Name", value_ ""]
                div_ [ class_ "form-group"] $ do
                    label_ [for_ "matchDay", class_ "col-form-label"] $ "Date"
                    input_ [type_ "date", class_ "form-control", id_ "matchDay", value_ ""]
                div_ [ class_ "form-group"] $ do
                    label_ [for_ "stats", class_ "col-form-label"] $ "Match Stats"
                    textarea_ [ class_ "form-control", rows_ "25", cols_ "20", id_ "stats" ] $ ""
                div_ $ do
                    h1_ [id_ "errorMsg", style_ "color: red; display: none"] $ "Please check your input"   
                div_ [class_ "form-group"] $ do
                    a_ [ id_ "generateReport", class_ "btn btn-success", href_ "ViewReport" ] $ "Generate Match Report"
                
            ""