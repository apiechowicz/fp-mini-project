import Test.Hspec
import Test.QuickCheck
import Data.List
import Lib

main :: IO ()
main = print "How to run QuickCheck tests in main?"

prop_sorting_keeps_length :: Ord a => [a] -> Bool
prop_sorting_keeps_length xs = length (mergeSort xs) == length xs

prop_sorting_keeps_elements :: Ord a => [a] -> Bool
prop_sorting_keeps_elements xs = all (\x -> (x `elem` xs)) (mergeSort xs) == True

prop_sorting_works :: Ord a => [a] -> Bool
prop_sorting_works xs = (mergeSort xs) == (sort xs)

prop_already_sorted_stays_sorted :: Ord a => [a] -> Property
prop_already_sorted_stays_sorted xs = (xs == sort xs) ==> (xs == mergeSort xs)

-- prop_already_sorted_stays_sorted2 :: Ord a => [a] -> Property
-- prop_already_sorted_stays_sorted2 xs = forAll orderedList $ \xs -> xs == mergeSort xs
