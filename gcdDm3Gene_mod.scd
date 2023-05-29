// 290523 ok mais pas super intéressant

Ndef(\mod1).fadeTime_(12);

(
~mod1Preset = (freq: 10, freqTo: 0.1, freqSlope: 0.125, iphase: 0.0, iphaseTo: pi, iphaseSlope: 0.0325, width: 0.5, widthTo: 0.95, widthSlope: 0.045, mul: 0.5, mulTo: 0.95, mulSlope: 0.05);
)

(
~mod1Preset = (freq: 0.3, freqTo: 0.5, freqSlope: 0.12, iphase: 0.0, iphaseTo: 0.1, iphaseSlope: 0.03, width: 0.95, widthTo: 0.25, widthSlope: 0.05, mul: 0.95, mulTo: 0.5, mulSlope: 0.06);
)

(
~mod1Preset = (freq: rrand(0.1, 3), freqTo: rrand(0.1, 5), freqSlope: rrand(0.01, 0.10), iphase: rrand(0.0, 1), iphaseTo: rrand(0.01, 1), iphaseSlope: rrand(0.01, 0.10), width: rrand(0.1, 1), widthTo: rrand(0.1, 1), widthSlope: rrand(0.01, 0.10), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.01, 0.10));
)

(
Ndef(\mod1, {
	LFPulse.kr(
		freq: Phasor.kr(start: ~mod1Preset[\freq], end: ~mod1Preset[\freqTo], rate: ~mod1Preset[\freqSlope], resetPos: ~mod1Preset[\freqTo]) * (Ndef.kr(\mod2) * 0.5 + 0.5),
		iphase: Phasor.kr(start: ~mod1Preset[\iphase], end: ~mod1Preset[\iphaseTo], rate: ~mod1Preset[\iphaseSlope], resetPos: ~mod1Preset[\iphaseTo]),
		width: Phasor.kr(start: ~mod1Preset[\width], end: ~mod1Preset[\widthTo], rate: ~mod1Preset[\widthSlope], resetPos: ~mod1Preset[\widthTo]),
		mul: Phasor.kr(start: ~mod1Preset[\mul], end: ~mod1Preset[\mulTo], rate: ~mod1Preset[\mulSlope], resetPos: ~mod1Preset[\mulTo])
	)
});
)


Ndef(\mod2).fadeTime_(12);

(
~mod2Preset = (freq: 0.5, freqTo: 0.25, freqSlope: 0.05, feedback: 0.0, feedbackTo: pi, feedbackSlope: 0.06, mul: 0.47, mulTo: 0.75, mulSlope: 0.07);
)

(
~mod2Preset = (freq: rrand(0.05, 2), freqTo: rrand(0.01, 3), freqSlope: rrand(0.01, 0.10), feedback: rrand(0, pi), feedbackTo: rrand(0, 2*pi), feedbackSlope: rrand(0.010, 0.10), mul: rrand(0.5, 0.95), mulTo: rrand(0.5, 0.95), mulSlope: rrand(0.01, 0.10));
)

(
Ndef(\mod2, {
	SinOscFB.kr(
		freq: Phasor.kr(start: ~mod2Preset[\freq], end: ~mod2Preset[\freqTo], rate: ~mod2Preset[\freqSlope], resetPos: ~mod2Preset[\freqTo]) * (Ndef.kr(\mod1) * 0.5 + 0.5),
		feedback: Phasor.kr(start: ~mod2Preset[\feedback], end: ~mod2Preset[\feedbackTo], rate: ~mod2Preset[\feedbackSlope], resetPos: ~mod2Preset[\feedbackTo]),
		mul: Phasor.kr(start: ~mod2Preset[\mul], end: ~mod2Preset[\mulTo], rate: ~mod2Preset[\mulSlope], resetPos: ~mod2Preset[\mulTo])
	)
});
)


Ndef(\gcdDm3Gene).fadeTime_(18);

(
~gcdDm3GenePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, add1: 102, add2: 101, add3: 100, mod1: 100, mod2: 101, mod3: 102, dev1: 10, dev2: 20, seq1: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], seq2: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], seq3: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
// default
)

