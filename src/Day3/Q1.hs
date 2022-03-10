module Day3.Q1 where

import Data.Char (digitToInt)
import Data.List (foldl', genericLength, transpose)

fromBase2 :: [Int] -> Int
fromBase2 b2 = foldl' (\acc x -> acc * 2 + x) 0 $ dropWhile (== 0) b2

solve :: String -> Int
solve content =
  let numbers = lines content
      counts = map (realToFrac . sum) $ transpose $ map (map digitToInt) numbers :: [Double]
      averages = map (flip (/) $ genericLength numbers) counts
      gamma = fromBase2 $ map (fromEnum . (<= 0.5)) averages
   in ((2 ^ length (head numbers) - 1) - gamma) * gamma
