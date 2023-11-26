// voir l 50 pour remplacer les Line

Ndef(\mod1).fadeTime_(12);

(
~mod1Preset = (syncFreq: 0.1, syncFreqTo: 2, syncFreqSlope: 5, sawFreq: 3.0, sawFreqTo: 5, sawFreqSlope: 4, mul: 1, mulTo: 0.75, mulSlope: 6.5, LPFFreq: 1400.0, LPFFreqTo: 500, LPFFreqSlope: 12, LPFMul: 0.6, LPFMulTo: 0.75, LPFMulSlope: 5);
)

(
~mod1Preset = (syncFreq: 2, syncFreqTo: 4, syncFreqSlope: 1.5, sawFreq: 0.5, sawFreqTo: 1.6, sawFreqSlope: 2.5, mul: 1.0, mulTo: 1.0, mulSlope: 1, LPFFreq: 14000, LPFFreqTo: 40, LPFFreqSlope: 10, LPFMul: 0.10, LPFMulTo: 0.37, LPFMulSlope: 2.5);
)

(
~mod1Preset = (syncFreq: rrand(0.1, 10), syncFreqTo: rrand(0.1, 10), syncFreqSlope: rrand(0.1, 10), sawFreq: rrand(0.1, 10), sawFreqTo: rrand(0.1, 10), sawFreqSlope: rrand(0.1, 10), mul: rrand(0.45, 0.95), mulTo: rrand(0.45, 0.95), mulSlope: rrand(0.1, 10), LPFFreq: rrand(20.0, 8000), LPFFreqTo: rrand(20.0, 8000), LPFFreqSlope: rrand(0.1, 10), LPFMul: rrand(0.45, 0.95), LPFMulTo: rrand(0.45, 0.95), LPFMulSlope: rrand(0.1, 10));
)

(
Ndef(\mod1, {
	LPF.kr(
		SyncSaw.kr(
			syncFreq: Phasor.kr(start: ~mod1Preset[\syncFreq], end: ~mod1Preset[\syncFreqTo], rate: ~mod1Preset[\syncFreqSlope]),
			sawFreq: Phasor.kr(start: ~mod1Preset[\sawFreq], end: ~mod1Preset[\sawFreqTo], rate: ~mod1Preset[\sawFreqSlope]),
			mul: Phasor.kr(start: ~mod1Preset[\mul], end: ~mod1Preset[\mulTo], rate: ~mod1Preset[\mulSlope])
		),
		freq: Phasor.kr(start: ~mod1Preset[\LPFFreq], end: ~mod1Preset[\LPFFreqTo], rate: ~mod1Preset[\LPFFreqTo]),
		// mul: Phasor.kr(start: ~mod1Preset[\LPFMul], end: ~mod1Preset[\LPFMulTo], rate: ~mod1Preset[\LPFMulSlope])
	);
});
)

// exit localhost

Ndef(\mod2).fadeTime_(12);
Ndef(\mod1).clear;

(
~mod2Preset = (freq: 0.2, freqTo: 1, freqSlope: 2.5, iphase: 0.0, iphaseTo: 0.25, iphaseSlope: 3.5, width: 0.35, widthTo: 0.85, widthSlope: 4.5, mul: 0.95, mulTo: 0.85, mulSlope: 1.5);
)

(
~mod2Preset = (freq: rrand(0.05, 20), freqTo: rrand(0.05, 20), freqSlope: rrand(0.1, 10), iphase: rrand(0.05, 1), iphaseTo: rrand(0.05, 1), iphaseSlope: rrand(0.1, 10), width: rrand(0.35, 1), widthTo: rrand(0.35, 1), widthSlope: rrand(0.1, 10), mul: rrand(0.65, 1), mulTo: rrand(0.65, 1), mulSlope: rrand(0.1, 10));
)

(
Ndef(\mod2, {
	VarSaw.ar(
		freq: Phasor.kr(start: ~mod2Preset[\freq], end: ~mod2Preset[\freqTo], rate: ~mod2Preset[\freqSlope]),
		iphase: Phasor.kr(start: ~mod2Preset[\iphase], end: ~mod2Preset[\iphaseTo], rate: ~mod2Preset[\iphaseSlope]),
		width: Phasor.kr(start: ~mod2Preset[\width], end: ~mod2Preset[\widthTo], rate: ~mod2Preset[\widthSlope]),
		// mul: Phasor.kr(start: ~mod2Preset[\mul], end: ~mod2Preset[\mulTo], rate: ~mod2Preset[\mulSlope])
	);
})
)

Ndef(\mod2).clear;

Ndef(\mod3).fadeTime_(12);

(
~mod3Preset = (carfreq: 0.1, carfreqTo: 0.65, carfreqSlope: 1.5, modfreq: 1.5, modfreqTo: 0.065, modfreqSlope: 8.5, pmindex: 0.05, pmindexTo: 10.65, pmindexSlope: 5, modphase: 2, modphaseTo: 0.25, modphaseSlope: 3.65, mul: 1.0);
)

(
~mod3Preset = (carfreq: rrand(0.1, 5), modfreq: rrand(0.05, 10), pmindex: rrand(0.01, 10), modphase: rrand(0.0, pi), mul: 1.0, modfreqTo: rrand(0.05, 10), modfreqSlope: rrand(0.1, 10), pmindexTo: rrand(0.1, 12), pmindexSlope: rrand(0.1, 10), modphaseTo: rrand(0.0, pi), modphaseSlope: rrand(0.1, 10))
)

