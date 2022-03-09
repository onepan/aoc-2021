module Main where

import Day2.Q2 (solve)

main :: IO ()
main = do
   contents <- readFile "data/d2.txt"
   print $ solve contents
