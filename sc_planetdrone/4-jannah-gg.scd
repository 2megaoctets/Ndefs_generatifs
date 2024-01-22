
(
~sggPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
s.options.numWireBufs = (8192*12000);
Ndef(\jgg, {

	var pd_1a = ~sggPreset[\planetDrone_1a] * 750, pd_2a = ~sggPreset[\planetDrone_2a] * 825, pd_3a = ~sggPreset[\planetDrone_3a] * 17, pd_4a = ~sggPreset[\planetDrone_4a] * 0.25, sig, srcA, srcB;
	srcA = SinOscFB;
	srcB = 1;
	srcA = Splay.ar(srcA.ar(srcA.ar(srcB / (10..15), 2) < srcB * 450 + 90
		+ SinOsc.ar (freq: 0.0173 + pd_4a, phase: 0.0, mul: pd_3a, add: 0.0)) / 7 + srcA.ar(SinOsc.ar(freq: 0.0073, phase: 0.0, mul: pd_2a, add: 0.0)
		+ pd_1a + 600 * srcB , srcA.ar(srcA.ar(srcB, 1) > 0.1 + 1, 1.05) % srcB, srcA.ar( 0.1 - srcB, 1.744).min(0)))/2;
	sig = GVerb.ar(
		srcA,
		roomsize: 180,
		revtime: 30,
		damping: 0.47,
		inputbw: 0.7,
		spread: 40,
		drylevel: 40,
		earlyreflevel: 0,
		taillevel: -11,
		mul: 0.3);
	sig = FreqShift.ar(
		Mix.ar(sig * 0.5),
		0 + ~sggPreset[\planetDrone_effect_1] * 500) / ((2..8)+   SinOsc.ar(freq: 0.00025 + (~sggPreset[\planetDrone_effect_3]), phase: 0.0, mul: ~sggPreset[\planetDrone_effect_2] * 0.25, add: 0.0) );
	sig = Splay.ar(sig, 1) * ~sggPreset[\amp] * 0.5;
});

)

Ndef(\jgg).play(0);

Ndef(\jgg).clear(1);