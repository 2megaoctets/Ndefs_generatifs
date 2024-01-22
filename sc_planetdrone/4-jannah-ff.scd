(
~jffPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.35);
)

// continue à tourner sur 4 canaux

(
s.options.numWireBufs = (8192*12000);

Ndef(\jff,{

	var pd_1a = ~jffPreset[\planetDrone_1a] * 750, pd_2a = ~jffPreset[\planetDrone_2a] * 750, pd_3a = ~jffPreset[\planetDrone_3a] * 170, pd_4a = ~jffPreset[\planetDrone_4a] * 750, sig;
	sig = Gendy1.ar(
		ampdist: 6,
		durdist: 6,
		adparam: 3,
		ddparam: Dust.ar(
			density: [99 + pd_1a, 98 + pd_2a + SinOsc.ar(
				freq: 0.000125,
				phase: 0.0,
				mul: 4,
				add: 0.0)],
			mul: 1),
		minfreq: 18 + abs(pd_3a),
		maxfreq: 375+abs(pd_4a + SinOsc.ar(
			freq: 0.000525,
			phase: 0.0,
			mul: 3,
			add: 0.0)
	));
	sig = Klank.ar(`[[40,99,98,953,923],
		nil,[1,1,1,1]],
	GVerb.ar(CombC.ar(sig),
		9,
		9,
		mul:0.005)
	);
	sig = GVerb.ar(
		Mix.ar(sig),
		// sig,
		roomsize: 80,
		revtime: 4.85,
		damping: 0.41,
		inputbw: 0.7,
		spread: 40,
		drylevel: -0,
		earlyreflevel: 0,
		taillevel: -11,
		mul: 0.008);
	sig = FreqShift.ar(
		Mix.ar(sig),
		// sig,
		0 + ~jffPreset[\planetDrone_effect_1] * 470) / ((2..9) +   SinOsc.ar(
		freq: 0.00039 + (~jffPreset[\planetDrone_effect_3]),
		phase: 0.0,
		mul: ~jffPreset[\planetDrone_effect_2] * 0.38,
		add: 0.0) );
	sig = Splay.ar(sig, 1) * ~jffPreset[\amp] * 0.5;

});
)

Ndef(\jff).play(0);

Ndef(\jff).clear(1);