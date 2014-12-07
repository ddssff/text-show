{-# LANGUAGE NoImplicitPrelude #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Properties.Utils
-- Copyright   :  (C) 2014 Ryan Scott
-- License     :  BSD-style (see the file LICENSE)
-- Maintainer  :  Ryan Scott
-- Stability   :  Experimental
-- Portability :  GHC
-- 
-- @QuickCheck@ property-related utility functions.
----------------------------------------------------------------------------
module Properties.Utils (prop_matchesShow) where

import           Data.Text.Lazy.Builder (fromString)

import qualified Prelude as P (Show)
import           Prelude hiding (Show)

import           Test.QuickCheck (Arbitrary)

import qualified Text.Show.Text as T (Show)
import           Text.Show.Text (showbPrec)

-- | Verifies that a type's @Show@ instances coincide for both 'String's and 'Text',
--   irrespective of precedence.
prop_matchesShow :: (P.Show a, T.Show a, Arbitrary a) => Int -> a -> Bool
prop_matchesShow k x = fromString (showsPrec k x "") == showbPrec k x