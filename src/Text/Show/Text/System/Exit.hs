{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-|
Module:      Text.Show.Text.System.Exit
Copyright:   (C) 2014 Ryan Scott
License:     BSD-style (see the file LICENSE)
Maintainer:  Ryan Scott
Stability:   Experimental
Portability: GHC

Monomorphic 'Show' function for 'ExitCode'.
-}
module Text.Show.Text.System.Exit (showbExitCodePrec) where

import Data.Text.Lazy.Builder (Builder)

import System.Exit (ExitCode)

import Text.Show.Text.Classes (showbPrec)
import Text.Show.Text.Data.Integral ()
import Text.Show.Text.TH.Internal (deriveShowPragmas, defaultInlineShowbPrec)

-- | Convert an 'ExitCode' to a 'Builder' with the given precedence.
showbExitCodePrec :: Int -> ExitCode -> Builder
showbExitCodePrec = showbPrec
{-# INLINE showbExitCodePrec #-}

$(deriveShowPragmas defaultInlineShowbPrec ''ExitCode)