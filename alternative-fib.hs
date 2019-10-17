fib :: Int -> Int
fib x
 | x == 1  = 1 
 | x == 0  = 0 
 | otherwise =  fib (x-1) + fib (x-2)
