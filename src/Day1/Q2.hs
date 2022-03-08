module Day1.Q2 where

countIncreases :: (Ord a, Num a) => [a] -> Int
countIncreases xs = length $ filter (> 0) (diff xs)

diff :: Num a => [a] -> [a]
diff xs = zipWith (flip (-)) xs (tail xs)

rollingSum :: Num a => [a] -> [a]
rollingSum xs = zipWith3 (\x y z -> x + y + z) xs (tail xs) (tail . tail $ xs)

solve :: String -> Int
solve contents =
  let values = read <$> words contents :: [Int]
   in (countIncreases . rollingSum) values
