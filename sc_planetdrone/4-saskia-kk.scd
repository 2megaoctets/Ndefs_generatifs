(
~skkPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.35);
)

(
Ndef(\skk, {
	var sig;
	sig = tanh(Impulse.kr(8 + (~skkPreset[\planetDrone_1a] * 8)).lag * Crackle.ar(LFSaw.kr(3 + (~skkPreset[\planetDrone_2a] * 10)).abs.lag * 1.8)
		+
		GVerb.ar([Impulse.kr(2 + (~skkPreset[\planetDrone_4a] * 75)) + Impulse.kr(4, 0.5)].lag * Blip.ar(5.9 + (~skkPreset[\planetDrone_3a] * 40), 7, 0.4)!2, 1, 1) * 5);

	GVerb.ar(
		Splay.ar(sig, 1),
		roomsize: 2,
		revtime: 0.6 + (~skkPreset[\planetDrone_effect_1] * 0.4),
		damping: 0.165,
		inputbw: 0.46,
		spread: 25,
		drylevel: -6 + (~skkPreset[\planetDrone_effect_2] * 50),
		earlyreflevel: -10.47 + (~skkPreset[\planetDrone_effect_3] * 70),
		taillevel: -10.076,
		maxroomsize: 100,
		mul: 1.0,
		add: 0);
	sig = Mix.ar(sig) * ~skkPreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);

});
)

Ndef(\skk).play(0);

Ndef(\skk).clear(1);