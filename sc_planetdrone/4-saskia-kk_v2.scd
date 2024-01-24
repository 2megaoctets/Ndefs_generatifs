Ndef(\skk).fadeTime_(3);

(
~skkPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, earlyref: 0.0625, hz:6, amp: 0.35);
)

(
~skkPreset = ( 'planetDrone_1a': 0.036643483638763, 'planetDrone_3a': 0.91807374954224, 'planetDrone_2a': 0.90726962089539, 'hz': 254.37983075738, 'planetDrone_effect_2': 0.43022047579288, 'planetDrone_2b': 0.48990680575371, 'planetDrone_3b': 0.61930263280869, 'planetDrone_effect_1': 0.48992212295532, 'amp': 0.35, 'planetDrone_4b': 0.1133152961731, 'planetDrone_4a': 0.62125587463379, 'planetDrone_1b': 0.80911566019058, 'hz': 6, 'earlyref:': 0.33623322546482 )
)

(
~skkPreset = (planetDrone_1a: rrand(0.01, 0.99), planetDrone_2a: rrand(0.1, 0.95), planetDrone_3a: rrand(0.1, 1), planetDrone_4a: rrand(0.1, 0.9), planetDrone_1b: rrand(0.1, 1), planetDrone_2b: rrand(0.1, 0.95), planetDrone_3b: rrand(0.1, 0.92), planetDrone_4b: rrand(0.1, 0.9),  planetDrone_effect_1: rrand(0.1, 0.93), planetDrone_effect_2: rrand(0.1, 0.925), earlyref: rrand(0.1, 0.9625), hz: rrand(5.41, 30), amp: 0.35);
)

(
Ndef(\skk, {
	var sig;
	sig = tanh(Impulse.kr(rrand(6.0,12) + (~skkPreset[\planetDrone_1a] * rrand(6.0,12))).lag * Crackle.ar(LFSaw.kr(rrand(3.0, 7) + (~skkPreset[\planetDrone_2a] * rrand(10.0, 20))).abs.lag * 1.8)
		+
		GVerb.ar([Impulse.kr(rrand(0.5,3) + (~skkPreset[\planetDrone_4a] * rrand(60,90))) + Impulse.kr(rrand(1.0,6) + ~skkPreset[\planetDrone_3a] * (~skkPreset[\planetDrone_4a] * rrand(1.0,10)), 0.5)].lag * Blip.ar(5.9 + (~skkPreset[\planetDrone_3a] * rrand(30.0, 50)), 7, 0.4)!2, 1, 1) * 5);

	sig = GVerb.ar(
		Mix.ar(sig), 1,
		roomsize: 26, // 2, foutre un dseq dessus
		revtime: rrand(0.55, 0.8) + (~skkPreset[\planetDrone_effect_1] * rrand(0.15, 0.4)),
		damping: 0.165,
		inputbw: 0.46,
		spread:  17, // 25,
		drylevel: -6 + (~skkPreset[\planetDrone_effect_2] * rrand(30, 70)),
		earlyreflevel: -10.47 + (~skkPreset[\earlyref] * rrand(50,80)),
		taillevel: -10.076,
		maxroomsize: 100,
		mul: 0.25, // .0,
		add: 0);
	sig = HPF.ar(sig, 300);
	sig = Mix.ar(sig) * ~skkPreset[\amp] * 0.1;
	sig = Limiter.ar(Mix.ar(sig), 0.35);

});
)

Ndef(\skk).play(0);

Ndef(\skk).clear(1);