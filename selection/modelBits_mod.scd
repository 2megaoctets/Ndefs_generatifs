// sept23 ok + niveaux

Ndef(\mod1).fadeTime_(5);

(
~mod1Preset = ( 'modphase': 0.42452019487867, 'carfreq': 1.2535860538483, 'mulSlope': 0.058299063444138, 'modphaseSlope': 0.073567924499512, 'modfreqTo': 24.511067903042, 'mulTo': 0.95904877781868, 'modfreqSlope': 0.20608748197556, 'pmindex': 2.7849441599846, 'pmindexSlope': 0.1293374478817, 'carfreqSlope': 0.25615617036819, 'pmindexTo': 10.268060958385, 'modphaseTo': 1.4097495766797, 'mul': 0.84, 'modfreq': 4.4292234003544, 'carfreqTo': 918.15034991503 )
)

(
~mod1Preset = ( 'modphase': 0.29323338554752, 'carfreq': 81.1254114151, 'mulSlope': 0.048926523923874, 'modphaseSlope': 0.087207719087601, 'modfreqTo': 39.22200050354, 'mulTo': 0.8108024597168, 'modfreqSlope': 0.59559218883514, 'pmindex': 8.0641621637344, 'pmindexSlope': 0.027451459169388,  'carfreqSlope': 0.82722432613373, 'pmindexTo': 2.9833337426186, 'modphaseTo': 1.684930468379, 'mul': 0.84, 'modfreq': 2.0313854038715, 'carfreqTo': 1973.4282182455 );
)

(
~mod1Preset = ( 'modphase': 0.087266878718637, 'carfreq': 262.89206403494, 'mulSlope': 0.093853449821472, 'modphaseSlope': 0.040396648645401, 'modfreqTo': 30.883689069748, 'mulTo': 0.89851289987564, 'modfreqSlope': 0.82097284793854, 'pmindex': 7.2078354144096, 'pmindexSlope': 0.13108181595802, 'carfreqSlope': 0.18160084486008, 'pmindexTo': 15.054594004154, 'modphaseTo': 2.0049558166927, 'mul': 0.84, 'modfreq': 1.966198605299, 'carfreqTo': 1290.5497785807 );
)

(
~mod1Preset = ( 'modphase': 1.0656638685833, 'carfreq': 164.67572306395, 'mulSlope': 0.035908497571945, 'modphaseSlope': 0.081132934093475,  'modfreqTo': 18.610445821285, 'mulTo': 0.75320801138878, 'modfreqSlope': 0.52883297204971, 'pmindex': 0.83734379649162, 'pmindexSlope': 0.18432351946831,  'carfreqSlope': 0.4756959438324, 'pmindexTo': 9.2282877802849, 'modphaseTo': 1.5526123493619, 'mul': 0.84, 'modfreq': 0.2965084195137,   'carfreqTo': 754.22301733494 )
)


(
~mod1Preset = (carfreq: rrand(0.1, 302), carfreqTo: rrand(0.5,2000), carfreqSlope: rrand(0.1, 1), modfreq: rrand(0.05, 5), modfreqTo: rrand(0.1, 50), modfreqSlope: rrand(0.1,1), pmindex: rrand(0.01, 10), pmindexTo: rrand(0.1, 20), pmindexSlope: rrand(0.01, 0.3), modphase: rrand(0.0, pi), modphaseTo: rrand(0.01, pi), modphaseSlope: rrand(0.01, 0.1), mul: 0.84, mulTo: rrand(0.75, 1), mulSlope: rrand(0.01, 0.1));
)

(
Ndef(\mod1, {
	PMOsc.kr(
		carfreq: Phasor.kr(0.0, ~mod1Preset[\carfreqSlope], ~mod1Preset[\carfreq], ~mod1Preset[\carfreqTo], ~mod1Preset[\carfreqTo]),
		modfreq: Phasor.kr(0.0, ~mod1Preset[\modfreqSlope], ~mod1Preset[\modfreq], ~mod1Preset[\modfreqTo], ~mod1Preset[\modfreqTo] ) + (Ndef.kr(\mod2) * 2 + 2),
		pmindex: Phasor.kr(0.0, ~mod1Preset[\pmindexSlope], ~mod1Preset[\pmindex], ~mod1Preset[\pmindexTo], ~mod1Preset[\pmindexTo]),
		modphase: Phasor.kr(0.0, ~mod1Preset[\modphaseSlope], ~mod1Preset[\modphase], ~mod1Preset[\modphaseTo], ~mod1Preset[\modphaseTo]) % cos(Ndef.kr(\mod2) * 0.5 + 0.5),
		mul: Phasor.kr(0.0, ~mod1Preset[\mulSlope], ~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulTo])
	)
});
)

