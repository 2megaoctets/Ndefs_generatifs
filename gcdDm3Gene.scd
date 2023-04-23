
(
~gcdDm3GenePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, add1: 102, add2: 101, add3: 100, mod1: 100, mod2: 101, mod3: 102, dev1: 10, dev2: 20, seq1: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], seq2: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], seq3: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
// default
)

(
~gcdDm3GenePreset = ( 'atk': 0.06398223733902, 'dev1': 9, 'add1': 93, 'mod2': 42, 'amp': 0.1, 'mod3': 92, 'add2': 94, 'add3': 86, 'dev2': 20, 'mod1': 95, 'rls': 0.21757351160049,  'sustain': 1, seq1: [2, 6, 12, 5], seq2: [7, 5, 8], seq3: [12, 9] )
)

(
~gcdDm3GenePreset = ( 'atk': 0.014672823309898, 'dev1': 9, 'add1': 82, 'mod2': 92, 'amp': 0.1, 'mod3': 49, 'add2': 79,   'add3': 88, 'dev2': 22, 'mod1': 60, 'rls': 0.40523991584778, 'sustain': 1, seq1: [], seq2: [], seq3: [] )
)

(
~gcdDm3GenePreset = ( 'atk': 0.09078190100193, 'dev1': 10, 'add1': 99, 'mod2': 46, 'amp': 0.1, 'mod3': 101, 'add2': 75,   'add3': 75, 'dev2': 21, 'mod1': 92, 'rls': 0.2850227355957, 'sustain': 1, seq1: [1, 2, 10, 2, 2, 3, 6, 7, 9, 11, 13, 16, 19], seq2: [12, 13, 12, 16, 13, 15, 14, 12, 15, 10], seq3: [6, 17, 12, 9] )
)



(
~randArr = { arg min = 1, max = 12, size = 10;
	var arr = { rrand(min, max) } ! size;
	arr.sort;
};

Post << ~gcdDm3GenePreset = (amp: 0.1, atk: rrand(0.001, 0.1), rls: rrand(0.2, 0.5), sustain: 1, add1: rrand(80, 102), add2: rrand(60, 100), add3: rrand(75, 90), mod1: rrand(40, 100), mod2: rrand(30, 101), mod3: rrand(42, 102), dev1: rrand(8, 10), dev2: rrand(15, 25), seq1: ~randArr.(size:rrand(8, 12)), seq2: ~randArr.(size:rrand(6, 12)), seq3: ~randArr.(size:rrand(4, 12)));
// rrand
)


(
Ndef(\gcdDm3Gene, {
	var sig, sig1, sig2, sig3, env;

	env = EnvGen.kr(Env.asr(~gcdDm3GenePreset[\atk], 1, ~gcdDm3GenePreset[\rls]), timeScale: ~gcdDm3GenePreset[\sustain]);

	// sig1 = TDuty.ar(Dseq(~gcdDm3GenePreset[\seq1] * SinOsc.kr(0.52, 1.16, SinOsc.kr(2, 0, 30)), inf) + ~gcdDm3GenePreset[\add1] * SampleDur.ir);
	sig1 = TDuty.ar(Dseq(~gcdDm3GenePreset[\seq1], inf) + ~gcdDm3GenePreset[\add1] * SampleDur.ir);
	sig2 = TDuty.ar(Dseq(~gcdDm3GenePreset[\seq2], inf) + ~gcdDm3GenePreset[\add2] * SampleDur.ir);
	sig3 = TDuty.ar(Dseq(~gcdDm3GenePreset[\seq3], inf) + ~gcdDm3GenePreset[\add3] * SampleDur.ir);

	sig1 = PulseCount.ar(sig1) % ~gcdDm3GenePreset[\mod1];
	sig2 = PulseCount.ar(sig2) % ~gcdDm3GenePreset[\mod2];
	sig3 = PulseCount.ar(sig3) % ~gcdDm3GenePreset[\mod3];

	sig = gcd(gcd(sig1 + [0, 0], sig2 + [0, ~gcdDm3GenePreset[\dev1]]), sig3 + [0, ~gcdDm3GenePreset[\dev2]]);
	sig = Limiter.ar(LPF.ar(HPF.ar(sig, 20), 10000), 0.3);

	sig = sig * env;
	sig = (sig * ~gcdDm3GenePreset[\amp]);
	// OffsetOut.ar(out, sig);
});
)


Ndef(\gcdDm3Gene).play(2);

Ndef(\gcdDm3Gene).fadeTime_(18);

Ndef(\gcdDm3Gene).release(10);