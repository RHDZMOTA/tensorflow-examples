module Main where

import           Control.Monad (replicateM, replicateM_)
import           System.Random (randomIO)
import           Test.HUnit (assertBool)

import qualified TensorFlow.Core as TFC
import qualified TensorFlow.GenOps.Core as GOC
import qualified TensorFlow.Minimize as Min
import qualified TensorFlow.Ops as Ops hiding (initializedVariable)
import qualified TensorFlow.Variable as Var

main :: IO ()
main = do
    -- Generate data where `y = x*3 + 8`.
    xData <- replicateM 100 randomIO
    let yData = [x*3 + 8 | x <- xData]
    -- Fit linear regression model.
    (w, b) <- fit xData yData
    assertBool "w == 3" (abs (3 - w) < 0.001)
    assertBool "b == 8" (abs (8 - b) < 0.001)

fit :: [Float] -> [Float] -> IO (Float, Float)
fit xData yData = TFC.runSession $ do
    -- Create TensorFlow constants for x and y.
    let x = Ops.vector xData
        y = Ops.vector yData
    -- Create scalar variables for slope and intercept.
    w <- Var.initializedVariable 0
    b <- Var.initializedVariable 0
    -- Define the loss function.
    let yHat = (x `Ops.mul` Var.readValue w) `Ops.add` Var.readValue b
        loss = GOC.square (yHat `Ops.sub` y)
    -- Optimize with gradient descent.
    trainStep <- Min.minimizeWith (Min.gradientDescent 0.001) loss [w, b]
    replicateM_ 1000 (TFC.run trainStep)
    -- Return the learned parameters.
    (TFC.Scalar w', TFC.Scalar b') <- TFC.run (Var.readValue w, Var.readValue b)
    return (w', b')
