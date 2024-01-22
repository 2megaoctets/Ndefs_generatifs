(
~dooPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.35);
)


// WARNING: The use of Dstutter is not recommended. Please use Ddup instead.


(
Ndef(\doo, {

	var sig;
	sig = SyncSaw.ar([3 + abs(~dooPreset[\planetDrone_2a] * 195)
		+ SinOsc.ar(freq: 0.03, phase: 0.0, mul: (~dooPreset[\planetDrone_4a] * 25), add: 0.0)
		,4 + abs(~dooPreset[\planetDrone_3a] * 150)
		+ SinOsc.ar(freq: 0.03, phase: 0.0, mul: (~dooPreset[\planetDrone_4a] * 75), add: 0.0)
	];
	Duty.ar( 1 / Dstutter(60,Dwhite(5,159)) * (0.95 + ~dooPreset[\planetDrone_1a]), 0,
		Dseries(0,Dstutter(60,Dwhite(-330,9)/300))%1).linexp(0,1,20,3000)).trunc(0.25);
	sig = FreeVerb.ar(sig,
		0.25 + ~dooPreset[\planetDrone_effect_1],
		1,
		1);
	sig = Pan2.ar(
		sig
		,
		pos:SinOsc.ar(freq: 0.0125 + abs(~dooPreset[\planetDrone_effect_3] * 4), phase: 0.0, mul: (~dooPreset[\planetDrone_effect_2] * 0.75), add: 0.0)
	);
	sig = sig * ~dooPreset[\amp] * 0.25;
	sig = Limiter.ar(sig);
});
)


Ndef(\doo).play(0);

Ndef(\doo).clear(1);