(
~gcdDm3GenePreset = ( 'atk': 0.06398223733902, 'dev1': 9, 'add1': 93, 'mod2': 42, 'amp': 0.1, 'mod3': 92, 'add2': 94, 'add3': 86, 'dev2': 20, 'mod1': 95, 'rls': 0.21757351160049,  'sustain': 1, seq1: [2, 6, 12, 5], seq2: [1, 1, 2, 3, 3, 4, 4, 7, 5, 8, 12], seq3: [12, 9] )
)

(
~gcdDm3GenePreset = ( 'atk': 0.014672823309898, 'dev1': 9, 'add1': 82, 'mod2': 92, 'amp': 0.1, 'mod3': 49, 'add2': 79,   'add3': 88, 'dev2': 22, 'mod1': 60, 'rls': 0.40523991584778, 'sustain': 1, seq1: [ 2, 3, 4, 6, 8, 8, 9, 9, 9, 9, 11, 12 ], seq2: [ 1, 3, 4, 5, 7, 8, 10, 11, 11, 11 ], seq3: [ 2, 4, 4, 6, 7, 10, 11, 11, 11, 12, 12 ] )
)

(
~gcdDm3GenePreset = ( 'atk': 0.09078190100193, 'dev1': 10, 'add1': 99, 'mod2': 46, 'amp': 0.1, 'mod3': 101, 'add2': 75,   'add3': 75, 'dev2': 21, 'mod1': 92, 'rls': 0.2850227355957, 'sustain': 1, seq1: [1, 2, 10, 2, 2, 3, 6, 7, 9, 11, 13, 16, 19], seq2: [12, 13, 12, 16, 13, 15, 14, 12, 15, 10], seq3: [6, 9, 12, 16, 18, 29] )
)



(
~randArr = { arg min = 1, max = 12, size = 10;
	var arr = { rrand(min, max) } ! size;
	arr.sort;
};

Post << ~gcdDm3GenePreset = (amp: 0.15, atk: rrand(0.001, 0.1), rls: rrand(0.2, 1.5), sustain: 1, add1: rrand(80, 102), add2: rrand(60, 100), add3: rrand(75, 90), mod1: rrand(40, 100), mod2: rrand(30, 101), mod3: rrand(42, 102), dev1: rrand(8, 10), dev2: rrand(15, 25), seq1: ~randArr.(size:rrand(8, 12)), seq2: ~randArr.(size:rrand(6, 12)), seq3: ~randArr.(size:rrand(4, 12)));
// rrand
)


(
Ndef(\gcdDm3Gene, {
	var sig, sig1, sig2, sig3, env;

	env = EnvGen.kr(Env.asr(~gcdDm3GenePreset[\atk], 1, ~gcdDm3GenePreset[\rls]), timeScale: ~gcdDm3GenePreset[\sustain]);

	sig1 = TDuty.ar(Dseq(~gcdDm3GenePreset[\seq1] , inf) + ~gcdDm3GenePreset[\add1] * SampleDur.ir);
	sig2 = TDuty.ar(Dseq(~gcdDm3GenePreset[\seq2] , inf) + ~gcdDm3GenePreset[\add2]  * SampleDur.ir);
	sig3 = TDuty.ar(Dseq(~gcdDm3GenePreset[\seq3] , inf) + ~gcdDm3GenePreset[\add3] * SampleDur.ir);

	sig1 = PulseCount.ar(sig1)  % ~gcdDm3GenePreset[\mod1];
	sig2 = PulseCount.ar(sig2)  % ~gcdDm3GenePreset[\mod2] ;
	sig3 = PulseCount.ar(sig3) % ~gcdDm3GenePreset[\mod3];

	sig = gcd(gcd(sig1 + [0,0], sig2 + [0, ~gcdDm3GenePreset[\dev1]  + (Ndef(\mod1) * 0.5 + 0.5)  ]), sig3 + [0, ~gcdDm3GenePreset[\dev2]  + (Ndef.kr(\mod2) % 0.5 + 0.5)]);
	sig = Limiter.ar(LPF.ar(HPF.ar(sig, 20), 10000), 0.3);

	sig = sig * env;
	sig = (sig * ~gcdDm3GenePreset[\amp]);
	// OffsetOut.ar(out, sig);
});
)


Ndef(\gcdDm3Gene).play(2);


Ndef(\gcdDm3Gene).release(10);