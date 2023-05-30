(Ndef(\mod1).fadeTime_(9);)

(
~mod1Preset = (carfreq: 0.5, carfreqTo: 1.5, carfreqSlope: 0.1, modfreq: 5.5, modfreqTo: 0.1, modfreqSlope: 0.1, pmindex: 5, pmindexTo: 0.25, pmindexSlope: 0.1, modphase: 0.0, modphaseTo: 0.5, modphaseSlope: 0.01, mul: 0.85, mulTo: 0.6, mulSlope: 0.05);
)


(
~mod1Preset = ( 'modphase': 2.4595093695803, 'carfreq': 0.41936138272285, 'mulSlope': 0.091246825456619, 'modphaseSlope': 0.011265637874603,
  'modfreqTo': 1.3059313893318, 'mulTo': 0.57479785084724, 'modfreqSlope': 0.072231779098511, 'pmindex': 1.3807998895645, 'pmindexSlope': 0.028513604402542,
  'carfreqSlope': 0.033447331190109, 'pmindexTo': 2.9540019035339, 'modphaseTo': 0.70062699951535, 'mul': 0.50855860710144, 'modfreq': 1.0545324087143,
  'carfreqTo': 0.44537062644958 ) ;
)


(~mod1Preset = (carfreq: rrand(0.05, 1), carfreqTo: rrand(0.2, 2), carfreqSlope: rrand(0.015, 0.100), modfreq: rrand(0.5, 2), modfreqTo: rrand(0.5, 2), modfreqSlope: rrand(0.015, 0.1), pmindex: rrand(0.5, 3), pmindexTo: rrand(0.5, 3), pmindexSlope: rrand(0.01, 0.1), modphase: rrand(0.0, pi), modphaseTo: rrand(0.0, pi), modphaseSlope: rrand(0.01, 0.1), mul: rrand(0.5, 0.95), mulTo: rrand(0.5, 0.95), mulSlope:rrand(0.01, 0.1));)

(
Ndef(\mod1, {
	PMOsc.kr(
		carfreq: Phasor.kr(0.0, ~mod1Preset[\carfreqSlope], ~mod1Preset[\carfreq], ~mod1Preset[\carfreqTo], ~mod1Preset[\carfreqTo]) /*+ (Ndef.kr(\mod2).linlin(-1,1,0.1,1))*/, // cps
		modfreq: Phasor.kr(0.0, ~mod1Preset[\modfreqSlope], ~mod1Preset[\modfreq], ~mod1Preset[\modfreqTo], ~mod1Preset[\modfreqTo]), // cps
		pmindex: Phasor.kr(0.0, ~mod1Preset[\pmindexSlope], ~mod1Preset[\pmindex], ~mod1Preset[\pmindexTo], ~mod1Preset[\pmindexTo]) + cos(Ndef.kr(\mod2) * 2 + 2),
		modphase: Phasor.kr(0.0, ~mod1Preset[\modphaseSlope], ~mod1Preset[\modphase], ~mod1Preset[\modphaseTo], ~mod1Preset[\modphaseTo]), // rad
		mul: Phasor.kr(0.0,  ~mod1Preset[\mulSlope], ~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulTo])
	)
});
)


(Ndef(\mod2).fadeTime_(12);)

/*
(
~mod2Preset = (freq: , freqTo: , freqSlope: , iphase: , iphaseTo: , iphaseSlope: , width: , widthTo: , widthSlope: , mul: , mulTo: , mulSlope:);
)*/

(~mod2Preset = (freq: 0.25, freqTo: 2, freqSlope: 0.05, iphase: 0.2, iphaseTo: 0, iphaseSlope: 0.01, width: 0.45, widthTo: 0.95, widthSlope: 0.05, mul: 0.65, mulTo: 0.85, mulSlope: 0.025);)

(~mod2Preset = ( 'iphaseTo': 0.0, 'mulTo': 0.79523701667786, 'freqTo': 1.1723373413086, 'width': 0.65378345251083,
  'widthTo': 0.8399854183197, 'freq': 0.3704122543335, 'mulSlope': 0.079945294857025, 'iphase': 0.29684007167816, 'iphaseSlope': 0.058127112388611,
  'widthSlope': 0.079674252271652, 'mul': 0.78147487640381, 'freqSlope': 0.05368087887764 );
)

