
(
~nozkurtPreset = (amp: 0.021, att: 0.01, rel: 5, sinFreq: 55, impMin: 0.0002, impMax: 0.7, impFreq: 8);
// default
)

(
~nozkurtPreset = ( 'impMin': 0.0003625140786171, 'att': 0.043915095329285, 'rel': 5, 'impFreq': 13, 'impMax': 0.64299078464508, 'amp': 0.0121, 'sinFreq': 56 )
)

(
~nozkurtPreset = ( 'impMin': 0.00020394860506058, 'att': 0.012375417947769, 'rel': 5, 'impFreq': 14, 'impMax': 0.31409510111809, 'amp': 0.0121, 'sinFreq': 55 )
)

(
~nozkurtPreset = (amp: 0.0121, att: rrand(0.01, 0.1), rel: 5, sinFreq: rrand(55, 90), impMin: rrand(0.0002, 0.0005), impMax: rrand(0.254, 0.7), impFreq: rrand(8, 18));
// rrand
)

(
Ndef(\nozkurt, {
	// amp = 1, att = 0.01, rel = 5, sinFreq = 55, impMin = 0.0002, impMax = 0.7, impFreq = 8;
	var sig, env, delayTime;
	// env = Linen.kr(gate, att, 1, rel, doneAction);
	env = EnvGen.ar(Env.asr(~nozkurtPreset[\att], 1, ~nozkurtPreset[\rel]));
	sig = SinOsc.ar(~nozkurtPreset[\sinFreq]).tanh;
	delayTime = TExpRand.ar(~nozkurtPreset[\impMin], ~nozkurtPreset[\impMax], Impulse.ar(~nozkurtPreset[\impFreq])).round([2e-3, 4e-3]);
	sig = AllpassC.ar(sig, 1, delayTime, 2);
	sig = sig * env * ~nozkurtPreset[\amp];
	// OffsetOut.ar(out, sig);
	// OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan));
});
)

Ndef(\nozkurt).fadeTime_(9);

Ndef(\nozkurt).play(2);

Ndef(\nozkurt).release(10);
