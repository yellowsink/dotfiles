# Set tablet area
# this is calculated for a CTL460 to
# have a 36mm wide area at 16:9, perfectly centered
# and the tablet will be rotated clockwise 90 degrees
# and mapped to the HDMI-A-0 display
xsetwacom set "Wacom Bamboo Pen Pen stylus" MapTooutput HDMI-A-0 2> /dev/null
xsetwacom set "Wacom Bamboo Pen Pen stylus" Area 5560 2012 7585 5612
xsetwacom set "Wacom Bamboo Pen Pen stylus" Rotate ccw

# calculations done automatically by https://github.com/yellowsink/WacomAreaX11
