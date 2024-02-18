// 1602: args
// on le garde

Ndef(\sg).fadeTime_(7);

(
~sgPreset = (voiceFreq: 65, bassFreq: 50, voiceLevel: 0.45, voiceModFreqMax: 700, bassLpfFreqMax: 1205, blipMul: 0.43, blipRel: 0.145, blipAtt: 0.2, bassLpfFactor: 0.1,  blipDecayTime: 7.8, blipDelayTime: 0.75, freqArray: Array.series(8, 100, 100), voicePanLfo: 3/8, freqFactor: 1.0625, voiceLpfLfo: 1/4, voiceLpfFreqMin: 300, voiceLpfFreqMax: 9000, amp: 0.1);
)


(
~sgPreset = (voiceFreq: rrand(1.0,500), bassFreq: rrand(50,70), voiceLevel: rrand(0.25,0.45), voiceModFreqMax: rrand(500, 1500), bassLpfFreqMax: rrand(1205, 2400), blipMul: rrand(0.25,1.1), blipRel: rrand(0.4, 10.4), blipAtt: rrand(0.01, 0.2), bassLpfFactor: rrand(0.4,1.2),  blipDecayTime: rrand(3.0, 19), blipDelayTime: rrand(0.5,1), freqFactor: rrand(1.0,2.0), freqArray: Array.series(8, rrand(60,110), rrand(90.0,120)), voicePanLfo: rrand(0.05,1), voiceLpfLfo: rrand(0.05, 1.5), voiceLpfFreqMin: rrand(180, 750), voiceLpfFreqMax: rrand(5000, 12000), amp: 0.15);
)


(
Ndef(\sg, {

	// var freqs = Array.series(8, 100, 100) * ~sgPreset[\freqFactor];
	var freqs =  ~sgPreset[\freqArray] * ~sgPreset[\freqFactor];

	var trig = Impulse.kr(1) + Impulse.kr(3/8);

	var blip = SinOsc.ar(
		Demand.kr(
			trig,
			0,
			Drand(freqs, inf)
		),
		mul: ~sgPreset[\blipMul]
	)
	* Env.perc(
		~sgPreset[\blipAtt], // attackTime
		~sgPreset[\blipRel] // releaseTime
	).kr(gate: trig);

	var bass = Pan2.ar(
		LPF.ar(
			Saw.ar(
				~sgPreset[\bassFreq] * {LFNoise1.kr(1).bipolar(1/4).midiratio}!7,
				mul: LFTri.kr(2).range(0.2, 0.5)
			),
			SinOsc.kr(1/8).range(375, ~sgPreset[\bassLpfFreqMax]),
		).sum * ~sgPreset[\bassLpfFactor],
		SinOsc.kr(0.1)
	);

	var sig = 0;

	freqs.do{
		|freq|
		var detune = {LFNoise1.kr(1/4).bipolar(1/2).midiratio}!8;
		var voice = PMOsc.ar(
			freq + ~sgPreset[\voiceFreq] * detune, // carfreq
			LFNoise1.kr(1/7).exprange(4, ~sgPreset[\voiceModFreqMax] ), // modfreq
			LFNoise1.kr(1/9).range(0, 2) // modphase
		) * 0.1;

		voice = LPF.ar(
			voice,
			LFNoise0.kr(LFNoise0.kr(~sgPreset[\voiceLpfLfo]).range(1, 8)).exprange(~sgPreset[\voiceLpfFreqMin], ~sgPreset[\voiceLpfFreqMax])
		);

		sig = sig + Pan2.ar(
			voice.sum,
			SinOsc.kr(~sgPreset[\voicePanLfo]),
			(~sgPreset[\voiceLevel] )
		);
	};

	sig = sig + bass;

	sig = sig + Pan2.ar(
		CombL.ar(
			blip, // in
			2, // maxdelaytime
			~sgPreset[\blipDelayTime], // delaytime
			~sgPreset[\blipDecayTime] // decaytime
		),
		LFNoise1.kr(0.85)
	);

	sig = XFade2.ar(
		sig * 0.75,
		FreeVerb.ar(sig * 0.75)
	);

	sig = sig * ~sgPreset[\amp] * 0.5;
});
)

Ndef(\sg).play(0);

Ndef(\sg).release(1);