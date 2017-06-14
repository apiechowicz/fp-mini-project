# fp-mini-project

setting up ghci
---
$ cd < project dir >

$ ghci

$ import Data.List

$ import Test.QuickCheck

$ :l src/Lib.hs

after all those commands just paste any test into ghci (i.e. prop_sorting_keeps_length xs = length (mergeSort xs) == length xs)

to run test
---
$ quikCheck testname
