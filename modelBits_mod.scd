// nettoie, fais des ndefs

(
~modelBitsPreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, mod1: 1, mod2: 1, modulo: 256, greyHdiff: 0.707, greyHdelTmod: 1, greyHfb: 0.9);
// default
)

(
~modelBitsPreset = ( 'rls': 0.38701448440552, 'mod2': 0.94951220750809, 'atk': 0.099110740423203, 'mod1': 0.7352654337883, 'amp': 0.1, 'sustain': 1, greyHdiff: 0.707, greyHdelTmod: 1, modulo: 256, greyHfb: 0.9 )
)

(
~modelBitsPreset = ( 'rls': 0.43033952713013, 'mod2': 0.87577879428864, 'atk': 0.072004798531532, 'mod1': 0.81842906475067, 'amp': 0.1, 'sustain': 1, greyHdiff: 0.707, greyHdelTmod: 1, modulo: 256, greyHfb: 0.5 )
)

(
~modelBitsPreset = ( 'rls': 0.25742192268372, 'mod2': 0.83238798379898, 'atk': 0.031174141168594, 'mod1': 0.90378706455231, 'amp': 0.1, 'sustain': 1, greyHdiff: 0.707, greyHdelTmod: 1, modulo: 256, greyHfb: 0.6 )
)

(
~modelBitsPreset = ( 'mod1': 0.94616973400116, 'greyHdelTmod': 7, 'rls': 0.58663425445557, 'modulo': 336,
  'amp': 0.1, 'atk': 0.0094987841844559, 'greyHfb': 0.57891044616699, 'greyHdiff': 0.28223729133606, 'mod2': 0.92753443717957,
  'sustain': 1 );
)

(
~modelBitsPreset = ( 'rls': 0.950352067947388, 'mod2': 0.7035672664642, 'atk': 0.00130132615804672, 'mod1': 0.52691388130188, 'amp': 0.1, 'sustain': 1, greyHdiff: 0.707, greyHdelTmod: 1, modulo: 256, greyHfb: 0.3)
)

(
~modelBitsPreset = ( 'atk': 0.044991653561592, 'amp': 0.1, 'sustain': 1, 'greyHdiff': 0.098990321159363,
  'rls': 0.40922675132751, 'mod1': 0.51226669549942, 'mod2': 0.96985554695129, 'greyHdelTmod': 7, modulo: 256, greyHfb: 0.7 )
)

(
~modelBitsPreset = ( 'mod1': 0.79845929145813, 'greyHdelTmod': 10, 'rls': 0.5018340587616, 'modulo': 480, 'amp': 0.1, 'atk': 0.051176509976387, 'greyHfb': 0.80907030105591, 'greyHdiff': 0.04518449306488, 'mod2': 0.86885106563568, 'sustain': 1 ) ;
)

(
~modelBitsPreset = (amp: 0.1, atk: rrand(0.001, 0.1), rls: rrand(0.2, 0.6), sustain: 1, mod1: rrand(0.5, 1), mod2: rrand(0.7, 1), greyHdiff: rrand(0.0, 1), greyHdelTmod: rrand(1, 10), modulo: (rrand(1, 32) * 16), greyHfb: rrand(0.1, 0.9));
// rrand
)

~pmModPreset = (carfreq: rrand(0.1, 2), modfreq: rrand(0.05, 5), pmindex: rrand(0.01, 10), modphase: rrand(0.0, pi), mul: 0.4)

(
Ndef(\PMMod, {
	PMOsc.kr(
		carfreq: ~pmModPreset[\carfreq], // Line.kr(0.05, 0.5, 20),
		modfreq: ~pmModPreset[\modfreq], // Line.kr(5, 0.5, 40),
		pmindex: ~pmModPreset[\pmindex], //Line.kr(5, 0.1, 35)
	)
});
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
			// changer les valeurs après le &
			((count1 * 15) & (count1 >> 5)) |
			((count1 * 5) & (count1 >> [3, 4])) |
			((count1 * 2) & (count1 >> 9)) |
			((count1 * 8) & (count1 >> 11)) |
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
					// ! ndefs. séparer les mods du graphe
					Ndef.kr(\PMMod), 0, 0.6) , // damp // 0.5,
				SinOsc.kr(
					~modelBitsPreset[\greyHdiff],
					Line.kr(pi, (pi / 2), 50)), // diff
				SinOsc.kr(Line.kr(0, ~modelBitsPreset[\greyHfb], 25)) // fb
			),
			0.5
		).flatten
	);
	sig = (sig * env * ~modelBitsPreset[\amp]);
});
)

Ndef(\modelBits).fadeTime_(18);

Ndef(\PMMod).fadeTime_(5);

Ndef(\modelBits).play(2);

Ndef(\modelBits).release(10);

