(Ndef(\mod1).fadeTime_(12);)

(
~mod1Preset = (freq: 0.5 , freqTo: 1.5 , freqSlope: 0.1, mul: 0.85 , mulTo: 1, mulSlope: 0.05);
)

(
~mod1Preset = (freq: 3.5 , freqTo: 1.75 , freqSlope: 0.05, mul: 1, mulTo: 0.9, mulSlope: 0.01);
)

(
~mod1Preset = (freq: rrand(0.2, 5), freqTo: rrand(0.2, 5), freqSlope: rrand(0.01, 0.1), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.01, 01));
)

(Ndef(\mod1, {
	LFNoise1.kr(
		freq: Phasor.kr(0.0, ~mod1Preset[\freqSlope], ~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqTo]) * (Ndef.kr(\mod3).linlin(-1,1,0.5,1)),
		mul: Phasor.kr(0.0, ~mod1Preset[\mulSlope], ~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulTo]) * (Ndef.kr(\mod2) * 0.5 + 0.5)
	)
});)

(Ndef(\mod2).fadeTime_(12);)

(
~mod2Preset = (freq: 5, freqTo: 2, freqSlope: 0.05, feedback: 0.1, feedbackTo: pi, feedbackSlope: 0.02, mul: 1, mulTo: 0.5, mulSlope: 0.05);
)

(
~mod2Preset = (freq: 6.5, freqTo: 0.3, freqSlope: 0.003, feedback: pi/2, feedbackTo: 0, feedbackSlope: 0.05, mul: 1, mulTo: 0.9, mulSlope: 0.1);
)

(
~mod2Preset = (freq: rrand(0.2, 5), freqTo: rrand(0.2, 5), freqSlope: rrand(0.01, 0.1), feedback: rrand(0.0, pi/2), feedbackTo: rrand(0.0, pi/2), feedbackSlope: rrand(0.01, 0.1), mul: rrand(0.65, 0.85), mulTo: rrand(0.65, 0.85), mulSlope: rrand(0.01, 0.1));
)

(Ndef(\mod2, {
	SinOscFB.kr(
		freq: Phasor.kr(0.0, ~mod2Preset[\freqSlope], ~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqTo]) * (Ndef.kr(\mod3).linlin(-1,1,0.25,1)),
		feedback: Phasor.kr(0.0, ~mod2Preset[\feedbackSlope], ~mod2Preset[\feedback], ~mod2Preset[\feedbackTo], ~mod2Preset[\feedbackTo]) * SinOsc.kr(Ndef.kr(\mod1)),
		mul: Phasor.kr(0.0, ~mod2Preset[\mulSlope], ~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulTo])
	);
});)

(Ndef(\mod3).fadeTime_(12);)

(
~mod3Preset = (freq: 0.65, freqTo: 1.3, freqSlope: 0.01, iphase: 0.01, iphaseTo: 0.3, iphaseSlope: 0.01, width: 0.5, widthTo: 1, widthSlope: 0.05, mul: 1, mulTo: 1, mulSlope: 0.1 );
)

(
~mod3Preset = (freq: 0.1, freqTo: 2, freqSlope: 0.2, iphase: 0.6, iphaseTo: 0, iphaseSlope: 0.05, width: 1, widthTo: 0.35, widthSlope: 0.05, mul: 0.95, mulTo: 0.85, mulSlope: 0.01);
)

(
~mod3Preset = (freq: rrand(0.2, 5), freqTo: rrand(0.2, 5), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.01, 0.5), iphaseTo: rrand(0.01, 0.5), iphaseSlope: rrand(0.01, 0.1), width: rrand(0.3, 1), widthTo: rrand(0.3, 1), widthSlope: rrand(0.01, 0.1), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.01, 0.1));
)

(Ndef(\mod3, {
	LFPulse.kr(
		freq: Phasor.kr(0.0, ~mod3Preset[\freqSlope], ~mod3Preset[\freq], ~mod3Preset[\freqTo], ~mod3Preset[\freqTo] ) + (Ndef.kr(\mod1) * 0.5 + 0.5),
		iphase: Phasor.kr(0.0, ~mod3Preset[\iphaseSlope], ~mod3Preset[\iphase], ~mod3Preset[\iphaseTo], ~mod3Preset[\iphaseTo]) * (Ndef.kr(\mod2) * 0.5 + 0.5),
		width: Phasor.kr(0.0, ~mod3Preset[\widthSlope], ~mod3Preset[\width], ~mod3Preset[\widthTo], ~mod3Preset[\widthTo]),
		mul: Phasor.kr(0.0, ~mod3Preset[\mulSlope], ~mod3Preset[\mul], ~mod3Preset[\mulTo], ~mod3Preset[\mulTo])
	)
});)


Ndef(\nozkurt).fadeTime_(9);

(
~nozkurtPreset = (amp: 0.021, att: 0.01, rel: 5, sinFreq: 55, impMin: 0.0002, impMax: 0.7, impFreq: 8);
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
		~nozkurtPreset[\impMin] * (Ndef.kr(\mod3) * 0.5 + 0.5),
		~nozkurtPreset[\impMax] * (Ndef.kr(\mod1) * 0.7 + 0.7),
		Impulse.ar(
			~nozkurtPreset[\impFreq] + Ndef.kr(\mod3).cos)
	).round([2e-3, 4e-3]) ;

	sig = AllpassC.ar(sig, 1, delayTime, /*2*/ 1 + (Ndef.kr(\mod2) * 0.5 + 0.5) );
	sig = sig * env * ~nozkurtPreset[\amp];
	sig = Limiter.ar(sig, 0.7, 0.01);
});
)

Ndef(\nozkurt).play(2);

Ndef(\nozkurt).release(10);


Ndef(\nozkurt).clear;