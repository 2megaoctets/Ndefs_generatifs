// sept23 ok + niveaux

Ndef(\gcdDm4GeneMod1).fadeTime_(15);

(
~mod1Preset = (freq: 2 , freqTo: 30.5, freqSlope: 2.025, iphase: 0.0, iphaseTo: pi, iphaseSlope: 0.0325, mul: 1.0, mulTo: 0.75, mulSlope: 0.175);
)

(
~mod1Preset = ( 'mul': 0.85264760255814, 'freqSlope': 0.054299376010895, 'freqTo': 2.251199054718, 'iphase': 2.2211053110029,  'iphaseTo': 2.6993515351464, 'freq': 0.15809592723846, 'iphaseSlope': 0.1922795958519, 'mulTo': 0.99470412731171, 'mulSlope': 0.016504989862442 )
)

(
~mod1Preset = (freq: rrand(1.12, 2000) , freqTo: rrand(0.05, 2500), freqSlope: rrand(1.015, 20.10), iphase: rrand(0.0, pi), iphaseTo: rrand(0.0, pi), iphaseSlope: rrand(0.013, 0.25), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.01, 0.175));
)

(
Ndef(\gcdDm4GeneMod1, {
	FSinOsc.kr(
		freq: Phasor.kr(start: ~mod1Preset[\freq], end: ~mod1Preset[\freqTo] , rate: ~mod1Preset[\freqSlope], resetPos: ~mod1Preset[\freqTo]) + (Ndef.kr(\mod2) * 0.5 + 0.5),
		iphase: Phasor.kr(start: ~mod1Preset[\iphase], end: ~mod1Preset[\iphaseTo], rate: ~mod1Preset[\iphaseSlope], resetPos: ~mod1Preset[\iphaseTo])  * (Ndef.kr(\mod2) * 0.5 + 0.5),
		mul: Phasor.kr(start: ~mod1Preset[\mul], end: ~mod1Preset[\mulTo], rate: ~mod1Preset[\mulSlope], resetPos: ~mod1Preset[\mulTo])
	)
})
)

Ndef(\gcdDm4GeneMod2).fadeTime_(12);

(
~mod2Preset = (carfreq: 1, carfreqTo: 20.5, carfreqSlope: 1.05, modfreq: 49.3, modfreqTo: 20, modfreqSlope: 0.075, pmindex: 10.5, pmindexTo: 34.127, pmindexSlope: 0.10, modphase: 1.0, modphaseTo: 40.1, modphaseSlope: 0.06, mul: 0.5, mulTo: 0.75, mulSlope: 0.16);
)

(
~mod2Preset = ( 'modphase': 2.691894351199, 'carfreq': 11.1959195256233, 'mulSlope': 0.078830008506775, 'modphaseSlope': 0.021869955062866, 'modfreqTo': 100.0483026504517, 'mulTo': 0.69766128063202, 'modfreqSlope': 0.062545585632324, 'pmindex': 103.9818071722984, 'pmindexSlope': 0.069270105361938, 'carfreqSlope': 0.092200808167458, 'pmindexTo': 2.8081195831299, 'modphaseTo': 5.1953068051991, 'mul': 0.53513604402542, 'modfreq': 1.6251531124115,  'carfreqTo': 2.1601283431053 )
)

(
~mod2Preset = ( 'modphase': 0.73222340847832, 'carfreq': 1235.3039295435, 'mulSlope': 0.074560689926147, 'modphaseSlope': 0.097627682685852,
  'modfreqTo': 284.72100538015, 'mulTo': 0.66737622022629, 'modfreqSlope': 0.054868739843369, 'pmindex': 224.67579239607, 'pmindexSlope': 0.029954357147217,
  'carfreqSlope': 0.054518942713737, 'pmindexTo': 78.765820503235, 'modphaseTo': 2.9826526197966, 'mul': 0.61252856254578, 'modfreq': 3.6481505155563,
  'carfreqTo': 875.25357041359 );
)

