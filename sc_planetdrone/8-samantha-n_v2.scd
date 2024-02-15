// 1502 probleme declaration vars!

// on le garde

(
~snPreset = (baseFreq: 2.08, lfo2: 14.5, lfo1: 20, mul1: 1.3, mul2: 2.4, baseFreqLfo: 0.18125, baseFreqMul: 5, verbMix: 0.3, verbRoom: 0.25, allPassMul: 15.625, amp: 0.1);
)

(
~snPreset = (baseFreq: rrand(0.1,16), lfo2: rrand(0.1,100), lfo1: rrand(0.1,100), mul1: rrand(1.2,2.3), mul2: rrand(0.1,8), baseFreqLfo: rrand(0.1,1.25), baseFreqMul: rrand(0.1,25), mul2: rrand(0.1, 8),  verbMix: rrand(0.0,0.95), verbRoom: rrand(0.0,0.95), allPassMul: rrand(0.1,250), amp: 0.15);
)

(
Ndef(\sn,{
	// arg q = 0;
	var sig, flute;

	flute = flute  + ~snPreset[\baseFreq] + 1.0 + SinOsc.ar(
		~snPreset[\baseFreqLfo], // freq
		1.25, // phase
		~snPreset[\baseFreqMul] // mul
	);

/*	sig = SinOsc.ar(
		flute + [0 + (~snPreset[\lfo1] + SinOsc.ar(
			freq: 0.03,
			phase: 0.0,
			mul: ~snPreset[\mul2],
			add: 0.0
		)
		), // freq
		1 + (~snPreset[\lfo2]  - SinOsc.ar(
			freq: 0.03,
			phase: 0.0,
			mul: ~snPreset[\mul2],
			add: 0.0
		)
		), // phase
		sig * LFTri.kr(0.75,1.25).range(~snPreset[\mul1], 0.25 + ~snPreset[\mul2]) // mul
	]);

	sig = (100..90).do{
		sig
	};

	sig = FreeVerb.ar(
		Mix.ar(sig),
		mix:  ~snPreset[\verbMix],
		room: ~snPreset[\verbRoom],
		damp:  0.25,
		mul: 1.0,
		add: 0.0
	);

	sig = AllpassN.ar(
		sig, // in
		2.75, // maxdelaytime
		SinOsc.ar(
			0.0258, // freq
			1.38, // phase
			0.12, // mul
			1.0 + ~snPreset[\allPassMul] // add
		).abs // delaytime
	);

	sig = sig * ~snPreset[\amp] * 0.25;

	sig = Limiter.ar(sig, 0.5);*/
});
)

Ndef(\sn).play(0);

Ndef(\sn).clear(1);