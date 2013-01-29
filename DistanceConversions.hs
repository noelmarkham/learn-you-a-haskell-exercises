module DistanceConversions
( yardsToFeet
, feetToInches
, inchesToCentimetres
) where

-- Define yards to feet
yardsToFeet ::  Float -> Float
yardsToFeet y = 3 * y

-- Define feet to inches
feetToInches :: Float -> Float
feetToInches f = 12 * f

-- Define inches to centimetres
inchesToCentimetres :: Float -> Float
inchesToCentimetres i = i * 2.54
