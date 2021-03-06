import XMonad
import qualified Data.Map as M
import XMonad.Core
import XMonad.Config.Gnome
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS 
import XMonad.Config.Azerty
import XMonad.Hooks.ManageDocks

myWorkspaces = ["1:web", "2:code", "3:chrome", "4:im", "5:chat",
                "6:mail", "7", "8", "9", "10:debug"]

myHookManager = composeAll
	[ className =? "Pidgin"      --> doShift "4:im" -- Force to IM workspace.
	, className =? "Skype"       --> doShift "4:im" -- Force to Skype workspace.
	, className =? "Firefox"     --> doShift "1:web" -- Special-case the GIMP.
	, resource 	=? "chrome"      --> doShift "3:chrome" -- Special-case the GIMP.
	, className =? "irsii"       --> doShift "5:chat" -- Special-case the GIMP.
	, className =? "Thunderbird" --> doShift "6:mail" -- Special-case the GIMP.
	, className =? "vim"         --> doShift "2:code" -- Special-case the GIMP.
	, className =? "Kdbg"        --> doShift "10:debug" -- Special-case the GIMP.
	, className =? "XTerm"        --> doShift "10:debug" -- Special-case the GIMP.
	, className =? "gvim"        --> doShift "2:code" -- Special-case the GIMP.
	, manageDocks -- For xmobar and gnome-panel.
	, manageHook gnomeConfig ] -- Gnome defaults.

main = xmonad $ gnomeConfig 
		{ borderWidth = 1
		, workspaces  = myWorkspaces
		, manageHook  = myHookManager
		, keys        = \c -> azertyKeys c `M.union` keys gnomeConfig c
		--, logHook     = myLogHook
		-- , startupHook = myStartupHook
		-- , layoutHook 				= spacing 0 $ avoidStruts $ Tall 1 (3/100) (1/2) 
		} 
		`additionalKeysP` 
			[ ("M-S-q", spawn "gnome-session-save --gui --logout-dialog")
			, ("M-<Left>",    prevWS )
			, ("M-<Right>",   nextWS )
			, ("M-S-<Left>",  shiftToPrev )
			, ("M-S-<Right>", shiftToNext )
			, ("M-S-l", spawn "gnome-screensaver-command -l" )
			]