(~mod2Preset = (freq: rrand(0.2, 5), freqTo: rrand(0.2, 3), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.0, 1), iphaseTo: rand(0.0,1), iphaseSlope: rrand(0.01,0.1), width: rrand(0.15, 1), widthTo: rrand(0.15, 1), widthSlope: rrand(0.01,0.1), mul: rrand(0.55, 0.95), mulTo: rrand(0.45, 0.95), mulSlope:rrand(0.01, 0.1));)

(Ndef(\mod2, {
	LFPulse.kr(
		freq: Phasor.kr(0.0, ~mod2Preset[\freqSlope], ~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqTo]) * cos(Ndef.kr(\mod1).linlin(0,1,1.2,5)),
		iphase: Phasor.kr(0.0, ~mod2Preset[\iphaseSlope], ~mod2Preset[\iphase], ~mod2Preset[\iphaseTo], ~mod2Preset[\iphaseTo]), // 0..1
		width: Phasor.kr(0.0, ~mod2Preset[\widthSlope], ~mod2Preset[\width], ~mod2Preset[\widthTo], ~mod2Preset[\widthTo])  * (Ndef.kr(\mod1).linlin(-1, 1, 0.75, 1)), // 0..1
		mul: Phasor.kr(0.0, ~mod2Preset[\mulSlope], ~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulTo])
	)
}))


(
Ndef(\mod2).release(10);
)

(
~ulysse42Preset = (amp: 0.2, atk: 0.001, rls: 0.2, sustain: 1, mod1: 0.2, mod2: 0.71) // default
)

(
~ulysse42Preset = ( 'rls': 0.5691388463974, 'mod2': 0.60983622074127, 'atk': 0.0095163176655769, 'mod1': 0.071875025033951,  'amp': 0.2, 'sustain': 1 )
)

(
~ulysse42Preset = ( 'rls': 0.30146820068359, 'mod2': 0.098270654678345, 'atk': 0.0054233431816101, 'mod1': 0.7239332151413,
  'amp': 0.1, 'sustain': 1 ) // long gate
)

(
~ulysse42Preset = (amp: 0.2, atk: rrand(0.0005, 0.01), rls: rrand(0.12, 2), sustain: 1, mod1: rrand(0.05, 0.82), mod2: rrand(0.0, 1.0))
)

(
Ndef(\ulysse42, {
	var mod1, sig, sig1, sig2, sig3, z1, z2, sinFrq, env;

	env = EnvGen.kr(Env.asr(~ulysse42Preset[\atk], 1, ~ulysse42Preset[\rls]), timeScale: ~ulysse42Preset[\sustain]);

	// mod1 = ~ulysse42Preset[\mod1].linlin(0, 1, -10, 10);

	mod1 = Ndef.kr(\mod2) + ~ulysse42Preset[\mod1].linlin(0, 1, -10, 10);

	sig1 =  LFSaw.kr(0.062).range(-10, 10);
	sig1 =  Ndef.kr(\mod2) * cos(Ndef.kr(\mod1)) * sig1 + (~ulysse42Preset[\mod2].linlin(0, 1, 0, 5) * (0..8));

	sig2 = sig1.frac * cos(Ndef.kr(\mod2) * 0.5 + 0.5);
	sig3 = (0.8 ) - sig2.moddif(0.5, 1);

	z1 = gcd(sig1, mod1) +  (sig2  * cos(Ndef.kr(\mod1) * 0.5 + 0.5));
	z2 = lcm(sig1, mod1) + sig2;

	// sinFrq = 132 * ([z1, z2].flop.abs + 1);

	sinFrq = Ndef.kr(\mod2).linlin(-1,1,31,120) * ([z1, z2].flop.abs + 1);



	sig = (SinOsc.ar(sinFrq) * AmpComp.kr(sinFrq) * sig3).mean;

	// 300523 test greyhole
	sig = Greyhole.ar(
		sig, // in
		(Ndef.kr(\mod2) * 0.5 + 0.5), // delayTime
		(Ndef.kr(\mod1)).linlin(-1,1,0.02,0.2), // damp,
		0.05 , // size
		0.1,  // diff
		(Ndef.kr(\mod2)).linlin(-1,1,0.05,0.4), // fb
		0.1 ,  // modDepth
		SinOsc.kr(Ndef.kr(\mod1).linlin(-1,1,0.05,0.2), 0.0, 0.5, 0.5) // modFreq
	);
	sig = Limiter.ar(sig, 0.7, 0.02);
	sig * env * ~ulysse42Preset[\amp];
})
);


Ndef(\ulysse42).play(2);

Ndef(\ulysse42).release(10);

Ndef(\ulysse42).fadeTime_(6);