{-# LANGUAGE CPP #-}

module Hhp.Lang where

import DynFlags (supportedLanguagesAndExtensions)

#if __GLASGOW_HASKELL__ >= 810
import GHC.Platform.Host (cHostPlatformMini )
#endif

import Hhp.Types

-- | Listing language extensions.

listLanguages :: Options -> IO String
#if __GLASGOW_HASKELL__ >= 810
listLanguages opt = return $ convert opt $ supportedLanguagesAndExtensions cHostPlatformMini
#else
listLanguages opt = return $ convert opt supportedLanguagesAndExtensions
#endif
