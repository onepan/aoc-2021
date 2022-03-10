module Main where

import Day3.Q1 (solve)

main :: IO ()
main = do
   contents <- readFile "data/d3.txt"
   print $ solve contents
