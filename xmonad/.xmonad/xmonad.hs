import XMonad


myTerminal = "alacritty"

-- Use Super as the mod key
myModMask  = mod4Mask

-- Actions to perform whenever xmonad starts or is restarted
myStartupHook = do
  -- TODO: add a shortcut for switching layouts
  spawn "setxkbmap -layout us,se,it"


-- Run xmonad with the settings specified above
main :: IO ()
main = xmonad $ def
  {
    terminal    = myTerminal,
    modMask     = myModMask,
    startupHook = myStartupHook
  }

