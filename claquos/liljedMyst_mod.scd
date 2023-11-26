// 0723 todo : modulations + graphe principal

(
~mod1Preset = (freq: 0.4, feedback: 0.6, mul: 1.0, add: 0.0);
)

(
~mod1Preset = (freq: rrand(0.1, 2), feedback: rrand(0.0, 0.45), mul: rrand(0.65, 1.0), add: 0.0);
)

(
Ndef(\mod1, {
	SinOscFB.kr(
	~mod1Preset[\freq],
	~mod1Preset[\feedback],
	~mod1Preset[\mul] )
});
)

(
Ndef(\mod1, {
	SinOscFB.kr(
		Phasor.kr(0.0, 0.1, 0.1 * ~mod1Preset[\freq], ~mod1Preset[\freq], ~mod1Preset[\freq]),
		Phasor.kr(0.0, 0.1, 0.1 * ~mod1Preset[\feedback], ~mod1Preset[\feedback], ~mod1Preset[\feedback]),
		~mod1Preset[\mul]
	)
});
)

Ndef(\mod1).fadeTime_(10);

(
~mod2Preset = (freq: 0.3, mul: 1.0) // default
)

(
~mod2Preset = (freq: rrand(0.1, 1), mul: rrand(0.63, 1.0))
)

(
Ndef(\mod2, {
	LFNoise1.kr(
		~mod2Preset[\freq],
		~mod2Preset[\mul]
)});
)

(
Ndef(\mod2, {
	LFNoise1.kr(
		Phasor.kr(0.0, 0.1, ~mod2Preset[\freq] * 0.33 , ~mod2Preset[\freq], ~mod2Preset[\freq]),
		~mod2Preset[\mul]
)});
)

Ndef(\mod2).fadeTime_(28);

Ndef(\LiljedMyst).fadeTime_(22);

(
~liljedMystPreset = (amp: 0.00616, attack: 0.01, release: 4, sustain: 1, curve: (-4), envPow: 1, pNoiseMul: 0.5, hpfFreq: 10, modDur: 9, lfnFreq: 0.05, ringFreq: 55, ringDec: 1.2, revTime: 99);
)

(
~liljedMystPreset =
;
)

(
~liljedMystPreset =
;
)

(
~liljedMystPreset = ( 'sustain': 1, 'revTime': 65.192326927185, 'attack': 0.082871043682098, 'modDur': 5.0395264863968, 'hpfFreq': 10, 'ringFreq': 101.11704260111, 'envPow': 1, 'amp': 0.00616, 'pNoiseMul': 0.052640771865845,  'curve': 0.34653465747833, 'ringDec': 0.50830211639404, 'release': 4, 'lfnFreq': 0.10326174497604 ) ;
)

(
~liljedMystPreset =( 'sustain': 1, 'revTime': 25.240484333038, 'attack': 0.17921949744225, 'modDur': 5.2989144086838, 'hpfFreq': 10, 'ringFreq': 57.862939834595, 'envPow': 1, 'amp': 0.0166, 'curve': -2.7574993371964,  'ringDec': 1.3446929931641, 'release': 4, 'pNoiseMul': 0.37704319953918, 'lfnFreq': 0.10199830532074 ) ;
)

(
~liljedMystPreset = (amp: 0.00816, attack: rrand(0.01, 0.2), release: 4, sustain: 1, curve: rrand(-4, 2.2), envPow: 1, pNoiseMul: rrand(0.05,0.45), hpfFreq: 10, modDur: rrand(1.2,9), lfnFreq: rrand(0.05, 0.15), ringFreq: rrand(2.5, 165), ringDec: rrand(0.2, 2), revTime: rrand(10.2, 99));
)

(
Ndef(\LiljedMyst, {
	var sig, globalEnv;


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
		~liljedMystPreset[\hpfFreq] // * (Ndef.kr(\mod1) * 0.25 + 0.5)
	) * Line.kr(0, 1, ~liljedMystPreset[\modDur] );

	sig = GVerb.ar(
		({ |i|
			Ringz.ar(
				sig * LFNoise1.kr(~liljedMystPreset[\lfnFreq] + 0.1.rand),
				~liljedMystPreset[\ringFreq] * i + 60   ,
				// (~liljedMystPreset[\ringFreq] * (i + 60 * (Ndef.kr(\mod2) * 0.25 + 0.5))) * (Ndef.kr(\mod2).cos * 0.25),
				~liljedMystPreset[\ringDec] // + Ndef.kr(\mod2) /*- (Ndef.kr(\mod2) * 0.25 + 0.5)*/
			)
		}!24).sum,
		2,
		~liljedMystPreset[\revTime] //  / (Ndef.kr(\mod1) + 0.5).linlin(-1, 1, 3, 1)
	).tanh;
	sig = sig * globalEnv * ~liljedMystPreset[\amp];
	// sig = sig.sum; // décommenter si modulateurs dans ce graphe
	sig = Limiter.ar(sig, 0.7);
	// OffsetOut.ar(out, sig);
	// OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan, amp));
});
)


Ndef(\LiljedMyst).play(2);

Ndef(\LiljedMyst).release(26);

Ndef(\LiljedMyst).clear;
