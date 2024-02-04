import XMonad

-- Fullscreen and EWMH compatibility
import XMonad.Hooks.EwmhDesktops

-- Keybindings
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86

-- Status bar
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP


myModMask  = mod4Mask  -- Use Super as mod key
myTerminal = "alacritty"

-- Actions to perform whenever xmonad starts or is restarted
myStartupHook = do
  -- TODO: add a shortcut for switching layouts
  spawn "setxkbmap -layout us,se,it"

myKeyBindings =
  [ ("M-f", spawn "firefox")
  -- Media keys
  , ("<XF86AudioPlay>", spawn "playerctl play-pause")
  , ("<XF86AudioNext>", spawn "playerctl next")
  , ("<XF86AudioPrev>", spawn "playerctl previous")
  ]
  -- 121 XF86AudioMute
  -- 122 XF86AudioLowerVolume
  -- 123 XF86AudioRaiseVolume
  -- 107 Print
  -- 119 Delete
  -- 237 XF86KbdBrightnessDown
  -- 238 XF86KbdBrightnessUp
  -- 232 XF86MonBrightnessDown
  -- 233 XF86MonBrightnessUp

myConfig = def
  {
    terminal    = myTerminal,
    modMask     = myModMask,
    startupHook = myStartupHook
  } `additionalKeysP` myKeyBindings

-- Run xmonad with the settings specified above
main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ myConfig
