// sept23 ok + niveaux

(Ndef(\mod1).fadeTime_(12);)

(
~mod1Preset = (freq: 0.5 , freqTo: 0.15 , freqSlope: 0.01, mul: 0.85 , mulTo: 1, mulSlope: 0.05);
)

(
~mod1Preset = ( 'mulTo': 0.64250886440277, 'freqTo': 0.28332920074463, 'mul': 0.97996658086777, 'freqSlope': 0.040702924728394, 'freq': 2.4770538330078, 'mulSlope': 0.37122585535049 );
)

(~mod1Preset = ( 'mulTo': 0.61919504404068, 'freqTo': 0.4604133605957, 'mul': 0.60139971971512, 'freqSlope': 0.091210165023804, 'freq': 1.0715682983398, 'mulSlope': 0.75166455626488 );
)

(
~mod1Preset = (freq: 3.5 , freqTo: 1.75 , freqSlope: 0.05, mul: 1, mulTo: 0.9, mulSlope: 0.01);
)

(
~mod1Preset = (freq: rrand(0.2, 5), freqTo: rrand(0.2, 1), freqSlope: rrand(0.01, 0.1), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.01, 01));
)

(Ndef(\mod1, {
	LFNoise1.kr(
		freq: Phasor.kr(0.0, ~mod1Preset[\freqSlope], ~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqTo]) * (Ndef.kr(\mod3).linlin(-1,1,0.5,1)),
		mul: Phasor.kr(0.0, ~mod1Preset[\mulSlope], ~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulTo]) * (Ndef.kr(\mod2) * 0.5 + 0.5)
	)
});)

(Ndef(\mod2).fadeTime_(12);)

(
~mod2Preset = (freq: 0.5, freqTo: 0.2, freqSlope: 0.05, feedback: 0.1, feedbackTo: pi, feedbackSlope: 0.02, mul: 1, mulTo: 0.5, mulSlope: 0.05);
)

(
~mod2Preset = ( 'mul': 0.81274175643921, 'freqSlope': 0.096158572435379, 'freqTo': 96.60120639801, 'feedback': 0.10402382119255, 'freq': 3.5919137954712, 'feedbackSlope': 0.054205282926559, 'mulTo': 0.76629991531372, 'mulSlope': 0.080954266786575, 'feedbackTo': 1.3974138039626 );
)

(
~mod2Preset = ( 'mul': 0.6971711397171, 'freqSlope': 0.084784740209579, 'freqTo': 271.31825978756, 'feedback': 0.77047368381297, 'freq': 0.65525512695313, 'feedbackSlope': 0.010041692256927, 'mulTo': 0.84707050323486, 'mulSlope': 0.088914043903351, 'feedbackTo': 1.1727996559275 );
)

(
~mod2Preset = ( 'mul': 0.77721283435822, 'freqSlope': 0.077247807979584, 'freqTo': 938.9463133812, 'feedback': 1.3370891481128, 'freq': 2.4459287643433, 'feedbackSlope': 0.069925731420517, 'mulTo': 0.81639413833618, 'mulSlope': 0.033315681219101, 'feedbackTo': 0.94268605943537 );
)

(
~mod2Preset = (freq: 6.5, freqTo: 0.3, freqSlope: 0.003, feedback: pi/2, feedbackTo: 0, feedbackSlope: 0.05, mul: 1, mulTo: 0.9, mulSlope: 0.1);
)

(
~mod2Preset = (freq: rrand(0.2, 5), freqTo: rrand(0.2, 1200), freqSlope: rrand(0.01, 0.1), feedback: rrand(0.0, 0.15), feedbackTo: rrand(0.0, 0.15), feedbackSlope: rrand(0.01, 0.1), mul: rrand(0.65, 0.85), mulTo: rrand(0.65, 0.85), mulSlope: rrand(0.01, 0.1));
)

(Ndef(\mod2, {
	SinOscFB.kr(
		freq: Phasor.kr(0.0, ~mod2Preset[\freqSlope], ~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqTo]) * (Ndef.kr(\mod3).linlin(-1,1,0.25,1)),
		feedback: Phasor.kr(0.0, ~mod2Preset[\feedbackSlope], ~mod2Preset[\feedback], ~mod2Preset[\feedbackTo], ~mod2Preset[\feedbackTo]) * SinOsc.kr(Ndef.kr(\mod1)),
		mul: Phasor.kr(0.0, ~mod2Preset[\mulSlope], ~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulTo])
	);
});)

