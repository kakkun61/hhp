module LintSpec where

import Test.Hspec

import Hhp

spec :: Spec
spec = do
    describe "lintSyntax" $ do
        it "check syntax with HLint" $ do
            res <- lintSyntax defaultOptions "test/data/hlint.hs"
            res `shouldBe` "test/data/hlint.hs:4:8-33: Suggestion: Redundant bracket\NULFound:\NUL  (putStrLn \"Hello, world!\")\NULPerhaps:\NUL  putStrLn \"Hello, world!\"\n"

        context "without suggestions" $ do
            it "doesn't output empty line" $ do
                res <- lintSyntax defaultOptions "test/data/hhp-check/Data/Foo.hs"
                res `shouldBe` ""
