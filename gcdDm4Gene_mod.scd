Ndef(\mod1).fadeTime_(15);

(
~mod1Preset = (freq: 2 , freqTo: 0.5, freqSlope: 2.5, iphase: 0.0, iphaseTo: pi, iphaseSlope: 3.25, mul: 1.0, mulTo: 0.75, mulSlope: 1.75);
)

(
~mod1Preset = (freq: rrand(0.12, 20) , freqTo: rrand(0.05, 25), freqSlope: rrand(0.15, 10), iphase: rrand(0.0, pi), iphaseTo: rrand(0.0, pi), iphaseSlope: rrand(0.13, 25), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.1, 7.5));
)

(
Ndef(\mod1, {
	FSinOsc.kr(
		freq: Line.kr(~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqSlope]),
		iphase: Line.kr(~mod1Preset[\iphase], ~mod1Preset[\iphaseTo], ~mod1Preset[\iphaseSlope]),
		mul: Line.kr(~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulSlope])
	)
})
)

Ndef(\mod2).fadeTime_(12);

(
~mod2Preset = (carfreq: 1, carfreqTo: 0.5, carfreqSlope: 5, modfreq: 2, modfreqTo: 20, modfreqSlope: 7.5, pmindex: 0.5, pmindexTo: 4, pmindexSlope: 10, modphase: 0.0, modphaseTo: 0.1, modphaseSlope: 6, mul: 0.5, mulTo: 0.75, mulSlope: 6);
)

(
~mod2Preset = (carfreq: rrand(0.1, 127), carfreqTo: rrand(0.1, 127), carfreqSlope: rrand(0.05, 127), modfreq: rrand(0.2, 127), modfreqTo: rrand(0.1, 200), modfreqSlope: rrand(0.05, 10), pmindex: rrand(0.5, 127), pmindexTo: rrand(0.4, 127), pmindexSlope: rrand(0.2, 10), modphase: rrand(0.0, pi), modphaseTo: rrand(0, pi*2), modphaseSlope: rrand(0.1, 10), mul: rrand(0.25, 0.75), mulTo: rrand(0.5, 0.75), mulSlope: rrand(0.6, 10));
)

(
Ndef(\mod2, {
	PMOsc.kr(
		carfreq:  XLine.kr(~mod2Preset[\carfreq], ~mod2Preset[\carfreqTo], ~mod2Preset[\carfreqSlope]),
		modfreq:  Line.kr(~mod2Preset[\modfreq], ~mod2Preset[\modfreqTo], ~mod2Preset[\modfreqSlope]),
		pmindex:  Line.kr(~mod2Preset[\pmindex], ~mod2Preset[\pmindexTo], ~mod2Preset[\pmindexSlope]),
		modphase: Line.kr(~mod2Preset[\modphase], ~mod2Preset[\modphaseTo], ~mod2Preset[\modphaseSlope]),
		mul: Line.kr(~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulSlope])
	)
})
)


(
~gcdDm4GenePreset = ( 'atk': 0.042787989258766, 'mul1': 46, 'dev1': 0.087901091575623, 'mod2': 129,  'add1': 59, 'amp': 0.1, 'mod3': 99, 'end': 0.38251852989197, 'rate1': 8.4022823572159,   'dev2': 1.254590690136, 'add': 271, 'start': 68, 'rls': 0.45941503047943,  'sustain': 1, 'ser': [ 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184 ]) ;
)


(
~gcdDm4GenePreset = ( 'atk': 0.094803431391716, 'mul1': 49, 'dev1': 0.095498728752136, 'mod2': 216, 'add1': 43, 'amp': 0.1, 'mod3': 91, 'end': 0.38516335487366, 'rate1': 9.1425079107285, 'dev2': 1.0559352040291, 'add': 157, 'start': 58, 'rls': 0.40772210359573, 'sustain': 1, 'ser': [ 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299 ] );
)


(
~gcdDm4GenePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, start: 100, end: 0.1, rate1: 10, mod2: 300, mod3: 101, dev1: 0, dev2: 2, add: 600, add1: 61, mul1: 43, ser: [ 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77 ]);
// default
)

