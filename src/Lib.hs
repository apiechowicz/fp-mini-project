module Lib
    ( BinTree,
    createNode,
    insertNode,
    merge,
    mergeSort,
    treeFromList,
    searchNode,
    treeDepth,
    countNodes,
    mapTree
    ) where


data BinTree a = EmptyTree |
                 Node a (BinTree a) (BinTree a)
                 deriving (Show)

createNode :: a -> BinTree a
createNode a = (Node a) EmptyTree EmptyTree

insertNode :: (Ord a) => a -> BinTree a -> BinTree a
insertNode x EmptyTree = (Node x) EmptyTree EmptyTree
insertNode x (Node a left right) | x == a = Node x left right
                                 | x < a  = Node a (insertNode x left) right
                                 | x > a  = Node a left (insertNode x right)

merge :: (Ord a) => [a] -> [a] -> [a]
merge a [] = a
merge [] b = b
merge (a:as) (b:bs) | a <= b = a : (merge as (b:bs))
                    | a > b  = b : (merge (a:as) bs)

mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = let
               left  = take (flip div 2 $ length xs) xs
               right = drop (length xs `div` 2) xs
               in merge (mergeSort left) (mergeSort right)

treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = EmptyTree
treeFromList x  = foldr insertNode EmptyTree x
-- todo rewrite to create a balanced tree (pick middle element as long as its possible)

searchNode :: (Ord a) => a -> BinTree a -> Bool
searchNode x EmptyTree = False
searchNode x (Node a left right) | x == a = True
                                 | x < a  = searchNode x left
                                 | x > a  = searchNode x right

treeDepth :: BinTree a -> Int
treeDepth EmptyTree = 0
treeDepth (Node a left right) = 1 + max (treeDepth left) (treeDepth right)

countNodes :: BinTree a -> Int
countNodes EmptyTree = 0
countNodes (Node a left right) = 1 + countNodes left + countNodes right

mapTree :: (a -> a) -> BinTree a -> BinTree a
mapTree _ EmptyTree = EmptyTree
mapTree f (Node a left right) = (Node $ f a) (mapTree f left) (mapTree f right)
