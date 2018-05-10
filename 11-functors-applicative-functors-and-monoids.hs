import Control.Applicative
import Data.Monoid

-- We can use the following type to simulate our own list
data List a = Empty | Value a (List a) deriving (Show, Eq)

-- Make the list a Functor
instance Functor List where
        fmap _ Empty = Empty
        fmap f (Value v rest) = Value (f v) (fmap f rest)

-- Write a function which appends one list on to another
combineLists:: List a -> List a -> List a
combineLists Empty other = other
combineLists (Value v rest) other = Value v (combineLists rest other)

-- Make our list a Monoid
instance Monoid (List a) where
        mempty = Empty
        mappend = combineLists

-- Make our list an Applicative
instance Applicative List where
        pure x = Value x Empty
        Empty <*> _ = Empty
        (Value f rest) <*> list = combineLists (fmap f list) (rest <*> list)

-- Make sure that the List obeys the laws for Applicative and Monoid
applicativeLaw1 = (pure (+2) <*> testList) == (fmap (+2) testList)
		where testList = Value 10 $ Value 20 Empty

applicativeLaw2 = (pure id <*> testList) == testList
		where testList = Value 10 $ Value 20 Empty

--applicativeLaw3 = (pure (.) <*> testList1 <*> testList2 <*> testList3) == (testList1 <*> (testList2 <*> testList3))
--		where testList1 = Value 10 $ Value 20 Empty
--		      testList2 = Value 1 $ Value 2 $ Value 3 Empty
--		      testList3 = Value 2 $ Value 4 $ Value 6 $ Value 8 Empty

applicativeLaw4 = (fromPure (*10) <*> fromPure 10) == (fromPure ( (*10) 10)) 

fromPure :: a -> List a
fromPure = pure

--applicativeLaw5 = ((+5) <*> (fromPure 123)) == (fromPure ($ 123) <*> (+5))

monoidLaw1 = mempty `mappend` testList == testList
		where testList = Value 10 $ Value 20 Empty

monoidLaw2 = testList `mappend` mempty == testList
		where testList = Value 10 $ Value 20 Empty

--monoidLaw3 = (testList1 `mappend` testList2) `mappend` testList3 == testList1 `mappend` (testList2 `mappend` testList3)
--		where testList1 = Value 1 $ Value 2 $ Value 3 $ Value 4 Empty
--		      testList2 = Value 10
--		      testList3 = Value 100 $ Value 200 Empty

-- Create some lists of numbers of different lengths such as:
twoValueList = Value 10 $ Value 20 Empty

-- Use <$> on the lists with a single-parameter function, such as:
plusTwo = (+2)

addedTwoList = plusTwo <$> twoValueList

-- Use <$> and <*> on the lists with a binary function
anotherList = Value 100 $ Value 200 $ Value 300 Empty

addAll = (+) <$> twoValueList <*> anotherList

-- Create some lists of binary functions
binaryFunctionList = Value (+) $ Value (*) $ Value (^) $ Value max Empty

-- Use <*> on the binary functions list and the number lists
operationOverLists = binaryFunctionList <*> twoValueList <*> anotherList
