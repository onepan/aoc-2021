module Day1.Q1
where

readInt :: String -> Int
readInt = read

countIncreases :: (Ord a, Num a) => [a] -> Int
countIncreases xs = length $ filter (> 0) (diff xs)

diff :: Num a => [a] -> [a]
diff xs = zipWith (flip (-)) xs (tail xs)

solve :: String -> Int
solve contents =
  let values = readInt <$> words contents
   in countIncreases values
