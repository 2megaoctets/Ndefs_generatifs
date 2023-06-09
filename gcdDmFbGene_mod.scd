// crade
// copié 2304
// à finir

Ndef(\mod1).fadeTime_(32);

(
~mod1Preset = (freq: 2, freqTo: 0.5, freqSlope: 3.5, numharm: 20, numharmTo: 200, numharmSlope: 5.75, mul: 0.75, mulTo: 0.99, mulSlope: 2.0);
)

(
~mod1Preset = (freq: 2, freqTo: 0.5, freqSlope: 3.5, numharm: 20, numharmTo: 200, numharmSlope: 5.75, mul: 0.75, mulTo: 0.99, mulSlope: 2.0);
)

(
~mod1Preset = (freq: rrand(0.25, 2), freqTo: rrand(0.15, 2), freqSlope: rrand(0.5, 0.135), numharm: rrand(2, 25), numharmTo: rrand(8, 100), numharmSlope: rrand(0.0075, 0.15), mul: rrand(0.5, 0.99), mulTo: rrand(0.5, 0.99), mulSlope: rrand(0.02, 0.20), LPFFreq: rrand(200.0, 4000), LPFFreqTo: rrand(201.0, 5000), LPFFreqSlope: rrand(0.025, 0.10));
)

(
Ndef(\mod1, {
	Blip.kr(
		freq: Phasor.kr(start: ~mod1Preset[\freq], end: ~mod1Preset[\freqTo], rate: ~mod1Preset[\freqSlope], resetPos: ~mod1Preset[\freqTo] ),
		numharm: Phasor.kr(start: ~mod1Preset[\numharm], end: ~mod1Preset[\numharmTo], rate: ~mod1Preset[\numharmSlope], resetPos: ~mod1Preset[\numharmTo]) * (Ndef.kr(\mod2) * 0.5 + 0.5),
		mul: Phasor.kr(start: ~mod1Preset[\mul], end: ~mod1Preset[\mulTo], rate: ~mod1Preset[\mulSlope], resetPos: ~mod1Preset[\mulTo])
	)
});
)

Ndef(\mod1).release(3);

(
~mod2Preset = (carfreq: 0.1, carfreqTo: 2, carfreqSlope: 0.1, modfreq: 1, modfreqTo: 2.5, modfreqSlope: 0.05, pmindex: 2, pmindexTo: 0.75, pmindexSlope: 0.03, modphase: 2, modphaseTo: 0.15, modphaseSlope: 0.1, mul: 0.5);
)

(
~mod2Preset = (carfreq: rrand(0.1, 2), carfreqTo: rrand(0.1, 2), carfreqSlope: rrand(0.01, 0.15), modfreq: rrand(0.1, 5), modfreqTo: rrand(0.1, 5), modfreqSlope: rrand(0.01, 0.15), pmindex: rrand(0.2, 3), pmindexTo: rrand(0.2, 3), pmindexSlope: rrand(0.01, 0.1), modphase: rrand(0.2, 5), modphaseTo: rrand(0.15, 5), modphaseSlope: rrand(0.01, 0.1), mul: 0.5);
)

(
~mod2Preset = ( 'carfreq': 0.8979260802269, 'modfreqTo': 2.4774720549583, 'carfreqSlope': 0.090828719139099, 'pmindexSlope': 0.022671281099319, 'modphase': 2.0382415771484, 'modfreq': 4.790743458271, 'pmindexTo': 1.7840669631958, 'modphaseTo': 4.8637698590755, 'carfreqTo': 1.4202994227409, 'modfreqSlope': 0.11175356388092, 'mul': 0.5, 'pmindex': 2.4148223876953, 'modphaseSlope': 0.029196430444717 ) ;
)

(Ndef(\mod2, {
	PMOsc.kr(
		carfreq: Phasor.kr(rate: ~mod2Preset[\carfreqSlope], start: ~mod2Preset[\carfreq], end: ~mod2Preset[\carfreqTo], resetPos: ~mod2Preset[\carfreqTo]),
		modfreq: Phasor.kr(rate: ~mod2Preset[\modfreqSlope], start: ~mod2Preset[\modfreq], end: ~mod2Preset[\modfreqTo], resetPos: ~mod2Preset[\modfreqTo]) * cos(Ndef.kr(\mod1) * 0.5 + 0.5),
		pmindex: Phasor.kr(rate: ~mod2Preset[\pmindex], start: ~mod2Preset[\pmindexTo], end: ~mod2Preset[\pmindexSlope], resetPos: ~mod2Preset[\pmindexTo]),
		modphase: Phasor.kr(rate: ~mod2Preset[\modphaseSlope], start: ~mod2Preset[\modphase], end: ~mod2Preset[\modphaseTo], resetPos: ~mod2Preset[\modphaseTo]),
		mul: ~mod2Preset[\mul]
	)
});
)

