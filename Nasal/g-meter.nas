gmeter = func {
	var z_accel = getprop("/accelerations/pilot/z-accel-fps_sec");
	var G = z_accel / -32.174;
	setprop("/accelerations/pilot/G[0]", G);
	var G_min = getprop("/accelerations/pilot/G-min[0]");
	var G_max = getprop("/accelerations/pilot/G-max[0]");
	if (G < 1 and G < G_min){
		setprop("/accelerations/pilot/G-min[0]", G);
		} else {
		if (G > G_max){
			setprop("/accelerations/pilot/G-max[0]", G);
			}
		}
	var reset = getprop("/controls/g-meter/reset");
	if (reset == 1) {
		setprop("/accelerations/pilot/G-min", 1.0);
		setprop("/accelerations/pilot/G-max", 1.0);
		setprop("/controls/g-meter/reset", 0);
		}
settimer(gmeter, 0.1);
}

setlistener("sim/signals/fdm-initialized", gmeter);