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
                nav_ [ class_ "navbar navbar-inverse" ] $ do
                    ul_ [ class_ "nav navbar-nav" ] $ do
                        li_ [ class_ "active" ] $ a_ [ href_ "/" ] $ "Home"
                        li_ $ a_ [ href_ "/Tutorial" ] $ "Tutorial"
                        li_ $ a_ [ href_ "/GenerateReport" ] $ "Generate Report"
            div_ [id_ "mainDiv", class_ "container"] $ do
                h1_ "Hello!"
                p_  "Welcome to the Soccer Stats Match Report Application"

            ""
    --    get ("Hello" <//> var) $ \name ->
    --        do text ("<div id="<> name <> "><div>")
    --            -- html ("reportTable.js")
    --            -- do div_ ""
              
    --           -- html ("<div><div>")
              
    --           -- html ("<div>")
       
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
                nav_ [ class_ "navbar navbar-inverse" ] $ do
                    ul_ [ class_ "nav navbar-nav" ] $ do
                        li_ [ class_ "active" ] $ a_ [ href_ "/" ] $ "Home"
                        li_ $ a_ [ href_ "/Tutorial" ] $ "Tutorial"
                        li_ $ a_ [ href_ "/GenerateReport" ] $ "Generate Report"   
             div_ [id_ "mainDiv", class_ "container"] $ do
                h4_ "Match Report Table"      
                div_ [id_ "tableDiv", class_ "container"] $ do
                    table_ [id_ "statsTable", class_ "table table-hover"] $ do
                        tr_ [id_ "headerRow"] $ do
                            td_ [id_ "SOCC_date"] $ ""
                            td_ $ do
                                b_ [id_ "SOCC_team0"] $ "Team 0"
                            td_ $ do
                                b_ [id_ "SOCC_team1"] $ "Team 1"
                        tr_ [id_ "SOCC_sa"] $ do
                            td_ $ do
                                b_ "Shot Attempts"
                            td_ [id_ "SOCC_sa0"] $ ""
                            td_ [id_ "SOCC_sa1"] $ ""
                        tr_ [id_ "SOCC_so"] $ do
                            td_ $ do
                                b_ "Shots on Target"
                            td_ [id_ "SOCC_so0"] $ ""
                            td_ [id_ "SOCC_so1"] $ ""
                        tr_ [id_ "SOCC_p"] $ do
                            td_ $ do
                                b_ "Passes"
                            td_ [id_ "SOCC_p0"] $ ""
                            td_ [id_ "SOCC_p1"] $ ""
                        tr_ [id_ "SOCC_t"] $ do
                            td_ $ do
                                b_ "Tackles"
                            td_ [id_ "SOCC_t0"] $ ""
                            td_ [id_ "SOCC_t1"] $ ""
                        tr_ [id_ "SOCC_g"] $ do
                            td_ $ do
                                b_ "Goals"
                            td_ [id_ "SOCC_g0"] $ ""
                            td_ [id_ "SOCC_g1"] $ ""
                        tr_ [id_ "SOCC_a"] $ do
                            td_ $ do
                                b_ "Assists"
                            td_ [id_ "SOCC_a0"] $ ""
                            td_ [id_ "SOCC_a1"] $ ""
                        tr_ [id_ "SOCC_c"] $ do
                            td_ $ do
                                b_ "Corners"
                            td_ [id_ "SOCC_c0"] $ ""
                            td_ [id_ "SOCC_c1"] $ ""
                        tr_ [id_ "SOCC_yc"] $ do
                            td_ $ do
                                b_ "Yellow Cards"
                            td_ [id_ "SOCC_yc0"] $ ""
                            td_ [id_ "SOCC_yc1"] $ ""
                        tr_ [id_ "SOCC_rc"] $ do
                            td_ $ do
                                b_ "Red Cards"
                            td_ [id_ "SOCC_rc0"] $ ""
                            td_ [id_ "SOCC_rc1"] $ ""
                        tr_ [id_ "SOCC_f"] $ do
                            td_ $ do
                                b_ "Fouls"
                            td_ [id_ "SOCC_f0"] $ ""
                            td_ [id_ "SOCC_f1"] $ ""
                        tr_ [id_ "SOCC_of"] $ do
                            td_ $ do
                                b_ "Offsides"
                            td_ [id_ "SOCC_of0"] $ ""
                            td_ [id_ "SOCC_of1"] $ ""
                        tr_ [id_ "SOCC_pn"] $ do
                            td_ $ do
                                b_ "Penalties"
                            td_ [id_ "SOCC_pn0"] $ ""
                            td_ [id_ "SOCC_pn1"] $ ""
                        tr_ [id_ "SOCC_b"] $ do
                            td_ $ do
                                b_ "Blocks"
                            td_ [id_ "SOCC_b0"] $ ""
                            td_ [id_ "SOCC_b1"] $ ""
                        tr_ [id_ "SOCC_og"] $ do
                            td_ $ do
                                b_ "Own Goals"
                            td_ [id_ "SOCC_og0"] $ ""
                            td_ [id_ "SOCC_og1"] $ ""                      
                            

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
                nav_ [ class_ "navbar navbar-inverse" ] $ do
                    ul_ [ class_ "nav navbar-nav" ] $ do
                        li_ [ class_ "active" ] $ a_ [ href_ "/" ] $ "Home"
                        li_ $ a_ [ href_ "/Tutorial" ] $ "Tutorial"
                        li_ $ a_ [ href_ "/GenerateReport" ] $ "Generate Report"
            div_ [id_ "mainDiv", class_ "container"] $ do
                h4_ "Below are the list of commands."
                -- br_ ""
                ul_ [class_ "list-group"] $ do
                    li_ [class_ "list-group-item"] "sa: Shot attempt"
                    li_ [class_ "list-group-item"] "so: Shot on target"
                    li_ [class_ "list-group-item"] "p: Pass"
                    li_ [class_ "list-group-item"] "t: Tackle"
                    li_ [class_ "list-group-item"] "g: Goal"
                    li_ [class_ "list-group-item"] "a: Assist"
                    li_ [class_ "list-group-item"] "c: Corner"
                    li_ [class_ "list-group-item"] "yc: Yellow Card"
                    li_ [class_ "list-group-item"] "rc: Red Card"
                    li_ [class_ "list-group-item"] "f: Foul"
                    li_ [class_ "list-group-item"] "of: Offside"
                    li_ [class_ "list-group-item"] "pn: Penalty"
                    li_ [class_ "list-group-item"] "b: Block"
                    li_ [class_ "list-group-item"] "og: Own Goal"
                
                div_ $ do
                    p_ "The valid syntax for a statistic is a command (from the list above) followed by a space and either a '0' or a '1'. '0' identifies the Home Team and '1' identifies the Away Team."
                    p_ "There should be no spaces before or after the command and team identifier. This is an example of valid input 'so 1'. Syntax not conforming with the previous format will be rejected."
                
                h4_ "The image below is an example of correct syntax and input."
                div_ $ do
                    img_ [src_ "exampleInput.png", class_ "img-thumbnail", alt_ "alt text"]
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
                nav_ [ class_ "navbar navbar-inverse" ] $ do
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