(
~mod2Preset = (carfreq: rrand(0.1, 2100), carfreqTo: rrand(0.1, 3500), carfreqSlope: rrand(90.05, 0.127), modfreq: rrand(0.2, 540), modfreqTo: rrand(0.1, 824), modfreqSlope: rrand(0.05, 0.10), pmindex: rrand(0.5, 350), pmindexTo: rrand(0.4, 350), pmindexSlope: rrand(0.02, 0.10), modphase: rrand(0.0, pi), modphaseTo: rrand(0, pi*2), modphaseSlope: rrand(0.01, 0.10), mul: rrand(0.25, 0.75), mulTo: rrand(0.5, 0.75), mulSlope: rrand(0.06, 0.10));
)

(
Ndef(\gcdDm4GeneMod2, {
	PMOsc.kr(
		carfreq:  Phasor.kr(start: ~mod2Preset[\carfreq], end: ~mod2Preset[\carfreqTo], rate: ~mod2Preset[\carfreqSlope], resetPos: ~mod2Preset[\carfreqTo]),
		modfreq:  Phasor.kr(start: ~mod2Preset[\modfreq], end: ~mod2Preset[\modfreqTo], rate: ~mod2Preset[\modfreqSlope], resetPos: ~mod2Preset[\modfreqTo])  % cos(Ndef.kr(\mod1) * 0.5 + 0.5),
		pmindex:  Phasor.kr(start: ~mod2Preset[\pmindex], end: ~mod2Preset[\pmindexTo], rate: ~mod2Preset[\pmindexSlope], resetPos: ~mod2Preset[\pmindexTo]),
		modphase: Phasor.kr(start: ~mod2Preset[\modphase], end: ~mod2Preset[\modphaseTo], rate: ~mod2Preset[\modphaseSlope], resetPos: ~mod2Preset[\modphaseTo]),
		mul: Phasor.kr(start: ~mod2Preset[\mul], end: ~mod2Preset[\mulTo], rate: ~mod2Preset[\mulSlope], resetPos: ~mod2Preset[\mulTo])
	)
})
)

Ndef(\gcdDm4GeneMod2).release(10);

Ndef(\gcdDm4Gene).fadeTime_(3);

(
~gcdDm4GenePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, start: 100, end: 0.1, rate1: 10, mod2: 300, mod3: 101, dev1: 0, dev2: 2, add: 600, add1: 61, mul1: 43, ser: [ 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77 ]);
// default
)


(
~gcdDm4GenePreset = ( 'atk': 0.042787989258766, 'mul1': 46, 'dev1': 0.087901091575623, 'mod2': 129,  'add1': 59, 'amp': 0.1, 'mod3': 99, 'end': 0.38251852989197, 'rate1': 8.4022823572159,   'dev2': 1.254590690136, 'add': 271, 'start': 68, 'rls': 0.45941503047943,  'sustain': 1, 'ser': [ 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184 ]) ;
)


(
~gcdDm4GenePreset = ( 'atk': 0.094803431391716, 'mul1': 49, 'dev1': 0.095498728752136, 'mod2': 216, 'add1': 43, 'amp': 0.061, 'mod3': 91, 'end': 0.38516335487366, 'rate1': 9.1425079107285, 'dev2': 1.0559352040291, 'add': 157, 'start': 58, 'rls': 0.40772210359573, 'sustain': 1, 'ser': [ 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299 ] / rrand(7.5,15) );
)



(
~gcdDm4GenePreset = ( 'atk': 0.065175143361092, 'mul1': 36, 'dev1': 0.095331811904907, 'mod2': 228, 'add1': 43, 'amp': 0.1, 'mod3': 86, 'end': 0.41456122398376, 'rate1': 7.0137279629707, 'dev2': 0.86043810844421, 'add': 346, 'start': 93, 'rls': 0.26504782438278, 'sustain': 1,  'ser': [ 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295 ] / rrand(5.5,10));
)

