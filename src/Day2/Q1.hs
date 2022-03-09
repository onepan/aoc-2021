module Day2.Q1 where

import Data.Complex

parseInstructions :: [String] -> [Complex Int]
parseInstructions [] = [0 :+ 0]
parseInstructions (dir : dist : xs) = movement2d dir (read dist) : parseInstructions xs
parseInstructions _ = error "bad instruction"

movement2d :: String -> Int -> Complex Int
movement2d direction distance
  | direction == "forward" = distance :+ 0
  | direction == "up" = 0 :+ (- distance)
  | otherwise = 0 :+ distance

solve :: String -> Int
solve contents =
  let displacement = foldr ((+) . fmap fromIntegral) (0 :+ 0) $ parseInstructions $ reverse $ words contents :: Complex Float
   in truncate $ realPart displacement * imagPart displacement
