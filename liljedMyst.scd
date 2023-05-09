

(
~liljedMystPreset = (amp: 0.016, attack: 0.01, release: 4, sustain: 1, curve: (-4), envPow: 1, pNoiseMul: 0.5, hpfFreq: 10, modDur: 9, lfnFreq: 0.05, ringFreq: 55, ringDec: 1.2, revTime: 99);
)

(
~liljedMystPreset =
;
)

(
~liljedMystPreset =( 'sustain': 1, 'revTime': 25.240484333038, 'attack': 0.17921949744225, 'modDur': 5.2989144086838, 'hpfFreq': 10, 'ringFreq': 57.862939834595, 'envPow': 1, 'amp': 0.0066, 'curve': -2.7574993371964,  'ringDec': 1.3446929931641, 'release': 4, 'pNoiseMul': 0.37704319953918, 'lfnFreq': 0.10199830532074 ) ;
)

(
~liljedMystPreset = (amp: 0.006, attack: rrand(0.01, 0.2), release: 4, sustain: 1, curve: rrand(-4, 2.2), envPow: 1, pNoiseMul: rrand(0.05,0.45), hpfFreq: 10, modDur: rrand(1.2,9), lfnFreq: rrand(0.05, 0.15), ringFreq: rrand(2.5, 3165), ringDec: rrand(0.2, 2), revTime: rrand(10.2, 99));
)

(
~sinOscFbModPreset = (freq: 440.0, feedback: 0.0, mul: 1.0, add: 0.0);
)

(
~sinOscFbModPreset = (freq: rrand(4.0, 400), feedback: rrand(0.0, 0.97), mul: rrand(0.65, 21.0), add: 0.0);
)

(
Ndef(\sinOscFbMod, {SinOscFB.kr(
	~sinOscFbModPreset[\freq],
	~sinOscFbModPreset[\feedback],
	(~sinOscFbModPreset[\mul] ) ,
)
});
)

Ndef(\sinOscFbMod).fadeTime_(10);

(
~mod1Preset = (freq: 500.0, mul: 1.0, add: 0.0) // default
)

(
~mod1Preset = (freq: rrand(1, 50.0), mul: rrand(0.3, 1.0))
)

(
Ndef(\mod1, {
	LFNoise1.kr(
		~mod1Preset[\freq],
		~mod1Preset[\mul]
)});
)

Ndef(\mod1).fadeTime_(28);

(
Ndef(\LiljedMyst, {
	// arg out = 0, amp = 0.6, pan = 0, attack = 0.01, release = 4, sustain = 1, curve = (-4), envPow = 1, pNoiseFreq = 0.5, hpfFreq = 10, modDur = 9, lfnFreq = 0.05, ringFreq = 55, ringDec = 0.2, revTime = 99, gate = 1, doneAction = 2;
	var sig, globalEnv;

	// globalEnv = EnvGen.kr(Env.perc(~liljedMystPreset[\attack], ~liljedMystPreset[\release], curve: ~liljedMystPreset[\curve]), timeScale: ~liljedMystPreset[\sustain], doneAction: 2).pow(~liljedMystPreset[\envPow]);

	globalEnv = EnvGen.kr(
		Env.asr(
			~liljedMystPreset[\attack],
			1,
			~liljedMystPreset[\release],
		),
		timeScale: ~liljedMystPreset[\sustain]
	);

	sig = HPF.ar(
		PinkNoise.ar(~liljedMystPreset[\pNoiseMul]),
		~liljedMystPreset[\hpfFreq]
	) * Line.kr(0, 1, ~liljedMystPreset[\modDur] );

	sig = GVerb.ar(
		({ |i|
			Ringz.ar(
				sig * LFNoise1.kr(~liljedMystPreset[\lfnFreq] + 0.1.rand),
				(~liljedMystPreset[\ringFreq] * i + 60) * Ndef.kr(\sinOscFbMod),
				~liljedMystPreset[\ringDec] * Ndef.kr(\mod1).neg
			)
		}!24).sum,
		2,
		~liljedMystPreset[\revTime] + Ndef.kr(\mod1)
	).tanh;
	sig = sig * globalEnv * ~liljedMystPreset[\amp];
	// OffsetOut.ar(out, sig);
	// OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan, amp));
});
)

Ndef(\LiljedMyst).fadeTime_(12);

Ndef(\LiljedMyst).play(2);

Ndef(\LiljedMyst).release(15);

Ndef(\LiljedMyst).clear;
