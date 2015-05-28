g_calc = func {
	var z_accel = getprop("/accelerations/pilot/z-accel-fps_sec");
	var g = z_accel / -32.174;
	setprop("/accelerations/current-g", g);
settimer(g_calc, 0.1);
}
setlistener("sim/signals/fdm-initialized", g_calc);