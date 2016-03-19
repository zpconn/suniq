module Lib
    ( uniqueFilter
    ) where

import Control.Monad (forever)
import Control.Monad (when)
import Control.Monad.Trans.State.Strict

import qualified Data.HashSet as HS

import Data.List (intercalate)

import Pipes
import qualified Pipes.Prelude as P

updateMemory :: Pipe String String IO ()
updateMemory = flip evalStateT (HS.empty :: HS.HashSet String) $ forever $ do
	value <- lift await
	memory <- get
	when (not $ HS.member value memory) $ do
		put $ HS.insert value memory
		lift $ yield value

uniqueFilter :: IO ()
uniqueFilter = runEffect $ P.stdinLn >-> updateMemory >-> P.stdoutLn

