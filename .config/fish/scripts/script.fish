#!/bin/fish

if test "$POMO_STATE" = "COMPLETE"
  echo -e '\a'
  paplay $HOME/Music/windowsphone-ringtone.mp3
end
