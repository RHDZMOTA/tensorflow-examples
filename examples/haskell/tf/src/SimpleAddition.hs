{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleContexts #-}

module SimpleAddition where

import qualified TensorFlow.Core as TFC
import qualified TensorFlow.Ops as Ops
import qualified TensorFlow.Variable as Var

import           Data.Vector
import           Test.HUnit (assertBool)

example1 :: IO()
example1 = do
    sum <- add (3 :: Float) 2
    assertBool "sum == 5" (sum == 5)

--add :: Float -> Float -> IO Float
add :: forall a. (a TFC./= Bool, TFC.TensorDataType Vector a) => a -> a -> IO a
add x y = TFC.runSession $ do
    let sum = Ops.scalar x `Ops.add` Ops.scalar y
    r <- TFC.render sum
    TFC.Scalar s <- TFC.run r
    return s