var alt_update = func {
var fetch = getprop("/environment/params/real-world-weather-fetch");
var alt = getprop("/position/altitude-ft");
var ind_alt = getprop("/instrumentation/altimeter/indicated-altitude-ft");
var press_alt = getprop("/instrumentation/altimeter/pressure-alt-ft");
var local = getprop("/environment/pressure-sea-level-inhg");
var set = getprop("/instrumentation/altimeter/setting-inhg");
if ((fetch > 0) and (alt <= 18000)) {
		setprop("/instrumentation/altimeter/setting-inhg", local);
		}
if ((fetch > 0) and (alt > 18000)) {
		setprop("/instrumentation/altimeter/setting-inhg", 29.92);
		setprop("/instrumentation/altimeter/indicated-altitude-ft", press_alt);
		}
settimer(alt_update, 1.0);
}
setlistener("sim/signals/fdm-initialized", alt_update);

