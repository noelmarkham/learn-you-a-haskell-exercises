import DistanceConversions

-- Fill in the DistanceConversions module first, and import it here
-- create a higher-order function for converting an area between two dimensions
-- this will take the function for converting a distance, and an area to convert
-- using the functions defined in the DistanceConversions module
-- Example areaConv inchesToCentimetres 9 = 58.0644

areaConv :: (Float -> Float) -> Float -> Float
areaConv linearConversion area = conversion * conversion
				where conversion = linearConversion (sqrt area)

-- define a function for converting square inches into square centimetres
sqInToSqCm :: Float -> Float
sqInToSqCm = areaConv inchesToCentimetres

-- define a function for converting square chains (22 yards) to square metres
sqChainsToSqM :: Float -> Float
sqChainsToSqM = areaConv chainToMetres
		where chainToMetres x = inchesToCentimetres $ feetToInches $ yardsToFeet (22 * x) / 100
