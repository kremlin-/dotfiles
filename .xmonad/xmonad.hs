import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.WorkspaceCompare
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spiral
import Data.Ratio
import System.IO

threeColLayout = ThreeCol 2 (3/100) (1/2)
tallLayout     = Tall 1 (5/100) (2/3)
spiralLayout   = spiral (1 % 1)

mLayout = spacing 7 
	$ tallLayout 
	||| threeColLayout 
	||| spiralLayout

mStartupHook :: X ()
mStartupHook = do
	spawnOn "term" "kremterm"
	spawnOn "term" "kremterm"
	spawnOn "term" "kremterm"
	spawnOn "term" "kremterm"
	spawnOn "term" "kremterm"
	spawnOn "term" "kremterm"
	spawnOn "term" "kremterm"

	spawnOn "www" "google-chrome-stable"

	spawnOn "chat" "skype"
	spawnOn "chat" "kremirc"

	spawnOn "music" "spotify"
	spawnOn "music" "kremcmus"

	spawnOn "game" "steam"

mManageHook = composeAll
	[ appName   =? "kremterm"             --> doShift "term"
	, appName   =? "google-chrome-stable" --> doShift "www"
	, appName   =? "firefox"              --> doShift "www"
	, appName   =? "kremirc"              --> doShift "chat"
	, appName   =? "skype"                --> doShift "chat"
	, appName   =? "spotify"              --> doShift "music"
	, appName   =? "kremcmus"             --> doShift "music"
	, appName   =? "thunderbird"          --> doShift "mail"
	, appName   =? "Steam"                --> doShift "game"
	, className =? "Steam"                --> doShift "game"
	, appName   =? "steam"                --> doShift "game"
	, className =? "steam"                --> doShift "game"
	, appName   =? "steam.sh"             --> doShift "game"
	, className =? "steam.sh"             --> doShift "game"
	, appName   =? "gimp"                 --> doShift "extra"
	]

mWorkspaces = ["mon", "term", "www", "chat", "music", "mail", "game", "code", "extra"]
--               1      2       3      4        5       6       7       8        9

main = do
        xmproc <- spawnPipe "xmobar"
	xmonad $ defaultConfig
		{ manageHook  = mManageHook <+> manageDocks
		, layoutHook  = avoidStruts $ mLayout
		, startupHook = mStartupHook
		, logHook = dynamicLogWithPP xmobarPP
			{ ppOutput = hPutStrLn xmproc
			, ppCurrent = xmobarColor "#70a16c" "" . wrap "[" "]"
			, ppTitle   = xmobarColor "#70a16c"  "" . shorten 40
			, ppVisible = wrap "(" ")"
			, ppWsSep = " <fc=#af652f>|</fc> "
			, ppUrgent  = xmobarColor "#af652f" ""
			, ppHidden = xmobarColor "#746c48" ""
			, ppHiddenNoWindows = xmobarColor "#746c48" ""
			, ppOrder = \(ws:_:t:_) -> [ws,t]
			}
		, workspaces = mWorkspaces
		, modMask = mod4Mask
		, normalBorderColor = "#170f0d"
		, focusedBorderColor = "#746c48"
		, borderWidth = 2
		, terminal = "urxvtc"
		}
