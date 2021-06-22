# Set tablet area
# this is calculated for a CTL460 to
# have a 32.5x18.2mm area (almost) perfectly centered
# (i needed to fix my ratio and couldnt be bothered to re-center it),
# and the tablet will be rotated clockwise 90 degrees
# and mapped to the HDMI-A-0 display
xsetwacom set "Wacom Bamboo Pen Pen stylus" MapTooutput HDMI-A-0 2> /dev/null
xsetwacom set "Wacom Bamboo Pen Pen stylus" Area 6390 2975 8210 6225
xsetwacom set "Wacom Bamboo Pen Pen stylus" Rotate ccw
