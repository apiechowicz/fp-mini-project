module Main where

import Lib

main :: IO ()
main = print $ mergeSort [10, 9 .. 1]
