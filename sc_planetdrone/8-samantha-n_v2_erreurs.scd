// jarrive pas à déclarer mes vars!

// on le garde

(
~snPreset = (baseFreq: 2.08, planetDrone_2a: 14.5, lfo1: 20, mul1: 1.3, mul2: 2.4, baseFreqLfo: 0.18125,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
~snPreset = (baseFreq: rrand(0.1,16), planetDrone_2a: rrand(0.1,100), lfo1: rrand(0.1,100), mul1: rrand(1.2,2.3), mul2: rrand(0.1,8), baseFreqLfo: rrand(0.1,1.25), planetDrone_3b: 0.2, mul2: 0.1,  planetDrone_effect_1: rrand(0,0.6), planetDrone_effect_2: rrand(0,0.6), planetDrone_effect_3: rrand(0,0.625), amp: 0.15);
)

(
Ndef(\sn,{
	// arg q = 0;
	// |f|
	var sig, f, quickos;
	f = f * 0.5 + (~snPreset[\baseFreq] * 16) + (1.0 + SinOsc.ar(
		~snPreset[\baseFreqLfo] * 1.25, // freq
		1.25, // phase
		~snPreset[\planetDrone_3b] * 25 // mul

	)
	);

	sig = SinOsc.ar(
		f + [0 + (~snPreset[\lfo1] * 100 + SinOsc.ar(
			freq: 0.03,
			phase: 0.0,
			mul: ~snPreset[\mul2],
			add: 0.0
		)
		), // freq
		1 + (~snPreset[\planetDrone_2a] * 100  - SinOsc.ar(
			freq: 0.03,
			phase: 0.0,
			mul: ~snPreset[\mul2],
			add: 0.0
		)
		), // phase
		sig * LFTri.kr(0.75,1.25).range(~snPreset[\mul1],
			0.25 + ~snPreset[\mul2]) // mul
	]);

	sig = (100..90).do{
		sig
	};

	sig = FreeVerb.ar(
		Mix.ar(sig),
		mix:  abs(~snPreset[\planetDrone_effect_1]),
		room: abs(~snPreset[\planetDrone_effect_2]),
		damp:  0.25,
		mul: 1.0,
		add: 0.0
	);

	sig = AllpassN.ar(
		sig, // in
		2.75, // maxdelaytime
		SinOsc.ar(
			0.0258,
			1.38,
			0.12,
			(1.0 + abs(~snPreset[\planetDrone_effect_3] * 250))
		).abs // delaytime
	);

	sig = sig * ~snPreset[\amp] * 0.25;

	sig = Limiter.ar(sig, 0.5);
});
)

Ndef(\sn).play(0);

Ndef(\sn).clear(1);