Ndef(\mod1).release(19);

Ndef(\mod2).fadeTime_(10);

Ndef(\mod2).release(19);

(
~mod2Preset = (freq: 0.2, freqTo: 1, freqSlope: 0.0105, iphase: 0, iphaseTo: 0.15, iphaseSlope: 0.13, width: 0.5, widthTo: 1, widthSlope: 0.175, mul: 0.85, mulTo: 1, mulSlope: 0.03 );
)

(
~mod2Preset = (freq: rrand(0.05, 20), freqTo: rrand(0.05, 20), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.0, 1), iphaseTo: rrand(0.01, 1), iphaseSlope: rrand(0.05, 0.1), width: rrand(0.15, 1), widthTo: rrand(0.15, 1), widthSlope: rrand(0.05, 0.1), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.01, 0.1));
)

(
Ndef(\mod2, {
	LFPulse.kr(
		freq: Phasor.kr(rate: ~mod2Preset[\freqSlope], start: ~mod2Preset[\freq], end: ~mod2Preset[\freqTo], resetPos: ~mod2Preset[\freqTo]) + (Ndef.kr(\mod1) * 2 + 2),
		iphase: Phasor.kr( rate: ~mod2Preset[\iphaseSlope], start: ~mod2Preset[\iphase], end: ~mod2Preset[\iphaseTo], resetPos: ~mod2Preset[\iphaseTo]) * cos(Ndef.kr(\mod1) * 0.5 + 0.5),
		width: Phasor.kr(rate: ~mod2Preset[\widthSlope], start: ~mod2Preset[\width], end: ~mod2Preset[\widthTo], resetPos: ~mod2Preset[\widthTo]),
		mul: Phasor.kr(rate: ~mod2Preset[\mulSlope], start: ~mod2Preset[\mul], end: ~mod2Preset[\mulTo], resetPos: ~mod2Preset[\mulTo])
	);
};)
)

Ndef(\modelBits).fadeTime_(28);

(
~modelBitsPreset = (amp: 0.061, atk: 0.001, rls: 0.2, sustain: 1, mod1: 1, mod2: 1, modulo: 256, greyHdiff: 0.707, greyHdelTmod: 1, greyHfb: 0.9, count1_1: 5, count1_2: 3, count1_3: 9, count1_4: 11);
// default
)

(
~modelBitsPreset = ( 'rls': 0.38701448440552, 'mod2': 0.94951220750809, 'atk': 0.099110740423203, 'mod1': 0.7352654337883, 'amp': 0.071, 'sustain': 1, greyHdiff: 0.707, greyHdelTmod: 1, modulo: 256, greyHfb: 0.9, count1_1: 9, count1_2: 7, count1_3: 6, count1_4: 13 )
)

(
~modelBitsPreset = ( 'rls': 0.43033952713013, 'mod2': 0.87577879428864, 'atk': 0.072004798531532, 'mod1': 0.81842906475067, 'amp': 0.1, 'sustain': 1, greyHdiff: 0.707, greyHdelTmod: 1, modulo: 256, greyHfb: 0.5, count1_1: 7, count1_2: 10, count1_3: 6, count1_4: 7 )
)

(
~modelBitsPreset = ( 'rls': 0.25742192268372, 'mod2': 0.83238798379898, 'atk': 0.031174141168594, 'mod1': 0.90378706455231, 'amp': 0.1, 'sustain': 1, greyHdiff: 0.707, greyHdelTmod: 1, modulo: 256, greyHfb: 0.6, count1_1: 11, count1_2: 13, count1_3: 5, count1_4: 10 )
)

(
~modelBitsPreset = ( 'mod1': 0.94616973400116, 'greyHdelTmod': 7, 'rls': 0.58663425445557, 'modulo': 336,'amp': 0.1, 'atk': 0.0094987841844559, 'greyHfb': 0.57891044616699, 'greyHdiff': 0.28223729133606, 'mod2': 0.92753443717957, 'sustain': 1, count1_1: 9, count1_2: 5, count1_3: 7, count1_4: 13 );
)