(
~gcdDm4GenePreset = ( 'atk': 0.096913956522942, 'mul1': 46, 'dev1': 0.030357098579407, 'mod2': 181, 'add1': 23, 'amp': 0.1, 'mod3': 90, 'end': 0.32150664329529, 'rate1': 8.1436048746109, 'dev2': 0.61037647724152, 'add': 202, 'start': 100, 'rls': 0.35190583467484, 'sustain': 1, 'ser': [ 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349 ] / rrand(13.5,25) );
)

(
~gcdDm4GenePreset = ( 'atk': 0.021186853289604, 'mul1': 35, 'dev1': 0.040206956863403, 'ser': [ 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225 ] / rrand(6.0,12), 'mod2': 283, 'add1': 59, 'amp': 0.1, 'mod3': 84, 'end': 0.10816841125488,  'rate1': 8.3926626443863, 'dev2': 1.3263306617737, 'add': 436, 'start': 72, 'rls': 0.25731151103973, 'sustain': 1 )
)

(
~gcdDm4GenePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, serSize: 99, start: 10, end: 0.01, rate1: 1, mod2: 500, mod3: 501, dev1: 1, dev2: 3, add: 400, add1: 61, mul1: 53, 'ser': [ 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343 ] / rrand(10.0,23) );
)

(
Post << ~gcdDm4GenePreset = (amp: 0.1, atk: rrand(0.001, 0.1), rls: rrand(0.2, 0.5), sustain: 1, start: rrand(40, 100), end: rrand(0.1, 0.5), rate1: rrand(6.5, 10), mod2: rrand(30,300), mod3: rrand(80,101), dev1: rrand(0, 0.1), dev2: rrand(0.5,2), add: rrand(100,600), add1: rrand(20,61), mul1: rrand(30,53), ser: Array.series(rrand(3, 460), rrand(10, 35), 1));
// rrand
)

(
Ndef(\gcdDm4Gene, {
	var seq, envMod, src1, src2, src3, sig, sig1, env;

	env = EnvGen.kr(Env.asr(~gcdDm4GenePreset[\atk], 1, ~gcdDm4GenePreset[\rls]), timeScale: ~gcdDm4GenePreset[\sustain]);

	seq = Dseq(~gcdDm4GenePreset[\ser], inf);

	// envMod = XLine.kr(start, end, 100);

	envMod = LFTri.kr(Ndef.kr(\gcdDm4GeneMod2), -1).exprange(~gcdDm4GenePreset[\start], ~gcdDm4GenePreset[\end]);

	src1 = TDuty.ar(seq * envMod * SampleDur.ir);
	src2 = PulseCount.ar(Impulse.ar(~gcdDm4GenePreset[\rate1])) % ~gcdDm4GenePreset[\gcdDm4GeneMod2];
	src3 = PulseCount.ar(src1) % ~gcdDm4GenePreset[\gcdDm4GeneMod3];

	sig = gcd(src2 % (Ndef.kr(\gcdDm4GeneMod1) * 0.5 + 0.5), src3 % (Ndef.kr(\gcdDm4GeneMod2) * 0.5 + 0.5));
	sig1 = gcd(lcm(src2 + [~gcdDm4GenePreset[\dev1], ~gcdDm4GenePreset[\dev2]], src3),sig);

	sig = SinOsc.ar((sig), 0, 1, ~gcdDm4GenePreset[\add]) * 0.1;
	sig1 = SinOsc.ar((/*(Ndef.ar(\mod2) * 0.5 + 0.5) **/ sig1) * ~gcdDm4GenePreset[\mul1] + ~gcdDm4GenePreset[\add1]) * 0.4;

	sig = (Limiter.ar(LPF.ar(HPF.ar(sig, 50) + sig1, 3000), 0.3) *
		env * ~gcdDm4GenePreset[\amp] * 0.7);
	// OffsetOut.ar(out, sig);
});
)

Ndef(\gcdDm4Gene).play(2);

Ndef(\gcdDm4Gene).release(12);

Ndef(\gcdDm4Gene).clear;
