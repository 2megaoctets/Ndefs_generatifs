Ndef(\sjj).fadeTime_(7);

(
~sjjPreset = ( 'verbTime': 47.780424194336, 'dryLev': 2.801035630703,  'dustPeak': 1645.1504770398, 'thunderCut': 22.4795021176338, 'freqShift': 503.91099545956, 'sineMul': 0.6678050249815, 'sineFreq': 86.74050359726, 'amp': 0.5 );
)

(
~sjjPreset = ( 'verbTime': 70.973628071547, 'dryLev': 2.5712993502617, 'dustPeak': 1652.2077770829, 'thunderCut': 32.895571947098, 'freqShift': 444.96779732704,  'sineMul': 0.87470272183418, 'sineFreq': 167.01450591087, 'amp': 0.5 )

)

(
~sjjPreset = ( 'verbTime': 6.0616959893703, 'dryLev': 2.7438785195351, 'dustPeak': 1307.0006404519, 'thunderCut': 20.41522725820541, 'freqShift': 162.70868238211, 'sineMul': 0.42007188200951, 'sineFreq': 80.074102556705, 'amp': 0.5 );
)

(
~sjjPreset = ('verbTime': 61.633116316795, 'dryLev': 0.63970246315002, 'dustPeak': 2472.4772890329, 'thunderCut': 22.1284556388855,   'freqShift': 257.70429860353, 'sineMul': 0.8571080416441, 'sineFreq': 100.95558589994907, 'amp': 0.5 );
)

(
~sjjPreset = ( 'verbTime': 4.3333858025074, 'dryLev': 0.25096019506454, 'dustPeak': 5495.2053107381, 'thunderCut': 30.895075762272, 'freqShift': 83.46645597219, 'sineMul': 0.95810942053795, 'sineFreq': 180.4272670596838, 'amp': 0.5 );
)

(
~sjjPreset = (verbTime: rrand(0.01, 75), dryLev: rrand(0.1, 3), dustPeak: rrand(0.1, 5500), thunderCut: rrand(20, 350), freqShift: rrand(0.1, 550), sineMul: rrand(0.1, 0.925), sineFreq: rrand(0.1, 200), amp: 0.5);
)

(
Ndef(\sjj, {
	var sig, sig2;
	sig = HPF.ar(
		PinkNoise.ar(0.08 + LFNoise1.kr(0.3, 0.02)) + LPF.ar(Dust2.ar(LFNoise1.kr(0.2).range(40, 50)), 6000 + ~sjjPreset[\dustPeak] ), 100);
	sig2 = LPF.ar(
		10 * HPF.ar(
			PinkNoise.ar(LFNoise1.kr(3).clip(0, 1) * LFNoise1.kr(2).clip(0, 1) ** 1.8),
			20 + ~sjjPreset[\thunderCut]
		),
		LFNoise1.kr(1).exprange(100, 2500)
	).tanh;
	sig = tanh(
		3 * GVerb.ar(
			sig,
			250,
			100 - ~sjjPreset[\verbTime],
			0.25,
			drylevel:0.5
		) * Line.kr(0, 1, 10)
	);
	sig = FreqShift.ar(sig, 0 + ~sjjPreset[\freqShift]) / ((2..8) + SinOsc.ar(
		freq: 0.00025 + (~sjjPreset[\sineFreq]),
		phase: 0.0,
		mul: ~sjjPreset[\sineMul] * 0.43,
		add: 0.0) );

	sig = sig + (
		GVerb.ar(
			sig2,
			270,
			30,
			0.7,
			drylevel: 0.6 + ~sjjPreset[\dryLev]
		) * Line.kr(0, 0.7, 30)
	);

	sig = HPF.ar(sig, 180);

	sig = Splay.ar(sig, 1)* ~sjjPreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\sjj).play(0);

Ndef(\sjj).clear(4);