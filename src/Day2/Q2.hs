module Day2.Q2 where

data Status = Status
  { x :: Int,
    y :: Int,
    aim :: Int
  }

step :: [String] -> Status -> Status
step ln s = case ln of
  ["forward", value] -> s {x = x s + read value, y = y s + aim s * read value}
  ["down", value] -> s {aim = aim s + read value}
  ["up", value] -> s {aim = aim s - read value}
  _ -> s

solve :: String -> Int
solve contents =
  let status = foldr (step . words) (Status 0 0 0) $ reverse $ lines contents
   in x status * y status
