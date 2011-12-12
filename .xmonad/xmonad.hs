import XMonad
import XMonad.Core
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS 
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks


main = xmonad $ gnomeConfig
	{
		borderWidth					= 1,
		manageHook  				= manageDocks
--		, layoutHook 				= spacing 0 $ avoidStruts $ Tall 1 (3/100) (1/2) 
	} 
	`additionalKeysP` 
		[
			("M-S-q", spawn "gnome-session-save --gui --logout-dialog")
			, ("M-<Left>",    prevWS )
			, ("M-<Right>",   nextWS )
			, ("M-S-<Left>",  shiftToPrev )
			, ("M-S-<Right>", shiftToNext )
		]
