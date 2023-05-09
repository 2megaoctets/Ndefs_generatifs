// garde. mets des mods

(
~mod2Preset = (freq: 20, freqTo: 5, freqSlope: 5, leak: 0.8, leakTo: 0.5, leakSlope: 3, mul: 1, mulTo: 0.5, mulSlope: 3);
)

(
~mod2Preset =  ('mul': 0.95759457349777, 'freqSlope': 0.93240706920624, 'leakTo': 0.81137719869614, 'leakSlope': 8.7292069137096,
  'freqTo': 4.6957138299942, 'leak': 0.5970153927803, 'freq': 17.340962982178, 'mulTo': 0.550805747509, 'mulSlope': 7.5934833168983 );
)

(
~mod2Preset = (freq: rrand(0.8, 20), freqTo: rrand(0.1, 5), freqSlope: rrand(0.2, 50), leak: rrand(0.1, 0.99), leakTo: rrand(0.05, 0.99), leakSlope: rrand(0.15, 30), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.3, 35));
)

(
Ndef(\mod2, {
	BlitB3Saw.ar(
		XLine.kr(~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqSlope]),
		Line.kr(~mod2Preset[\leak], ~mod2Preset[\leakTo], ~mod2Preset[\leakSlope]),
		Line.kr(~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulSlope])
	)
});
)

(
~mod1Preset = (freq: 1, iphase: 0, width: 0.5, mul: 0.5, freqSlope: 10, iphaseSlope: 15, widthSlope: 25, mulSlope: 20);
)

(
~mod1Preset = ( 'iphaseTo': 8.3419742213685, 'mulTo': 0.81562268733978, 'freqTo': 14.504139184952, 'width': 0.38067249655724, 'widthTo': 0.68863829612732, 'freq': 5.496244263649, 'mulSlope': 17.866684317589, 'iphase': 4.6597714919237, 'iphaseSlope': 4.9592549204826, 'widthSlope': 18.438110589981, 'mul': 0.66979828476906, 'freqSlope': 17.493041753769 );
)

(
~mod1Preset = ( 'iphaseTo': 2.1674633980361, 'mulTo': 0.55841684341431, 'freqTo': 11.103559017181, 'width': 0.3012835085392, 'widthTo': 0.23882005691528, 'freq': 9.706468808651, 'mulSlope': 5.8013877868652, 'iphase': 4.5316803510649, 'iphaseSlope': 13.869203388691, 'widthSlope': 8.9284726381302, 'mul': 0.71289083361626, 'freqSlope': 7.4497419595718 );
)


(
~mod1Preset = (freq: rrand(0.1, 10), freqTo: rrand(1.0, 15), iphase: rrand(0.0, pi*2), iphaseTo: rrand(0.1, 4*pi), width: rrand(0.1, 0.95), widthTo: rrand(0.15, 0.99), mul: rrand(0.5, 0.75), mulTo: rrand(0.5, 1), freqSlope: rrand(2.5, 20), iphaseSlope: rrand(3.5, 15), widthSlope: rrand(2.0, 25), mulSlope: rrand(1.0, 20));
)

(
Ndef(\mod1, {
	Pulse.kr(
		XLine.kr(~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqSlope]),
		Line.kr(~mod1Preset[\iphase], ~mod1Preset[\iphaseTo], ~mod1Preset[\iphaseSlope]),
		Line.kr(~mod1Preset[\width], ~mod1Preset[\widthTo], ~mod1Preset[\widthSlope]),
		Line.kr(~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulSlope])
	)
});
)


(
~lcm2Preset = (amp: 0.06, atk: 0.001, rls: 0.2, sustain: 1, mod1: 3.09431, mod2: 54.0487);
// default
)

(
~lcm2Preset = ( 'rls': 0.35175914764404, 'mod2': 52.63974693085, 'atk': 0.046337085008621, 'mod1': 3.004041007688, 'amp': 0.06, 'sustain': 1 )
)

(
~lcm2Preset = ( 'rls': 0.45175914764404, 'mod2': 32.63974693085, 'atk': 0.0146337085008621, 'mod1': 2.004041007688, 'amp': 0.06, 'sustain': 1 )
)

(
~lcm2Preset = ( 'rls': 0.25828251838684, 'mod2': 35.203470209682, 'atk': 0.0180271938562393, 'mod1': 2.3404990996182, 'amp': 0.06, 'sustain': 1 )
)

(
~lcm2Preset = (amp: 0.06, atk: rrand(0.001, 1.31), rls: rrand(0.92, 3.6), sustain: 1, mod1: rrand(1.4, 4.09431), mod2: rrand(20, 54.0487));
// rrand
)

(
Ndef(\lcm2, {
	// amp = 0.1, atk = 0.001, rls = 0.2, sustain = 1, mod1 = 3.09431, mod2 = 54.0487;
	var sig, sig1, sig2, env;

	env = EnvGen.kr(Env.asr(~lcm2Preset[\atk], 1, ~lcm2Preset[\rls]), timeScale: ~lcm2Preset[\sustain]);

	~lcm2Preset[\mod1] = ~lcm2Preset[\mod1].min(1000).max(1);
	~lcm2Preset[\mod2] = ~lcm2Preset[\mod2].min(1000).max(1);

	sig1 =  (Saw.ar(~lcm2Preset[\mod1]) + Ndef.ar(\mod1)).range(-100,100).round(1);
	sig2 = (Ndef.kr(\mod2) + LFCub.ar(~lcm2Preset[\mod2])).range(-100,100).round(1);

	sig = tanh(lcm(sig1, sig2) * 0.001);

	sig = sig * env;
	sig = Pan2.ar(sig * ~lcm2Preset[\amp]);
	// OffsetOut.ar(out, sig);
});
)

Ndef(\mod1).fadeTime_(14);

Ndef(\mod2).fadeTime_(15);

Ndef(\lcm2).fadeTime_(19);

Ndef(\lcm2).play(2);

Ndef(\lcm2).release(10);