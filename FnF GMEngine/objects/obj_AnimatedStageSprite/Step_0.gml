bpmspeed = ((global.bpm / 60) / 2)
if gfbounce == true {curspeed = bpmspeed}
if global.paused == true {image_speed = 0}
else {image_speed = curspeed}