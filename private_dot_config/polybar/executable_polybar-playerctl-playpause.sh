#!/bin/sh

PLAYER="cider"



if [ "$(pidof "$PLAYER")" != "" ];
then
	if [ "$(playerctl --player="$PLAYER" status)" == "Playing" ];
	then
		playerctl --player="$PLAYER" pause
	else
		playerctl --player="$PLAYER" play
	fi
else
	echo ""
fi
