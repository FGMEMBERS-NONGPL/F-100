# Converts EGT fahrenheit to centigrade
var convert_temp = func{
	var degF = getprop("engines/engine[0]/egt_degf");
	var degC = (degF - 32) * 5/9;
	setprop("engines/engine[0]/egt_degc", degC);
settimer(convert_temp, 0.1);
}
setlistener("sim/signals/fdm-initialized", convert_temp);