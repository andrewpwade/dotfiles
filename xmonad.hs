import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageDocks

myTerminal      = "xfce4-terminal"

-- Width of the window border in pixels.
--
myBorderWidth   = 1

-- Border colors for unfocused and focused windows, respectively.
--
--myNormalBorderColor  = "#dddddd"
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#cc0000"

------------------------------------------------------------------------
-- Window rules:
 
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "Xfce4-appfinder"  --> doFloat
    , className =? "Xfce4-notifyd" --> doIgnore
    , className =? "Xfrun4"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore ]
 
-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

main = xmonad defaults

defaults = xfceConfig {	 
  borderWidth        = myBorderWidth,
  normalBorderColor  = myNormalBorderColor,
  focusedBorderColor = myFocusedBorderColor,
  terminal           = myTerminal,
  focusFollowsMouse  = myFocusFollowsMouse,
  modMask            = mod4Mask,
  -- hooks, layouts
  manageHook         = manageDocks <+> myManageHook
}	

