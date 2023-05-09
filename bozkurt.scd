(
~bozkurtPreset = (amp: 0.21, att: 0.01, rel: 10, impFreq: 0.25, freq1: 4, freq2: 6, delTime: 0.3, decTime: 50, feedBack: 1);
// default
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
	//  amp = 1, att = 0.01, rel = 10, impFreq = 0.25, freq1 = 4, freq2 = 6, delTime = 0.3, decTime = 50, feedBack = 1;
	var sig, env, input, ctrl;
	//env = Linen.kr(gate, att, 1, rel, doneAction);
	env = EnvGen.ar(Env.asr(~bozkurtPreset[\att], 1, ~bozkurtPreset[\rel]));
	input = LocalIn.ar(2).tanh * ~bozkurtPreset[\feedBack];
	ctrl = Latch.kr(input[0].abs, Impulse.kr(~bozkurtPreset[\impFreq]));
	sig = Blip.ar([~bozkurtPreset[\freq1], ~bozkurtPreset[\freq2]], 100 * ctrl + 50, 0.9);
	sig = CombC.ar(
		sig,
		1,
		ctrl * ~bozkurtPreset[\delTime],
		~bozkurtPreset[\decTime] * input
	);
	LocalOut.ar(sig);
	sig = Splay.ar(sig * env, 1, ~bozkurtPreset[\amp]);
	// OffsetOut.ar(out, sig);
	// OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan));
});
)

Ndef(\bozkurt).fadeTime_(19);

Ndef(\bozkurt).play(2);

Ndef(\bozkurt).release(10);
