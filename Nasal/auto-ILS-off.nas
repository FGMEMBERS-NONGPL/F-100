var auto_ils_off = func {
var agl = getprop("/position/altitude-agl-ft");
if (agl <= 200) {
		setprop("/autopilot/locks/altitude", "");
		setprop("/autopilot/locks/heading", "");
		setprop("/autopilot/locks/speed", "");
		}
settimer(auto_ils_off, 0.5);
}
setlistener("sim/signals/fdm-initialized", auto_ils_off);

