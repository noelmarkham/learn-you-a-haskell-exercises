{-
 - Create a type called Validation
 - The type constructor takes one parameter
 - There are two Values: 
 -   Success, which takes that parameter and
 -   Fail String, which represents a failure, and a reason for that failure
 -}
--data Validation a 

-- Make the Validation a Monad


{-
 - Create a function, positiveCheck, which takes a number and returns a successful Validation if it's positive, 
 - and a failed Validation with a String message if not.
 -}
--positiveCheck :: (Num a, Ord a) => a -> Validation a
--positiveCheck x = undefined

{-
 - Create a function, evenCheck, which returns a successful Validation if it's even,
 - and a failed Validation with a string message if it's odd
 -}
--evenCheck :: (Integral a)  =>  a -> Validation a
--evenCheck x = undefined

{-
 - Write a function which uses positiveCheck and evenCheck to make sure a number is both positive and even
 -}
--positiveAndEvenCheck :: (Num a, Ord a, Integral a) => a -> Validation a
--positiveAndEvenCheck x = undefined
