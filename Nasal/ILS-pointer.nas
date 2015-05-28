ils_pointer = func {
heading = getprop("/orientation/heading-magnetic-deg");
course = getprop("/instrumentation/ils/course-set");
	if (heading > 360){
		heading = heading - 360;
	}
pointer = (heading - course);
	if (pointer > 360){
		pointer = pointer - 360;
	}
	if (pointer < 0){
		pointer = 360 + pointer;
	}		
	if (pointer > 45 and pointer < 90){
		pointer = 45;
	}
	elsif (pointer < 135 and pointer >= 90){
		pointer = 135;
	}
	elsif (pointer > 225 and pointer <= 270){
		pointer = 225;
	}
	elsif (pointer < 315 and pointer > 270){
		pointer = 315;
	}
setprop("/instrumentation/ils/pointer", pointer);
settimer(ils_pointer, 0.1);
}
setlistener("/sim/signals/fdm-initialized", ils_pointer);
