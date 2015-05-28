approach = func {
var total = getprop("/fdm/jsbsim/propulsion/total-fuel-lbs");
var speed = (155+(3*(total/1000)));
setprop("/velocities/approach-speed", speed);
settimer(approach, 1.0);
}
setlistener("sim/signals/fdm-initialized", approach);
