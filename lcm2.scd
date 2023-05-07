// garde. mets des mods
(
~lcm2Preset = (amp: 0.031, atk: 0.001, rls: 0.2, sustain: 1, mod1: 3.09431, mod2: 54.0487);
// default
)

(
~lcm2Preset = ( 'rls': 0.35175914764404, 'mod2': 52.63974693085, 'atk': 0.046337085008621, 'mod1': 3.004041007688, 'amp': 0.031, 'sustain': 1 )
)

(
~lcm2Preset = ( 'rls': 0.45175914764404, 'mod2': 32.63974693085, 'atk': 0.0146337085008621, 'mod1': 2.004041007688, 'amp': 0.031, 'sustain': 1 )
)

(
~lcm2Preset = ( 'rls': 0.25828251838684, 'mod2': 35.203470209682, 'atk': 0.0180271938562393, 'mod1': 2.3404990996182, 'amp': 0.031, 'sustain': 1 )
)

(
~lcm2Preset = (amp: 0.031, atk: rrand(0.001, 0.31), rls: rrand(0.92, 3.6), sustain: 1, mod1: rrand(1.4, 4.09431), mod2: rrand(20, 54.0487));
// rrand
)

(
mod1Preset = ();
)


(
Ndef(\lcm2, {
	// amp = 0.1, atk = 0.001, rls = 0.2, sustain = 1, mod1 = 3.09431, mod2 = 54.0487;
	var sig, sig1, sig2, env;

	env = EnvGen.kr(Env.asr(~lcm2Preset[\atk], 1, ~lcm2Preset[\rls]), timeScale: ~lcm2Preset[\sustain]);

	~lcm2Preset[\mod1] = ~lcm2Preset[\mod1].min(1000).max(1);
	~lcm2Preset[\mod2] = ~lcm2Preset[\mod2].min(1000).max(1);

	sig1 = Saw.ar(~lcm2Preset[\mod1]).range(-100,100).round(1);
	sig2 = LFCub.ar(~lcm2Preset[\mod2]).range(-100,100).round(1);

	sig = tanh(lcm(sig1, sig2) * 0.001);

	sig = sig * env;
	sig = Pan2.ar(sig * ~lcm2Preset[\amp]);
	// OffsetOut.ar(out, sig);
});
)

Ndef(\lcm2).fadeTime_(19);

Ndef(\lcm2).play(2);

Ndef(\lcm2).release(10);