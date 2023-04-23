
(
~gcdDm4GenePreset = ( 'atk': 0.042787989258766, 'mul1': 46, 'dev1': 0.087901091575623, 'mod2': 129,  'add1': 59, 'amp': 0.1, 'mod3': 99, 'end': 0.38251852989197, 'rate1': 8.4022823572159,   'dev2': 1.254590690136, 'add': 271, 'start': 68, 'rls': 0.45941503047943,  'sustain': 1 ) ;
)


(
~gcdDm4GenePreset = ( 'atk': 0.094803431391716, 'mul1': 49, 'dev1': 0.095498728752136, 'mod2': 216, 'add1': 43, 'amp': 0.1, 'mod3': 91, 'end': 0.38516335487366, 'rate1': 9.1425079107285, 'dev2': 1.0559352040291, 'add': 157, 'start': 58, 'rls': 0.40772210359573, 'sustain': 1 );
)


(
~gcdDm4GenePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, start: 100, end: 0.1, rate1: 10, mod2: 300, mod3: 101, dev1: 0, dev2: 2, add: 600, add1: 61, mul1: 43, ser: [ 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77 ]);
// default
)

(
~gcdDm4GenePreset = ( 'atk': 0.065175143361092, 'mul1': 36, 'dev1': 0.095331811904907, 'mod2': 228, 'add1': 43, 'amp': 0.1, 'mod3': 86, 'end': 0.41456122398376, 'rate1': 7.0137279629707, 'dev2': 0.86043810844421, 'add': 346, 'start': 93, 'rls': 0.26504782438278, 'sustain': 1 );
)

(
~gcdDm4GenePreset = ( 'atk': 0.096913956522942, 'mul1': 46, 'dev1': 0.030357098579407, 'mod2': 181, 'add1': 23, 'amp': 0.1, 'mod3': 90, 'end': 0.32150664329529, 'rate1': 8.1436048746109, 'dev2': 0.61037647724152, 'add': 202, 'start': 100, 'rls': 0.35190583467484, 'sustain': 1 );
)

(
~gcdDm4GenePreset = ( 'atk': 0.021186853289604, 'mul1': 35, 'dev1': 0.040206956863403, 'ser': [ 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225 ], 'mod2': 283, 'add1': 59, 'amp': 0.1, 'mod3': 84, 'end': 0.10816841125488,  'rate1': 8.3926626443863, 'dev2': 1.3263306617737, 'add': 436, 'start': 72, 'rls': 0.25731151103973, 'sustain': 1 )
)

(
~gcdDm4GenePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, serSize: 99, start: 10, end: 0.01, rate1: 1, mod2: 500, mod3: 501, dev1: 1, dev2: 3, add: 400, add1: 61, mul1: 53, ser: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99] );
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

	envMod = LFTri.kr(0.005, -1).exprange(~gcdDm4GenePreset[\start], ~gcdDm4GenePreset[\end]);

	src1 = TDuty.ar(seq * envMod * SampleDur.ir);
	src2 = PulseCount.ar(Impulse.ar(~gcdDm4GenePreset[\rate1])) % ~gcdDm4GenePreset[\mod2];
	src3 = PulseCount.ar(src1) % ~gcdDm4GenePreset[\mod3];

	sig = gcd(src2, src3 + [0, 2]);
	sig1 = gcd(lcm(src2 + [~gcdDm4GenePreset[\dev1], ~gcdDm4GenePreset[\dev2]], src3),sig);

	sig = SinOsc.ar(sig * 443 + ~gcdDm4GenePreset[\add]) * 0.1;
	sig1 = SinOsc.ar(sig1 * ~gcdDm4GenePreset[\mul1] + ~gcdDm4GenePreset[\add1]) * 0.4;

	sig = (Limiter.ar(LPF.ar(HPF.ar(sig, 50) + sig1, 5000), 0.3) *
		env * ~gcdDm4GenePreset[\amp]);
	// OffsetOut.ar(out, sig);
});
)

Ndef(\gcdDm4Gene).play(2);

Ndef(\gcdDm4Gene).fadeTime_(20);

Ndef(\gcdDm4Gene).release(10);

