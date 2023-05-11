Ndef(\mod1).fadeTime_(12);

(
~mod1Preset = (syncFreq: 10, syncFreqTo: 20, syncFreqSlope: 5, sawFreq: 2, sawFreqTo: 5, sawFreqSlope: 4, mul: 0.5, mulTo: 0.75, mulSlope: 6.5, LPFFreq: 1400, LPFFreqTo: 5, LPFFreqSlope: 12, LPFMul: 0.6, LPFMulTo: 0.75, LPFMulSlope: 5);
)

(
~mod1Preset = (syncFreq: , syncFreqTo: , syncFreqSlope: , sawFreq: , sawFreqTo: , sawFreqSlope: , mul: , mulTo: , mulSlope: , LPFFreq: , LPFFreqTo: , LPFFreqSlope: , LPFMul: , LPFMulTo: , LPFMulSlope: );
)

(
~mod1Preset = (syncFreq: rrand(0.1, 10), syncFreqTo: rrand(0.1, 10), syncFreqSlope: rrand(0.1, 10), sawFreq: rrand(0.1, 10), sawFreqTo: rrand(0.1, 10), sawFreqSlope: rrand(0.1, 10), mul: rrand(0.45, 0.95), mulTo: rrand(0.45, 0.95), mulSlope: rrand(0.1, 10), LPFFreq: rrand(20.0, 8000), LPFFreqTo: rrand(20.0, 8000), LPFFreqSlope: rrand(0.1, 10), LPFMul: rrand(0.45, 0.95), LPFMulTo: rrand(0.45, 0.95), LPFMulSlope: rrand(0.1, 10));
)

(
Ndef(\mod1, {
	LPF.kr(
		SyncSaw.kr(
			syncFreq: XLine.kr(~mod1Preset[\syncFreq], ~mod1Preset[\syncFreqTo], ~mod1Preset[\syncFreqSlope]),
			sawFreq: Line.kr(~mod1Preset[\sawFreq], ~mod1Preset[\sawFreqTo], ~mod1Preset[\sawFreqSlope]),
			mul: Line.kr(~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulSlope])
		),
		freq: XLine.kr(~mod1Preset[\LPFFreq], ~mod1Preset[\LPFFreqTo], ~mod1Preset[\LPFFreqTo]),
		mul: Line.kr(~mod1Preset[\LPFMul], ~mod1Preset[\LPFMulTo], ~mod1Preset[\LPFMulSlope])
	);
});
)

Ndef(\mod2).fadeTime_(12);

(
~mod2Preset = (freq: 0.2, freqTo: 1, freqSlope: 2.5, iphase: 0.0, iphaseTo: 0.25, iphaseSlope: 3.5, width: 0.35, widthTo: 0.85, widthSlope: 4.5, mul: 0.95, mulTo: 0.85, mulSlope: 1.5, BPFFreq: 400.0, BPFFreqTo: 40, BPFFreqSlope: 5.5, BPFRq: 0.5, BPFRqTo: 0.35, BPFRqSlope: 6.5, BPFMul: 0.75);
)

(
~mod2Preset = (freq: rrand(0.05, 20), freqTo: rrand(0.05, 20), freqSlope: rrand(0.1, 10), iphase: rrand(0.0, 0.5), iphaseTo: rrand(0.5, 1), iphaseSlope: rrand(0.1, 10), width: rrand(0.35, 1), widthTo: rrand(0.35, 1), widthSlope: rrand(0.1, 10), mul: rrand(0.65, 1), mulTo: rrand(0.65, 1), mulSlope: rrand(0.1, 10), BPFFreq: rrand(10.0, 400), BPFFreqTo: rrand(20.0, 400), BPFFreqSlope: rrand(0.1, 10), BPFRq: rrand(0.35, 0.65), BPFRqTo: rrand(0.35, 0.8), BPFRqSlope: rrand(0.1, 10), BPFMul: rrand(0.25, 0.65));
)

(
Ndef(\mod2, {
	BPF.kr(
		VarSaw.kr(
			freq: XLine.kr(~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqSlope]),
			iphase: Line.kr(~mod2Preset[\iphase], ~mod2Preset[\iphaseTo], ~mod2Preset[\iphaseSlope]),
			width: Line.kr(~mod2Preset[\width], ~mod2Preset[\widthTo], ~mod2Preset[\widthSlope]),
			mul: XLine.kr(~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulSlope])
			) ,
		freq: XLine.kr(~mod2Preset[\BPFFreq], ~mod2Preset[\BPFFreqTo], ~mod2Preset[\BPFFreqSlope]),
		rq: XLine.kr(~mod2Preset[\BPFRq], ~mod2Preset[\BPFRqTo], ~mod2Preset[\BPFRqSlope]),
		mul: ~mod2Preset[\BPFMul]
	);
})
)

Ndef(\mod3).fadeTime_(12);

