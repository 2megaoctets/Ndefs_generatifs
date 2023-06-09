(
~ulysse42Preset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, mod1: 0.2, mod2: 0.71) // default
)

(
~ulysse42Preset = (amp: 0.1, atk: rrand(0.0005, 0.01), rls: rrand(0.12, 0.32), sustain: 1, mod1: rrand(0.05, 0.82), mod2: rrand(0.0, 1.0))
)

(
~ulysse42Preset = ( 'rls': 0.30146820068359, 'mod2': 0.098270654678345, 'atk': 0.0054233431816101, 'mod1': 0.7239332151413,
  'amp': 0.1, 'sustain': 1 ) // long gate
)

(
Ndef(\ulysse42, {
	var mod1, sig, sig1, sig2, sig3, z1, z2, sinFrq, env;

	env = EnvGen.kr(Env.asr(~ulysse42Preset[\atk], 1, ~ulysse42Preset[\rls]), timeScale: ~ulysse42Preset[\sustain]);

	mod1 = ~ulysse42Preset[\mod1].linlin(0, 1, -10, 10);
	sig1 =  LFSaw.kr(0.062).range(-10, 10);
	sig1 =  sig1 + (~ulysse42Preset[\mod2].linlin(0, 1, 0, 5) * (0..8));
	sig2 = sig1.frac;
	sig3 = 0.8 - sig2.moddif(0.5, 1);

	z1 = gcd(sig1, mod1) +  sig2;
	z2 = lcm(sig1, mod1) + sig2;
	// sinFrq = 120 * ([z1, z2].flop.abs + 1);
	sinFrq = 132 * ([z1, z2].flop.abs + 1);


	sig = (SinOsc.ar(sinFrq) * AmpComp.kr(sinFrq) * sig3).mean;
	sig * env * ~ulysse42Preset[\amp];
})
);


Ndef(\ulysse42).play(2);

Ndef(\ulysse42).release(10);

Ndef(\ulysse42).fadeTime_(28);