(
Ndef(\mod3, {
	PMOsc.kr(
		carfreq: ~mod3Preset[\carfreq],
		modfreq: Phasor.kr(start: ~mod3Preset[\modfreq], end: ~mod3Preset[\modfreqTo], rate: ~mod3Preset[\modfreqSlope]),
		pmindex: Phasor.kr(start: ~mod3Preset[\pmindex], end: ~mod3Preset[\pmindexTo], rate: ~mod3Preset[\pmindexSlope]),
		modphase: Phasor.kr(start: ~mod3Preset[\modphase], end: ~mod3Preset[\modphaseTo], rate: ~mod3Preset[\modphaseSlope]),
		// mul: ~mod3Preset[\mul]
	)
});
)

Ndef(\lcmnoise).fadeTime_(15);

(
~lcmnoisePreset =  (amp: 0.11, atk: 0.001, rls: 0.2, sustain: 1, spread: 1, GHdamp: 0.2, GHsize: 1.6, GHfeedback: 0.9, GHmodDepth: 0.1, GHmodFreq: 2); // default
)

(
~lcmnoisPreset = ( 'spread': 1, 'GHdamp': 3.3919062614441, 'GHmodDepth': 0.39348196983337, 'rls': 1.3268489480019, 'GHfeedback': 0.19473052024841, 'amp': 0.1, 'atk': 0.072431233942509, 'GHmodFreq': 8.7910389900208, 'GHsize': 4.6630247278452, 'sustain': 1 );
)

(
~lcmnoisePreset =  (amp: 0.121, atk: rrand(0.0005, 0.1), rls: rrand(0.2, 1.35), sustain: 1, spread: rrand(0.75, 1), GHsize: rrand(0.0001,5), GHdamp: rrand(0.5, 5), GHfeedback: rrand(0.01, 0.6), GHmodDepth: rrand(0.01, 1), GHmodFreq: rrand(0.01, 10)); // rrand
)


(
Ndef(\lcmnoise, {
	var snd, revchain, env;

	env = EnvGen.kr(Env.asr(~lcmnoisePreset[\atk], 1, ~lcmnoisePreset[\rls]), timeScale: ~lcmnoisePreset[\sustain]) ;

	snd = [
		tanh(
			lcm(
				SinOsc.ar(
					Ndef.ar(\mod2) * Ndef.kr(\mod1) + LFNoise0.kr( LFNoise0.kr(1/10).exprange(0.1,1)).exprange(1,15000),
					XLine.kr(~mod2Preset[\iphase])
				).range(-100,100).round(1),
				SinOsc.ar(
					Ndef.kr(\mod1) / LFNoise0.kr(Ndef.kr(\mod3) % LFNoise0.kr(1/10).exprange(0.1,1)).exprange(1,15000),
					XLine.kr(~mod3Preset[\modphase])
				).range(-100,100).round(1)
			)*0.0001
		),
		tanh(
			lcm(
				Saw.ar(
					Ndef.ar(\mod2) * Ndef.kr(\mod3) - LFNoise0.kr( LFNoise0.kr(1/10).exprange(0.1,1)).exprange(1,15000)).range(-100,100).round(1),
				LFCub.ar(LFNoise0.kr(Ndef(\mod1) * Ndef.kr(\mod2) % LFNoise0.kr(1/10).exprange(0.1,1)).exprange(1,15000)
				).range(-100,100).round(1)
			)*0.0001
		)
	];

	snd = BHiPass.ar(snd, 180);
	snd = snd.softclip * 0.8;
	snd = Splay.ar(snd, ~lcmnoisePreset[\spread]);
	revchain = snd * Lag.ar(
		LFPulse.ar(
			LFNoise0.ar(1).exprange(0.01,2),
			width:0.001
		),
		0.1
	) * LFNoise1.ar(1).range(10,10000);

	revchain = Greyhole.ar(
		in: revchain,
		delayTime: LFNoise1.ar().range(0.0001,0.2),
		damp: SinOsc.kr(~lcmnoisePreset[\GHdamp], rrand(0, pi)),
		size: LFNoise1.ar( ~lcmnoisePreset[\GHsize]).exprange(0.0001,5),
		feedback: LFNoise1.kr(~lcmnoisePreset[\GHfeedback]),
		modDepth: LFNoise0.kr(~lcmnoisePreset[\GHmodDepth]),
		modFreq: LFNoise0.kr(~lcmnoisePreset[\GHmodFreq])
	);
	revchain = LeakDC.ar(revchain);
	revchain = Limiter.ar(revchain) * LFNoise1.ar([1,1]).range(0,0.9);
	snd = snd * LFNoise0.ar([0.9,0.8]).range(0,2);
	snd = snd + revchain;
	//snd = Limiter.ar(snd, 0.7);
	snd = snd.softclip;
	snd = LPF.ar(snd, LFNoise1.ar(0.1).exprange(100,20000));
	snd = snd * env * ~lcmnoisePreset[\amp] * 0.45;
	// rajouter sum
	// snd = snd.sum;
	snd = Limiter.ar(snd.sum, 0.5);
})
)

Ndef(\lcmnoise).play(2);

Ndef(\lcmnoise).release(18);

Ndef(\lcmnoise).clear;