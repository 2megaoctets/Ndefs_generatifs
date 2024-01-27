// réécrit. à voir ce qu'on peut en faire

(
~jffModPreset = (freqSlope: 0.5, freqStart: 0.5, freqEnd: 13, iphaseSlope: 0, iphaseStart: 0, iphaseEnd: 0, widthSlope: 0.1, widthStart: 0.5, widthEnd: 0.95);
)

(
Ndef(\jffModTest1, {
	LFPulse.kr(
		Phasor.kr(0.0, ~jffModPreset[\freqSlope], ~jffModPreset[\freqStart], ~jffModPreset[\freqEnd] ),
		Phasor.kr(0.0, ~jffModPreset[\iphaseSlope], ~jffModPreset[\iphaseStart], ~jffModPreset[\iphaseEnd]),
		Phasor.kr(0.0, ~jffModPreset[\widthSlope], ~jffModPreset[\widthStart], ~jffModPreset[\widthEnd])
	)
});
)

Ndef(\jffModTest1).clear;

(
Ndef(\jff).fadeTime_(6);
)

(
~jffPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.35);
)


(
~jffPreset = (planetDrone_1a: rrand(0.13, 0.8), planetDrone_2a: rrand(0.145, 0.39), planetDrone_3a: rrand(0.2, 0.7), planetDrone_4a: rrand(0.1, 0.76),  planetDrone_effect_1: rrand(0.3, 0.65), planetDrone_effect_2: rrand(0.25, 0.65), planetDrone_effect_3: rrand(0.0625, 0.12), amp: 0.35);
)


// continue à tourner sur 4 canaux

(

Ndef(\jff,{

	var pd_1a = ~jffPreset[\planetDrone_1a] * 750, pd_2a = ~jffPreset[\planetDrone_2a] * 750, pd_3a = ~jffPreset[\planetDrone_3a] * 170, pd_4a = ~jffPreset[\planetDrone_4a] * 750, sig, mod;

	mod = SinOsc.ar(
		freq: 0.00039 + (~jffPreset[\planetDrone_effect_3]),
		phase: 0.0,
		mul: ~jffPreset[\planetDrone_effect_2] * 0.38,
		add: 0.0
	);

	sig = Gendy1.ar(
		ampdist: 6,
		durdist: 6,
		adparam: 3,
		ddparam: Dust.ar(
			density: [
				99 + pd_1a, 98 + pd_2a + SinOsc.ar(
					freq: 0.000125,
					phase: 0.0,
					mul: 4,
					add: 0.0
				)
			],
			mul: 1
		),
		minfreq: 18 + abs(pd_3a),
		maxfreq: 375+abs(pd_4a + SinOsc.ar(
			freq: 0.000525,
			phase: 0.0,
			mul: 3,
			add: 0.0
		)
	));
	sig = Klank.ar(
		`[
			[40, 99, 98, 353, 223],
			nil,
			[0.2, 0.3, 0.4, 0.1, 0.17] / 50
		] ,
		/*GVerb.ar(
		CombC.ar(sig) * 0.005,
		9,
		9,
		mul:0.005
		)*/
		CombC.ar(
			sig * 0.05,
			0.4 ,
			mod.linlin(-1, 1, 0, 0.4)
		)
	);

	sig = FreqShift.ar(
		sig,
		0 + ~jffPreset[\planetDrone_effect_1] * (Ndef.kr(\jffModTest1).linexp(0,1,10,170)) // 170
	) / ((2..9) + mod);

	sig = GVerb.ar(
		Mix.ar(sig),
		// sig,
		roomsize: 10, // 80,
		revtime: 3, // 4.85,
		damping: 0.75, // 0.81,
		inputbw: 0.5, // 0.97,
		spread: 20, // 40,
		drylevel: -0,
		earlyreflevel: 0.17, // 0,
		taillevel: 0.31, // -11,
		maxroomsize: 170,
		mul: 0.2 //0.008
	);

	sig = sig * ~jffPreset[\amp] * 0.5;
	sig;
});
)

Ndef(\jff).play(0);

Ndef(\jff).clear(1);