(
~modelBitsPreset = ( 'rls': 0.950352067947388, 'mod2': 0.7035672664642, 'atk': 0.00130132615804672, 'mod1': 0.52691388130188, 'amp': 0.1, 'sustain': 1, greyHdiff: 0.707, greyHdelTmod: 1, modulo: 256, greyHfb: 0.3, count1_1: 5, count1_2: 3, count1_3: 3, count1_4: 10)
)

(
~modelBitsPreset = ( 'atk': 0.044991653561592, 'amp': 0.1, 'sustain': 1, 'greyHdiff': 0.098990321159363,
  'rls': 0.40922675132751, 'mod1': 0.51226669549942, 'mod2': 0.96985554695129, 'greyHdelTmod': 7, modulo: 128, greyHfb: 0.7, count1_1: 7, count1_2: 9, count1_3: 5, count1_4: 13 )
)

(
~modelBitsPreset = ( 'mod1': 0.79845929145813, 'greyHdelTmod': 10, 'rls': 0.5018340587616, 'modulo': 480, 'amp': 0.1, 'atk': 0.051176509976387, 'greyHfb': 0.80907030105591, 'greyHdiff': 0.04518449306488, 'mod2': 0.86885106563568, 'sustain': 1, count1_1: 9, count1_2: 13, count1_3: 15, count1_4: 7) ;
)

(
~modelBitsPreset = (amp: 0.1, atk: rrand(0.001, 0.1), rls: rrand(0.2, 0.6), sustain: 1, mod1: rrand(0.5, 1), mod2: rrand(0.7, 1), greyHdiff: rrand(0.0, 1), greyHdelTmod: rrand(1, 10), modulo: (rrand(1, 16) * 16), greyHfb: rrand(0.1, 0.9), count1_1: rrand(1, 4) * 2 + 1, count1_2: rrand(1, 4) * 2 + 1, count1_3: rrand(1, 7) * 2 + 1, count1_4: rrand(1, 5) * 2 + 1);
// rrand
)

(
// need this: s.options.memSize_(16384*10);
Ndef(\modelBits, {
	var sig, sig1, sig2, count1, count2, env;

	env = EnvGen.kr(Env.asr(~modelBitsPreset[\atk], 1, ~modelBitsPreset[\rls]), timeScale: ~modelBitsPreset[\sustain]);

	count1 = PulseCount.ar(Impulse.ar(8e3 * ~modelBitsPreset[\mod1]));
	count2 = PulseCount.ar(Impulse.ar(7009 * ~modelBitsPreset[\mod2]));

	sig1 = HPF.ar(
		(
			((count1 * 15) & (count1 >> ~modelBitsPreset[\count1_1])) |
			((count1 * 5) & (count1 >> [~modelBitsPreset[\count1_2], ~modelBitsPreset[\count1_2] + 2])) |
			((count1 * 2) & (count1 >> ~modelBitsPreset[\count1_3] + (Ndef.kr(\mod1) * 0.5 + 0.5))) |
			((count1 * 8) & (count1 >> ~modelBitsPreset[\count1_4] / (Ndef.kr(\mod2) * 0.5 + 0.5))) |
			(((count1 * count1) & count1) | (count1 >> 3))
			- 3 % max(1, ~modelBitsPreset[\modulo])
		) / 127-1 * 3
		, 20
	) * 0.1;

	sig2 = LPF.ar(HPF.ar(gcd(count1 * count2, count2 + count1),
		WhiteNoise.ar()*2000 + 1000), 20);
	sig2 = sig2 * sig1;
	sig = Splay.ar(
		Limiter.ar(
			Greyhole.ar(
				sig1 + sig2, // in
				sig1 *  ~modelBitsPreset[\greyHdelTmod], // deltime
				SinOsc.kr(
					(Ndef.kr(\mod1) + Ndef.kr(\mod2) * 0.5 + 0.5), Ndef.kr(\mod3), 0.5, 0.5) , // damp // 0.5,
				SinOsc.kr(
					~modelBitsPreset[\greyHdiff],
					Phasor.kr(0.0, 0.1, (Ndef.kr(\mod1) * 0.5 + 0.5), 1, 1)), // diff
				SinOsc.kr(Phasor.kr(start: Ndef.kr(\mod3) * 0.5 + 0.5, end: ~modelBitsPreset[\greyHfb], rate: 0.1, resetPos: ~modelBitsPreset[\greyHfb]), cos(Ndef.kr(\mod2)), 0.25, 0.25) // fb
			),
			0.5
		).flatten
	);
	sig = (sig * env * ~modelBitsPreset[\amp] * 0.84);
});
)

Ndef(\modelBits).play(2);

Ndef(\modelBits).release(20);