(
~gcdDm4GenePreset = ( 'atk': 0.065175143361092, 'mul1': 36, 'dev1': 0.095331811904907, 'mod2': 228, 'add1': 43, 'amp': 0.1, 'mod3': 86, 'end': 0.41456122398376, 'rate1': 7.0137279629707, 'dev2': 0.86043810844421, 'add': 346, 'start': 93, 'rls': 0.26504782438278, 'sustain': 1,  'ser': [ 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295 ] );
)

(
~gcdDm4GenePreset = ( 'atk': 0.096913956522942, 'mul1': 46, 'dev1': 0.030357098579407, 'mod2': 181, 'add1': 23, 'amp': 0.1, 'mod3': 90, 'end': 0.32150664329529, 'rate1': 8.1436048746109, 'dev2': 0.61037647724152, 'add': 202, 'start': 100, 'rls': 0.35190583467484, 'sustain': 1, 'ser': [ 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349 ] );
)

(
~gcdDm4GenePreset = ( 'atk': 0.021186853289604, 'mul1': 35, 'dev1': 0.040206956863403, 'ser': [ 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225 ], 'mod2': 283, 'add1': 59, 'amp': 0.1, 'mod3': 84, 'end': 0.10816841125488,  'rate1': 8.3926626443863, 'dev2': 1.3263306617737, 'add': 436, 'start': 72, 'rls': 0.25731151103973, 'sustain': 1 )
)

(
~gcdDm4GenePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, serSize: 99, start: 10, end: 0.01, rate1: 1, mod2: 500, mod3: 501, dev1: 1, dev2: 3, add: 400, add1: 61, mul1: 53, 'ser': [ 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343 ]  );
)

(
~randSer = {
	arg start = 51, size = 27;
	Array.series(size, start, 1);
};

Post << ~gcdDm4GenePreset = (amp: 0.1, atk: rrand(0.001, 0.1), rls: rrand(0.2, 0.5), sustain: 1, start: rrand(40, 100), end: rrand(0.1, 0.5), rate1: rrand(6.5, 10), mod2: rrand(30,300), mod3: rrand(80,101), dev1: rrand(0, 0.1), dev2: rrand(0.5,2), add: rrand(100,600), add1: rrand(20,61), mul1: rrand(30,53), ser: ~randSer.(rrand(3, 460), rrand(10, 35)));
// rrand
)

(
Ndef(\gcdDm4Gene, {
	var seq, envMod, src1, src2, src3, sig, sig1, env;

	env = EnvGen.kr(Env.asr(~gcdDm4GenePreset[\atk], 1, ~gcdDm4GenePreset[\rls]), timeScale: ~gcdDm4GenePreset[\sustain]);

	seq = Dseq(~gcdDm4GenePreset[\ser], inf);

	// envMod = XLine.kr(start, end, 100);

	envMod = LFTri.kr(Ndef.kr(\mod2), -1).exprange(~gcdDm4GenePreset[\start], ~gcdDm4GenePreset[\end]);

	src1 = TDuty.ar(seq * envMod * SampleDur.ir);
	src2 = PulseCount.ar(Impulse.ar(~gcdDm4GenePreset[\rate1])) % ~gcdDm4GenePreset[\mod2];
	src3 = PulseCount.ar(src1) % ~gcdDm4GenePreset[\mod3];

	sig = gcd(src2, src3 + [Ndef.kr(\mod1) * 0.5/*0*/, Ndef.kr(\mod2) * 2]);
	sig1 = gcd(lcm(src2 + [~gcdDm4GenePreset[\dev1], ~gcdDm4GenePreset[\dev2]], src3),sig);

	sig = SinOsc.ar((sig * Ndef.ar(\mod1))  + 443 + ~gcdDm4GenePreset[\add]) * 0.1;
	sig1 = SinOsc.ar((Ndef.ar(\mod2) * sig1) * ~gcdDm4GenePreset[\mul1] + ~gcdDm4GenePreset[\add1]) * 0.4;

	sig = (Limiter.ar(LPF.ar(HPF.ar(sig, 50) + sig1, 5000), 0.3) *
		env * ~gcdDm4GenePreset[\amp]);
	// OffsetOut.ar(out, sig);
});
)

Ndef(\gcdDm4Gene).play(2);

Ndef(\gcdDm4Gene).fadeTime_(20);

Ndef(\gcdDm4Gene).release(10);

