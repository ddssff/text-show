{-# LANGUAGE NoImplicitPrelude #-}
{-|
Module:      Text.Show.Text.Data.Typeable.Utils
Copyright:   (C) 2014 Ryan Scott
License:     BSD-style (see the file LICENSE)
Maintainer:  Ryan Scott
Stability:   Experimental
Portability: GHC

Utility functions for showing data types in the @Typeable@ (or @OldTypeable@) module.
-}
module Text.Show.Text.Data.Typeable.Utils (showbArgs, showbTuple) where

import Data.Monoid (mempty)
import Data.Text.Lazy.Builder (Builder)

import Prelude hiding (Show)

import Text.Show.Text.Classes (Show(showbPrec))
import Text.Show.Text.Utils ((<>), s)

-- | Helper function for showing a list of arguments, each separated by the given
-- 'Builder'.
showbArgs :: Show a => Builder -> [a] -> Builder
showbArgs _   []     = mempty
showbArgs _   [a]    = showbPrec 10 a
showbArgs sep (a:as) = showbPrec 10 a <> sep <> showbArgs sep as
{-# INLINE showbArgs #-}

-- | Helper function for showing a list of 'Show' instances in a tuple.
showbTuple :: Show a => [a] -> Builder
showbTuple args = s '(' <> showbArgs (s ',') args <> s ')'
{-# INLINE showbTuple #-}