{-
 - Create a type called Validation
 - The type constructor takes one parameter
 - There are two Values: 
 -   Success, which takes that parameter and
 -   Fail String, which represents a failure, and a reason for that failure
 -}
data Validation a = Success a | Fail String deriving (Show)

-- Make the Validation a Monad
instance Monad Validation where 
  (Success a) >>= f = f a
  (Fail s) >>= _ = Fail s

instance Applicative Validation where
  pure a = Success a
  Success f <*> Success a = Success (f a)
  (Fail s) <*> _ = Fail s
  _ <*> (Fail s) = Fail s

instance Functor Validation where
  fmap f (Success a) = Success (f a)
  fmap _ (Fail s) = Fail s

{-
 - Create a function, positiveCheck, which takes a number and returns a successful Validation if it's positive, 
 - and a failed Validation with a String message if not.
 -}
positiveCheck :: (Num a, Ord a) => a -> Validation a
positiveCheck a = if (a > 0)
                  then Success a
                  else Fail "negative number"

{-
 - Create a function, evenCheck, which returns a successful Validation if it's even,
 - and a failed Validation with a string message if it's odd
 -}
evenCheck :: (Integral a)  =>  a -> Validation a
evenCheck x = if (x `mod` 2 == 0)
              then Success x
              else Fail "odd number"

{-
 - Write a function which uses positiveCheck and evenCheck to make sure a number is both positive and even
 -}
positiveAndEvenCheck :: (Num a, Ord a, Integral a) => a -> Validation a
positiveAndEvenCheck x = return x >>= positiveCheck >>= evenCheck