(
~mod3Preset = (carfreq: rrand(0.1, 5), modfreq: rrand(0.05, 10), pmindex: rrand(0.01, 10), modphase: rrand(0.0, pi*2), mul: 0.95, modfreqTo: rrand(0.05, 10), modfreqSlope: rrand(0.1, 10), pmindexTo: rrand(0.1, 12), pmindexSlope: rrand(0.1, 10), modphaseTo: rrand(0.0, pi*2), modphaseSlope: rrand(0.1, 10))
)

(
Ndef(\mod3, {
	PMOsc.kr(
		carfreq: ~mod3Preset[\carfreq],
		modfreq: Line.kr( ~mod3Preset[\modfreq], ~mod3Preset[\modfreqTo],  ~mod3Preset[\modfreqSlope] * 10),
		pmindex: Line.kr( ~mod3Preset[\pmindex], ~mod3Preset[\pmindexTo], ~mod3Preset[\pmindexSlope]* 15),
		modphase: Line.kr( ~mod3Preset[\modphase], ~mod3Preset[\modphaseTo], ~mod3Preset[\modphaseSlope]),
		mul: ~mod3Preset[\mul]
	)
});
)

Ndef(\lcmnoise).fadeTime_(15);

(
~lcmnoisePreset =  (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, spread: 1, GHdamp: 0.2, GHsize: 1.6, GHfeedback: 0.9, GHmodDepth: 0.1, GHmodFreq: 2); // default
)

(
~lcmnoisPreset = ( 'spread': 1, 'GHdamp': 3.3919062614441, 'GHmodDepth': 0.39348196983337, 'rls': 1.3268489480019, 'GHfeedback': 0.19473052024841, 'amp': 0.1, 'atk': 0.072431233942509, 'GHmodFreq': 8.7910389900208, 'GHsize': 4.6630247278452, 'sustain': 1 );
)

(
~lcmnoisePreset =  (amp: 0.1, atk: rrand(0.0005, 0.1), rls: rrand(0.2, 1.35), sustain: 1, spread: 1, GHsize: rrand(0.0001,5), GHdamp: rrand(0.5, 5), GHfeedback: rrand(0.01, 1), GHmodDepth: rrand(0.01, 1), GHmodFreq: rrand(0.01, 10)); // rrand
)

(
Ndef(\lcmnoise, {
	var snd, revchain, env;

	env = EnvGen.kr(Env.asr(~lcmnoisePreset[\atk], 1, ~lcmnoisePreset[\rls]), timeScale: ~lcmnoisePreset[\sustain]) + SinOsc.kr(Ndef.kr(\mod2) % Ndef.kr(\mod3));

	snd = [
		tanh(
			lcm(
				SinOsc.ar(
					Ndef.kr(\mod2) * Ndef.kr(\mod1) + LFNoise0.kr( LFNoise0.kr(1/10).exprange(0.1,1)).exprange(1,15000),
					XLine.kr(~mod2Preset[\iphase], ~mod2Preset[\iphaseTo], ~mod3Preset[\modphaseSlope])
				).range(-100,100).round(1),
				SinOsc.ar(Ndef.kr(\mod1) / LFNoise0.kr(Ndef.kr(\mod3) % LFNoise0.kr(1/10).exprange(0.1,1)).exprange(1,15000),
					XLine.kr(~mod3Preset[\modphase], ~mod3Preset[\modphaseTo], ~mod2Preset[\iphaseSlope])
				).range(-100,100).round(1)
			)*0.0001
		),
		tanh(
			lcm(
				Saw.ar(Ndef.kr(\mod2) * Ndef.kr(\mod3) - LFNoise0.kr( LFNoise0.kr(1/10).exprange(0.1,1)).exprange(1,15000)
				).range(-100,100).round(1),
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
		delayTime: LFNoise1.ar(Ndef.kr(\mod3)).range(0.0001,0.2),
		damp: SinOsc.kr(~lcmnoisePreset[\GHdamp], [pi, pi/2]),
		size: LFNoise1.ar(Ndef.kr(\mod1) + ~lcmnoisePreset[\GHsize]).exprange(0.0001,5),
		feedback: LFNoise1.kr(Ndef.kr(\mod2) + ~lcmnoisePreset[\GHfeedback]),
		modDepth: LFNoise0.kr(Ndef.kr(\mod3) % ~lcmnoisePreset[\GHmodDepth]),
		modFreq: LFNoise0.kr(Ndef.kr(\mod1) % ~lcmnoisePreset[\GHmodFreq])
	);
	revchain = LeakDC.ar(revchain);
	revchain = Limiter.ar(revchain) * LFNoise1.ar([1,1]).range(0,0.9);
	snd = snd * LFNoise0.ar([0.9,0.8]).range(0,2);
	snd = snd + revchain;
	//snd = Limiter.ar(snd, 0.7);
	snd = snd.softclip;
	snd = LPF.ar(snd, LFNoise1.ar(0.1).exprange(100,20000));
	snd * env * ~lcmnoisePreset[\amp];
})
)

Ndef(\lcmnoise).play(2);

Ndef(\lcmnoise).release(10);

