// nettoie, fais des ndefs

Ndef(\modelBits).fadeTime_(18);

Ndef(\mod1).fadeTime_(5);

(
~mod1Preset = (carfreq: rrand(0.1, 2), modfreq: rrand(0.05, 5), pmindex: rrand(0.01, 10), modphase: rrand(0.0, pi), mul: 0.84)
)

(
Ndef(\mod1, {
	PMOsc.kr(
		carfreq: ~mod1Preset[\carfreq] * (Ndef.kr(\mod2) * 0.5 + 0.5), // Line.kr(0.05, 0.5, 20),
		modfreq: Phasor.kr(0.0, 0.1, 1 / ~mod1Preset[\modfreq], ~mod1Preset[\modfreq], ~mod1Preset[\modfreq]) + (Ndef.kr(\mod2) * 2 + 2), // Line.kr(5, 0.5, 40),
		pmindex: ~mod1Preset[\pmindex] * cos(Ndef.kr(\mod2) * 0.5 + 0.5), //Line.kr(5, 0.1, 35)
		modphase: Phasor.kr(0.0, 0.1, 1 / ~mod1Preset[\modphase], ~mod1Preset[\modphase], ~mod1Preset[\modphase]) % cos(Ndef.kr(\mod2) * 0.5 + 0.5),
		mul: ~mod1Preset[\mul]
	)
});
)

Ndef(\mod2).fadeTime_(10);

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

(
~modelBitsPreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, mod1: 1, mod2: 1, modulo: 256, greyHdiff: 0.707, greyHdelTmod: 1, greyHfb: 0.9, count1_1: 5, count1_2: 3, count1_3: 9, count1_4: 11);
// default
)

(
~modelBitsPreset = ( 'rls': 0.38701448440552, 'mod2': 0.94951220750809, 'atk': 0.099110740423203, 'mod1': 0.7352654337883, 'amp': 0.1, 'sustain': 1, greyHdiff: 0.707, greyHdelTmod: 1, modulo: 256, greyHfb: 0.9, count1_1: 9, count1_2: 7, count1_3: 6, count1_4: 13 )
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
	sig = (sig * env * ~modelBitsPreset[\amp]);
});
)


Ndef(\modelBits).play(2);

Ndef(\modelBits).release(10);

