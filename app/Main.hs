module Main where

import Day2.Q1 (solve)

main :: IO ()
main = do
   contents <- readFile "data/d2.txt"
   print $ solve contents