(
~gcdDmFbGenePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, ser1Size: 4, ser2Size: 5, add1: 50, add2: 50.1, mod: 50, sinFmin: 70, div: 10, sigSel: 0, fbSel: 0, ser1:[ 0, 1, 2 ] , ser2: [ 6, 5, 4, 3, 2, 1, 0 ]);
// default
)

(
~gcdDmFbGenePreset = ( 'add1': 57, 'sustain': 1, 'fbSel': 0, 'rls': 0.2647763133049, 'atk': 0.095083946466446, 'amp': 0.1, 'ser2Size': 3.5095220208168, 'sigSel': 0, 'ser1Size': 2.8815880775452, 'mod': 58, 'sinFmin': 107, 'add2': 114.15673396587, 'div': 11, ser1: [ 0, 1, 2 ], ser2: [ 3, 2, 1, 0 ]);
)

(
~gcdDmFbGenePreset = ( 'add1': 143, 'sustain': 1, 'fbSel': 0, 'rls': 0.43422375917435,  'atk': 0.094964017391205, 'amp': 0.1, 'ser2Size': 4.7962199449539, 'sigSel': 0, 'ser1Size': 3.3565378665924,  'mod': 67, 'sinFmin': 142, 'add2': 73.579010593891, 'div': 16, ser1: [ 0, 1 ], ser2: [ 5, 4, 3, 2, 1, 0 ] );
)

(
~gcdDmFbGenePreset = ( 'add1': 187, 'sustain': 1, 'fbSel': 0, 'rls': 0.36143919229507, 'atk': 0.0184901835799217, 'amp': 0.1, 'ser2Size': 6.5922054052353, 'sigSel': 0, 'ser1Size': 3.0188598155975, 'mod': 171, 'sinFmin': 85, 'add2': 122.65872319937, 'div': 9, ser1: [0, 1, 2, 3], ser2: [5, 4, 3, 2, 1]) ;
) // cool preset

(
~gcdDmFbGenePreset = ( 'add1': 132, 'sustain': 1, 'fbSel': 0, 'rls': 0.21065083742142, 'atk': 0.045341633558273, 'amp': 0.1, 'ser2Size': 4.9993562698364, 'sigSel': 0, 'ser1Size': 1.1673916339874, 'mod': 54, 'sinFmin': 89, 'add2': 50.905527365208, 'div': 15, ser1: [ 0, 1 ] , ser2: [ 4, 3, 2, 1, 0 ]) ;
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

	src1 = TDuty.ar(seq1 + ~gcdDmFbGenePreset[\add1] + (Ndef.kr(\mod1)* 0.5 + 0.5) * SampleDur.ir );
	src2 = TDuty.ar(seq2 + ~gcdDmFbGenePreset[\add2] + cos(Ndef.ar(\mod2) * 0.5 + 0.5) * SampleDur.ir);

	count1 = PulseCount.ar(src1) % ~gcdDmFbGenePreset[\mod];
	count2 = PulseCount.ar(src2) % ~gcdDmFbGenePreset[\mod];

	in = LocalIn.ar(2);
	sig1 = gcd(count1, count2 + [0, 1]);
	sinFrq = sig1.linexp(0, ~gcdDmFbGenePreset[\mod], ~gcdDmFbGenePreset[\sinFmin], 10000);
	sig2 = SinOsc.ar(sinFrq , 0, in / 2);
	sig3 = SinOsc.ar(sinFrq * ((in / ~gcdDmFbGenePreset[\div ]+ 1) ));
	sig4 = SinOsc.ar(sinFrq /*+ cos(Ndef.kr(\mod1) * 0.5 + 0.5)*/, [pi, pi/2]);
	sig5 = SinOsc.ar(sinFrq /*% cos(Ndef.ar(\mod2) * 0.5 + 0.5)*/) + BPF.ar(in * 0.95,
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