(Ndef(\mod3).fadeTime_(32);)

(
~mod3Preset = (freq: 0.65, freqTo: 0.13, freqSlope: 0.01, iphase: 0.01, iphaseTo: 0.3, iphaseSlope: 0.01, width: 0.5, widthTo: 1, widthSlope: 0.05, mul: 1, mulTo: 1, mulSlope: 0.1 );
)

(
~mod3Preset = (freq: 0.1, freqTo: 2, freqSlope: 0.2, iphase: 0.6, iphaseTo: 0, iphaseSlope: 0.05, width: 1, widthTo: 0.35, widthSlope: 0.05, mul: 0.95, mulTo: 0.85, mulSlope: 0.01);
)

(
~mod3Preset = (freq: rrand(0.2, 50), freqTo: rrand(0.2, 5), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.01, 0.5), iphaseTo: rrand(0.01, 0.5), iphaseSlope: rrand(0.01, 0.1), width: rrand(0.3, 1), widthTo: rrand(0.3, 1), widthSlope: rrand(0.01, 0.1), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.01, 0.1));
)

(Ndef(\mod3, {
	LFPulse.kr(
		freq: Phasor.kr(0.0, ~mod3Preset[\freqSlope], ~mod3Preset[\freq], ~mod3Preset[\freqTo], ~mod3Preset[\freqTo] ) * (Ndef.kr(\mod1).cos),
		iphase: Phasor.kr(0.0, ~mod3Preset[\iphaseSlope], ~mod3Preset[\iphase], ~mod3Preset[\iphaseTo], ~mod3Preset[\iphaseTo]),
		width: Phasor.kr(0.0, ~mod3Preset[\widthSlope], ~mod3Preset[\width], ~mod3Preset[\widthTo], ~mod3Preset[\widthTo]) * (Ndef.kr(\mod2) * 0.5 + 0.5),
		mul: Phasor.kr(0.0, ~mod3Preset[\mulSlope], ~mod3Preset[\mul], ~mod3Preset[\mulTo], ~mod3Preset[\mulTo])
	)
});)


Ndef(\nozkurt).fadeTime_(29);

(
~nozkurtPreset = (amp: 0.0121, att: 0.01, rel: 5, sinFreq: 55, impMin: 0.0002, impMax: 0.7, impFreq: 8);
// default
)

(
~nozkurtPreset = ( 'impMin': 0.0003625140786171, 'att': 0.043915095329285, 'rel': 5, 'impFreq': 5.1427955, 'impMax': 0.64299078464508, 'amp': 0.0121, 'sinFreq': 76 )
)

(
~nozkurtPreset = ( 'impMin': 0.00020394860506058, 'att': 0.012375417947769, 'rel': 5, 'impFreq': 6.5, 'impMax': 0.31409510111809, 'amp': 0.0121, 'sinFreq': 85 )
)

(
~nozkurtPreset = (amp: 0.0121, att: rrand(0.01, 0.1), rel: 5, sinFreq: rrand(55, 90), impMin: rrand(0.0002, 0.0005), impMax: rrand(0.254, 0.7), impFreq: rrand(0.8, 18));
// rrand
)

(
Ndef(\nozkurt, {
	var sig, env, delayTime;

	env = EnvGen.ar(Env.asr(~nozkurtPreset[\att], 1, ~nozkurtPreset[\rel]));

	sig = SinOsc.ar(~nozkurtPreset[\sinFreq] + Ndef.kr(\mod2), Ndef.kr(\mod3) * 0.5 + 0.5).tanh;

	delayTime = TExpRand.ar(
		~nozkurtPreset[\impMin] * (Ndef.kr(\mod3)).cos,
		~nozkurtPreset[\impMax] * (Ndef.kr(\mod1)).cos,
		Impulse.ar(
			~nozkurtPreset[\impFreq] * Ndef.kr(\mod3).linexp(0, 1, 0.75, 2)
		)
	).round([2e-3 * Ndef.kr(\mod3).linlin(0, 1, 0.5, 0.55), 4e-3]) ;

	sig = AllpassC.ar(sig, 1, delayTime, /*2*/ 1 + (Ndef.kr(\mod2) * 0.5 + 0.5) );
	sig = sig * env * ~nozkurtPreset[\amp] * 2.32;
	sig = Limiter.ar(HPF.ar(sig, 80), 0.35, 0.001);
});
)

Ndef(\nozkurt).play(2);

Ndef(\nozkurt).release(28);

Ndef(\nozkurt).clear;