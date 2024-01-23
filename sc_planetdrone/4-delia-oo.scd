Ndef(\doo).fadeTime_(3);

(
~dooPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.25);
)

(
~dooPreset = ( 'planetDrone_1a': 0.79137629508972, 'planetDrone_3a': 0.66750446557999, 'planetDrone_2a': 0.20591886043549, 'hz': 87.448172228336,  'planetDrone_effect_2': 0.76088961362839, 'planetDrone_2b': 0.19206835031509, 'planetDrone_3b': 0.3755943608284, 'planetDrone_effect_1': 0.54155253410339, 'amp': 0.25, 'planetDrone_4b': 0.77396516799927, 'planetDrone_4a': 0.44790935516357, 'planetDrone_1b': 0.50151456594467, 'planetDrone_effect_3': 0.95014333128929 )
)

(
~dooPreset = (planetDrone_1a: rrand(0.01, 0.99), planetDrone_2a: rrand(0.1, 0.95), planetDrone_3a: rrand(0.1, 1), planetDrone_4a: rrand(0.1, 0.9), planetDrone_1b: rrand(0.1, 1), planetDrone_2b: rrand(0.1, 0.95), planetDrone_3b: rrand(0.1, 0.92), planetDrone_4b: rrand(0.1, 0.9),  planetDrone_effect_1: rrand(0.1, 0.93), planetDrone_effect_2: rrand(0.1, 0.925), planetDrone_effect_3: rrand(0.1, 0.9625), hz: rrand(65.41, 300), amp: 0.25);
)

// WARNING: The use of Dstutter is not recommended. Please use Ddup instead.


(
Ndef(\doo, {

	var sig;
	sig = SyncSaw.ar([rrand(2.0, 4) + abs(~dooPreset[\planetDrone_2a] * rrand(90, 195))
		+ SinOsc.ar(freq: 0.03, phase: 0.0, mul: (~dooPreset[\planetDrone_4a] * 25), add: 0.0)
		, rrand(3.0,5) + abs(~dooPreset[\planetDrone_3a] * rrand(50,150))
		+ SinOsc.ar(freq: 0.03, phase: 0.0, mul: (~dooPreset[\planetDrone_4a] * 75), add: 0.0)
	];
	Duty.ar( 1 / Dstutter(60,Dwhite(5,159)) * (0.95 + ~dooPreset[\planetDrone_1a]), 0,
		Dseries(0, Dstutter(60, Dwhite(-330,9) / 300))% 1).linexp(0, 1, 20, 3000)).trunc(0.25);
	sig = FreeVerb.ar(sig,
		0.25 + ~dooPreset[\planetDrone_effect_1],
		1,
		1);
	sig = Pan2.ar(
		sig
		,
		pos:SinOsc.ar(freq: 0.0125 + abs(~dooPreset[\planetDrone_effect_3] * 4), phase: 0.0, mul: (~dooPreset[\planetDrone_effect_2] * 0.75), add: 0.0)
	);
	sig = sig * ~dooPreset[\amp] * 0.15;
	sig = Limiter.ar(sig);
});
)


Ndef(\doo).play(0);

Ndef(\doo).clear(1);