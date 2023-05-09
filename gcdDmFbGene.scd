// copié 2304
// à finir

(
~gcdDmFbGenePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, ser1Size: 4, ser2Size: 5, add1: 50, add2: 50.1, mod: 50, sinFmin: 70, div: 10, sigSel: 0, fbSel: 0, ser1: , ser2: );
// default
)

(
~gcdDmFbGenePreset = ( 'add1': 57, 'sustain': 1, 'fbSel': 0, 'rls': 0.2647763133049, 'atk': 0.095083946466446, 'amp': 0.1, 'ser2Size': 3.5095220208168, 'sigSel': 0, 'ser1Size': 2.8815880775452, 'mod': 58, 'sinFmin': 107, 'add2': 114.15673396587, 'div': 11, ser1: , ser2: );
)

(
~gcdDmFbGenePreset = ( 'add1': 143, 'sustain': 1, 'fbSel': 0, 'rls': 0.43422375917435,  'atk': 0.094964017391205, 'amp': 0.1, 'ser2Size': 4.7962199449539, 'sigSel': 0, 'ser1Size': 3.3565378665924,  'mod': 67, 'sinFmin': 142, 'add2': 73.579010593891, 'div': 16, ser1: , ser2:  );
)

(
~gcdDmFbGenePreset = ( 'add1': 187, 'sustain': 1, 'fbSel': 0, 'rls': 0.36143919229507, 'atk': 0.0184901835799217, 'amp': 0.1, 'ser2Size': 6.5922054052353, 'sigSel': 0, 'ser1Size': 3.0188598155975, 'mod': 171, 'sinFmin': 85, 'add2': 122.65872319937, 'div': 9, ser1: , ser2: ) ;
) // cool preset

(
~gcdDmFbGenePreset = ( 'add1': 132, 'sustain': 1, 'fbSel': 0, 'rls': 0.21065083742142, 'atk': 0.045341633558273, 'amp': 0.1, 'ser2Size': 4.9993562698364, 'sigSel': 0, 'ser1Size': 1.1673916339874, 'mod': 54, 'sinFmin': 89, 'add2': 50.905527365208, 'div': 15, ser1: , ser2: ) ;
)

(
~randSerRev = {
	arg start = 0, size = 6, reverse = false;
	var arr = Array.series(size, start, 1);
	if(reverse, {
		arr.sort.reverse ;
	}, {
		arr;
	});
};

Post << ~gcdDmFbGenePreset = (amp: 0.1, atk: rrand(0.001, 0.1), rls: rrand(0.2, 0.5), sustain: 1, ser1Size: rrand(0.6, 4), ser2Size: rrand(2.5, 6), add1: rrand(50, 150), add2: rrand(50.1, 125), mod: rrand(50, 76), sinFmin: rrand(70, 200), div: rrand(10, 16), sigSel: 0, fbSel: 0, ser1: ~randSerRev.value(size: 4.rand), ser2: ~randSerRev.value(size: 8.rand,reverse: true));
// rrand
)


(
Ndef(\gcdDmFbGene, {
	var seq1, seq2, src1, src2, count1, count2, in, sinFrq, sig, sig1,
	sig2, sig3, sig4, sig5, fb, env;

	env = EnvGen.kr(Env.asr(~gcdDmFbGenePreset[\atk], 1, ~gcdDmFbGenePreset[\rls]), timeScale: ~gcdDmFbGenePreset[\sustain]);

	seq1 = Dseq([Dser(\ser1.kr(#[0, 1, 2, 3]), ~gcdDmFbGenePreset[\ser1Size])], inf);
	seq2 = Dseq([Dser(\ser2.kr(#[4, 3, 2, 1, 0]), ~gcdDmFbGenePreset[\ser2Size])], inf);

	src1 = TDuty.ar(seq1 + ~gcdDmFbGenePreset[\add1] * SampleDur.ir);
	src2 = TDuty.ar(seq2 + ~gcdDmFbGenePreset[\add2] * SampleDur.ir);

	count1 = PulseCount.ar(src1) % ~gcdDmFbGenePreset[\mod];
	count2 = PulseCount.ar(src2) % ~gcdDmFbGenePreset[\mod];

	in = LocalIn.ar(2);
	sig1 = gcd(count1, count2 + [0, 1]);
	sinFrq = sig1.linexp(0, ~gcdDmFbGenePreset[\mod], ~gcdDmFbGenePreset[\sinFmin], 10000);
	sig2 = SinOsc.ar(sinFrq, 0, in / 2);
	sig3 = SinOsc.ar(sinFrq * (in / ~gcdDmFbGenePreset[\div ]+ 1));
	sig4 = SinOsc.ar(sinFrq);
	sig5 = SinOsc.ar(sinFrq) + BPF.ar(in * 0.95,
		LFDNoise3.ar(0.2).range(100, 10000));

	~gcdDmFbGenePreset[\sigSel] = ~gcdDmFbGenePreset[\sigSel].min(3).max(0);
	sig = Select.ar(~gcdDmFbGenePreset[\sigSel], [sig2, sig3, sig4, sig5]);

	~gcdDmFbGenePreset[\fbSel] = ~gcdDmFbGenePreset[\fbSel].min(3).max(0);
	fb = Select.ar(~gcdDmFbGenePreset[\fbSel], [sinFrq.reverse, in.reverse, sig * in, sig]);
	LocalOut.ar(fb);

	sig = (Limiter.ar(LPF.ar(HPF.ar(sig, 20), 10000), 0.3) * env * ~gcdDmFbGenePreset[\amp]);
	// OffsetOut.ar(out, sig);
});
)

Ndef(\gcdDmFbGene).fadeTime_(19);

Ndef(\gcdDmFbGene).play(2);

Ndef(\gcdDmFbGene).release(20);
