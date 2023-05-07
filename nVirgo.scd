(
~nVirgoPreset = (amp: 0.1, att: 0.01, rel: 20, feedBack: 7.5, sawFreq1: 32, sawFreq2: 33, sawAmp: 0.2, bpff: 2, bpffModSpeed: 1.33, bpffModAmt: 4, delayTime: 2, decayTime: 40);
// default
)

(
~nVirgoPreset = ( 'att': 0.089472068548203, 'sawAmp': 0.2, 'bpffModAmt': 3.0938064455986, 'rel': 15, 'sawFreq2': 552, 'bpff': 2, 'delayTime': 1.8205498456955, 'feedBack': 5.5620234012604, 'bpffModSpeed': 2.9549210321903, 'decayTime': 40, 'amp': 0.2, 'sawFreq1': 225 )
)

(
~nVirgoPreset = ( 'att': 0.11469817638397, 'sawAmp': 0.2, 'bpffModAmt': 2.12881731987, 'rel': 12, 'sawFreq2': 524, 'bpff': 2, 'delayTime': 1.1182125210762, 'feedBack': 0.84835304915905, 'bpffModSpeed': 2.9216046774387, 'decayTime': 40, 'amp': 0.2, 'sawFreq1': 69 )
)

(
~nVirgoPreset = ( 'att': 0.17509307265282, 'sawAmp': 0.2, 'bpffModAmt': 3.5155351161957, 'rel': 13,
  'sawFreq2': 279, 'bpff': 2, 'delayTime': 0.257721811532974, 'feedBack': 0.6553511619568, 'bpffModSpeed': 1.3605163013935,
  'decayTime': 40, 'amp': 0.2, 'sawFreq1': 166 )
)

(
~nVirgoPreset = ( 'att': 0.11383947849274, 'sawAmp': 0.2, 'bpffModAmt': 1.4050741195679, 'rel': 6, 'sawFreq2': 444, 'bpff': 2, 'delayTime': 1.8397490978241, 'feedBack': 1.61629204154015, 'bpffModSpeed': 2.0261113810539, 'decayTime': 40, 'amp': 0.2, 'sawFreq1': 188 )
)

(
~nVirgoPreset = ( 'att': 0.18990749120712, 'sawAmp': 0.2, 'bpffModAmt': 2.2081257104874, 'rel': 13, 'sawFreq2': 694, 'bpff': 2, 'delayTime': 0.87268024682999, 'feedBack': 2.393406867981, 'bpffModSpeed': 2.7786209928989, 'decayTime': 40, 'amp': 0.2, 'sawFreq1': 105 )
)

~nVirgoPreset[\sawFreq2] = 34;

(
~nVirgoPreset = (amp: 0.2, att: rrand(0.01, 0.2), rel: rrand(1,20), feedBack: rrand(4, 7.5), sawFreq1: rrand(32, 230), sawFreq2: rrand(33, 820), sawAmp: 0.2, bpff: 2, bpffModSpeed: rrand(1.33, 3), bpffModAmt: rrand(0.5, 4), delayTime: rrand(0.5, 2), decayTime: 40);
// rrand à faire
)

(
Ndef(\nVirgo, {
	// arg amp = 1, att = 0.01, rel = 20, feedBack = 7.5, sawFreq1 = 32, sawFreq2 = 33, sawAmp = 0.2, bpff = 2, bpffModSpeed = 1.33, bpffModAmt = 4, delayTime = 2, decayTime = 40;
	var sig, env;
	// env = Linen.kr(gate, att, 1, rel, doneAction);
	env = EnvGen.ar(Env.asr(~nVirgoPreset[\att], 1, ~nVirgoPreset[\rel]));
	// var env = EnvGen.ar(Env.linen(0.002, 0.996, 0.002, 1,-3), timeScale:sustain, doneAction:2);
	sig = LocalIn.ar(2) * ~nVirgoPreset[\feedBack] + Saw.ar(
		[~nVirgoPreset[\sawFreq1], ~nVirgoPreset[\sawFreq2]],
		~nVirgoPreset[\sawAmp]
	) * env;
	sig = BPF.ar(
		sig,
		~nVirgoPreset[\bpff] ** LFNoise0.kr(~nVirgoPreset[\bpffModSpeed], ~nVirgoPreset[\bpffModAmt]) * 300,
		0.1
	).distort;
	sig = CombN.ar(sig, 2, ~nVirgoPreset[\delayTime], ~nVirgoPreset[\decayTime]);
	LocalOut.ar(sig);
	// OffsetOut.ar(out, sig * amp);
	// OffsetOut.ar(out, DirtPan.ar(sig * amp, ~dirt.numChannels, pan, env))
	sig = (sig * ~nVirgoPreset[\amp] * env);
});
)

Ndef(\nVirgo).fadeTime_(10);

Ndef(\nVirgo).play(2);

Ndef(\nVirgo).release(10);