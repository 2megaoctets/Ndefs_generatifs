(Ndef(\mod1).fadeTime_(10);)

(~mod1Preset = (freq: 1, mul: 0.5);)

(~mod1Preset = (freq: 0.2, mul: 0.5);)

(~mod1Preset = (freq: rrand(0.05, 4), mul: 0.5);)

(
Ndef(\mod1, {
	LFNoise1.kr(
		~mod1Preset[\freq],
		~mod1Preset[\mul]
	)
});
)

(
Ndef(\mod1, {
	LFNoise1.kr(
		~mod1Preset[\freq] + Ndef.kr(\mod3),
		~mod1Preset[\mul]
	)
});
)

(Ndef(\mod2).fadeTime_(10);)

(~mod2Preset = (freq: 1, feedback: 0.5, mul: 0.75);)

(~mod2Preset = (freq: 0.5, feedback: 0.25, mul: 0.8);)

(~mod2Preset = (freq: rrand(0.075, 10), feedback: rrand(0.0, 0.5), mul: 0.5);)

(
Ndef(\mod2, {
	SinOscFB.kr(
		freq: ~mod2Preset[\freq],
		feedback: Phasor.kr(rate: 1, start: ~mod2Preset[\feedback], end: 0, resetPos: ~mod2Preset[\feedback]) /** Ndef.kr(\mod1)*/,
		mul: ~mod2Preset[\mul]
	)
});
)

(
Ndef(\mod2, {
	SinOscFB.kr(
		freq: Phasor.kr(rate: 0.1, start: ~mod2Preset[\freq], end: ~mod2Preset[\freq] * 0.3, resetPos: ~mod2Preset[\freq]),
		feedback: ~mod2Preset[\feedback] + Ndef.kr(\mod1) * 0.5,
		mul: ~mod2Preset[\mul]
	)
});
)


(
Ndef(\mod3).fadeTime_(7);
)

(
~mod3Preset = (freq: rrand(0.05, 5), mul: 0.8);
)

(
Ndef(\mod3, {
	LFNoise0.kr(
		freq: ~mod3Preset[\freq] + Ndef.kr(\mod2),
		mul: ~mod3Preset[\mul] * Ndef.kr(\mod1) * 0.5,
	);
});
)



(
~bozkurtPreset = (amp: 0.21, att: 0.01, rel: 10, impFreq: 0.25, freq1: 4, freq2: 6, delTime: 0.3, decTime: 50, feedBack: 1);
// default
)

(
~bozkurtPreset = ( 'delTime': 0.35701537251472, 'rel': 2.315798997879, 'att': 0.021658489704132, 'feedBack': 0.47254087924957, 'freq1': 6.5221264839172, 'decTime': 31.328126788139, 'amp': 0.21, 'impFreq': 0.54620859026909, 'freq2': 8.1100391149521 );
)

(
~bozkurtPreset = ( 'delTime': 0.25894921898842, 'rel': 4.3807460069656, 'att': 0.053788027763367, 'feedBack': 0.85149073600769, 'freq1': 9.2091425895691, 'decTime': 31.394058465958, 'amp': 0.21, 'impFreq': 0.36753037571907, 'freq2': 8.2406767845154 )
)

(
~bozkurtPreset = ( 'delTime': 0.16357867717743, 'rel': 6.9976888895035, 'att': 0.091488406658173, 'feedBack': 0.73556730747223, 'freq1': 11.467145872116, 'decTime': 34.696674346924, 'amp': 0.21, 'impFreq': 0.74586114287376, 'freq2': 7.4439162254333 )
)

(
~bozkurtPreset = ( 'delTime': 0.21283552646637, 'rel': 6.5413566827774, 'att': 0.016543077230453, 'feedBack': 0.79398288726807, 'freq1': 5.8135765552521, 'decTime': 40.379449725151, 'amp': 0.21, 'impFreq': 0.80025678873062, 'freq2': 8.3558935403824 )
)

(
~bozkurtPreset = ( 'delTime': 0.27248809337616, 'rel': 3.4016854763031, 'att': 0.088343280553818, 'feedBack': 0.80513486862183, 'freq1': 3.3835899829865, 'decTime': 39.665528535843, 'amp': 0.21, 'impFreq': 0.92727735638618, 'freq2': 7.4780132770538 )
)

(
~bozkurtPreset = (amp: 0.21, att: rrand(0.01, 0.1), rel: rrand(1.5, 10), impFreq: rrand(0.25, 1), freq1: rrand(4, 12.4), freq2: rrand(6, 10.2), delTime: rrand(0.1, 0.43), decTime: rrand(25.0, 50), feedBack: rrand(0.4, 1));
// rrand
)

(
Ndef(\bozkurt, {
	var sig, env, input, ctrl;
	env = EnvGen.ar(Env.asr(~bozkurtPreset[\att], 1, ~bozkurtPreset[\rel]));
	input = LocalIn.ar(2).tanh * cos (~bozkurtPreset[\feedBack] + Ndef.kr(\mod1)).range(0.1, 0.5);
	ctrl = Latch.kr(input[0].abs, Impulse.kr(~bozkurtPreset[\impFreq] * cos(Ndef.kr(\mod3) + Ndef.kr(\mod2)) * 0.5));
	sig = Blip.ar([~bozkurtPreset[\freq1], ~bozkurtPreset[\freq2]] + Ndef.kr(\mod1), /*100*/ Ndef.kr(\mod3) * ctrl + 50, Ndef.kr(\mod2) * 0.25) * 0.25;
	sig = CombC.ar(
		sig,
		Ndef.kr(\mod1) + Ndef.kr(\mod2) * 0.5/*1*/,
		ctrl * ~bozkurtPreset[\delTime],
		~bozkurtPreset[\decTime] * input
	);
	LocalOut.ar(sig);
	sig = Splay.ar(sig * env, 1, ~bozkurtPreset[\amp] * 0.5);
	sig = Limiter.ar(sig, 0.5, 0.05);
});
)

Ndef(\bozkurt).fadeTime_(19);

Ndef(\bozkurt).play(2);

Ndef(\bozkurt).release(20);
