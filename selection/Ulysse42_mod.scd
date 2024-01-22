// sept23 niveau et tout ok

(Ndef(\ulysse42Mod1).fadeTime_(19);)

(
~mod1Preset = (carfreq: 0.15, carfreqTo: 1.5, carfreqSlope: 0.1, modfreq: 5.5, modfreqTo: 0.1, modfreqSlope: 0.1, pmindex: 5, pmindexTo: 0.25, pmindexSlope: 0.1, modphase: 0.0, modphaseTo: 0.5, modphaseSlope: 0.01, mul: 0.85, mulTo: 0.6, mulSlope: 0.05);
)


(
~mod1Preset = ( 'modphase': 2.4595093695803, 'carfreq': 0.41936138272285, 'mulSlope': 0.091246825456619, 'modphaseSlope': 0.011265637874603,
  'modfreqTo': 1.3059313893318, 'mulTo': 0.57479785084724, 'modfreqSlope': 0.072231779098511, 'pmindex': 1.3807998895645, 'pmindexSlope': 0.028513604402542,
  'carfreqSlope': 0.033447331190109, 'pmindexTo': 2.9540019035339, 'modphaseTo': 0.70062699951535, 'mul': 0.50855860710144, 'modfreq': 1.0545324087143,
  'carfreqTo': 20.44537062644958 ) ;
)

~mod1Preset = ( 'modphase': 0.19330217716015, 'carfreq': 949.74887478352, 'mulSlope': 0.089785794019699, 'modphaseSlope': 0.06236184835434,  'modfreqTo': 981.20932579041, 'mulTo': 0.77547032833099, 'modfreqSlope': 0.040994101166725, 'pmindex': 182.22755515575, 'pmindexSlope': 0.08829464673996,  'carfreqSlope': 0.0428971606493, 'pmindexTo': 86.311206042767, 'modphaseTo': 1.6814170892908, 'mul': 0.90274724960327, 'modfreq': 705.80253690481,  'carfreqTo': 2798.0528646708 );

(~mod1Preset = (carfreq: rrand(0.05, 2510.00), carfreqTo: rrand(0.2, 4200), carfreqSlope: rrand(0.015, 10.100), modfreq: rrand(0.5, 2000), modfreqTo: rrand(0.5, 6200), modfreqSlope: rrand(0.015, 10.1), pmindex: rrand(0.5, 300), pmindexTo: rrand(0.5, 300), pmindexSlope: rrand(0.01, 0.1), modphase: rrand(0.0, pi), modphaseTo: rrand(0.0, pi), modphaseSlope: rrand(0.01, 0.1), mul: rrand(0.75, 0.95), mulTo: rrand(0.75, 0.95), mulSlope:rrand(0.01, 0.1));)

(
Ndef(\ulysse42Mod1, {
	PMOsc.kr(
		carfreq: Phasor.kr(0.0, ~mod1Preset[\carfreqSlope], ~mod1Preset[\carfreq], ~mod1Preset[\carfreqTo], ~mod1Preset[\carfreqTo]) /*+ (Ndef.kr(\mod2).linlin(-1,1,0.1,1))*/, // cps
		modfreq: Phasor.kr(0.0, ~mod1Preset[\modfreqSlope], ~mod1Preset[\modfreq], ~mod1Preset[\modfreqTo], ~mod1Preset[\modfreqTo]), // cps
		pmindex: Phasor.kr(0.0, ~mod1Preset[\pmindexSlope], ~mod1Preset[\pmindex], ~mod1Preset[\pmindexTo], ~mod1Preset[\pmindexTo]) * cos(Ndef.kr(\ulysse42Mod2)),
		modphase: Phasor.kr(0.0, ~mod1Preset[\modphaseSlope], ~mod1Preset[\modphase], ~mod1Preset[\modphaseTo], ~mod1Preset[\modphaseTo]), // rad
		mul: Phasor.kr(0.0,  ~mod1Preset[\mulSlope], ~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulTo])
	)
});
)


(Ndef(\ulysse42Mod2).fadeTime_(12);)

/*
(
~mod2Preset = (freq: , freqTo: , freqSlope: , iphase: , iphaseTo: , iphaseSlope: , width: , widthTo: , widthSlope: , mul: , mulTo: , mulSlope:);
)*/

(~mod2Preset = (freq: 0.25, freqTo: 0.122, freqSlope: 0.005, iphase: 0.2, iphaseTo: 0, iphaseSlope: 0.01, width: 0.45, widthTo: 0.95, widthSlope: 0.05, mul: 0.65, mulTo: 0.85, mulSlope: 0.025);)

(~mod2Preset = ( 'iphaseTo': 0.0, 'mulTo': 0.79523701667786, 'freqTo': 41.1723373413086, 'width': 0.65378345251083,
  'widthTo': 0.8399854183197, 'freq': 0.3704122543335, 'mulSlope': 0.079945294857025, 'iphase': 0.29684007167816, 'iphaseSlope': 0.058127112388611,
  'widthSlope': 0.079674252271652, 'mul': 0.78147487640381, 'freqSlope': 0.05368087887764 );
)

(~mod2Preset = (freq: rrand(0.2, 1500), freqTo: rrand(0.2, 1300), freqSlope: rrand(0.01, 10.1), iphase: rrand(0.0, 1), iphaseTo: rand(0.0,1), iphaseSlope: rrand(0.01,0.1), width: rrand(0.35, 1), widthTo: rrand(0.5, 1), widthSlope: rrand(0.01,0.1), mul: rrand(0.5, 0.95), mulTo: rrand(0.5, 0.95), mulSlope:rrand(0.01, 0.1));)

(Ndef(\ulysse42Mod2, {
	LFPulse.kr(
		freq: Phasor.kr(0.0, ~mod2Preset[\freqSlope], ~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqTo]) * cos(Ndef.kr(\mod1).linlin(0,1,1.2,5)),
		iphase: Phasor.kr(0.0, ~mod2Preset[\iphaseSlope], ~mod2Preset[\iphase], ~mod2Preset[\iphaseTo], ~mod2Preset[\iphaseTo]), // 0..1
		width: Phasor.kr(0.0, ~mod2Preset[\widthSlope], ~mod2Preset[\width], ~mod2Preset[\widthTo], ~mod2Preset[\widthTo])  * (Ndef.kr(\ulysse42Mod1).linlin(-1, 1, 0.75, 1)), // 0..1
		mul: Phasor.kr(03.0, ~mod2Preset[\mulSlope], ~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulTo])
	)
}))


(
Ndef(\ulysse42Mod2).release(2);
)


Ndef(\ulysse42).fadeTime_(26);

(
~ulysse42Preset = (amp: 0.12, atk: 0.001, rls: 0.2, sustain: 1, mod1: 0.2, mod2: 0.71) // default
)

(
~ulysse42Preset = ( 'rls': 0.5691388463974, 'mod2': 0.60983622074127, 'atk': 0.0095163176655769, 'mod1': 0.071875025033951,  'amp': 0.12, 'sustain': 1 )
)

(
~ulysse42Preset = ( 'rls': 0.30146820068359, 'mod2': 0.098270654678345, 'atk': 0.0054233431816101, 'mod1': 0.7239332151413,
  'amp': 0.12, 'sustain': 1 ) // long gate
)

(
~ulysse42Preset = ( 'rls': 1.1913818120956, 'mod2': 0.98036432266235, 'atk': 0.0083026005625725, 'mod1': 0.29627777457237, 'amp': 0.12, 'sustain': 1 )
)


~ulysse42Preset = ( 'rls': 1.7517450332642, 'mod2': 0.187733717441559, 'atk': 0.084583584666252, 'mod1': 0.019996535658836, 'amp': 0.12, 'sustain': 1 );
(
~ulysse42Preset = (amp: 0.12, atk: rrand(0.0005, 0.01), rls: rrand(0.12, 2), sustain: 1, mod1: rrand(0.05, 0.82), mod2: rrand(0.01, 1.0))
)

(
Ndef(\ulysse42, {
	var mod1, sig, sig1, sig2, sig3, z1, z2, sinFrq, env;

	env = EnvGen.kr(Env.asr(~ulysse42Preset[\atk], 1, ~ulysse42Preset[\rls]), timeScale: ~ulysse42Preset[\sustain]);

	// mod1 = ~ulysse42Preset[\mod1].linlin(0, 1, -10, 10);

	mod1 = Ndef.kr(\ulysse42Mod2) + ~ulysse42Preset[\mod1].linlin(0, 1, -10, 10);

	sig1 =  LFSaw.kr(0.062).range(-10, 10);
	sig1 =  Ndef.kr(\ulysse42Mod2) * cos(Ndef.kr(\ulysse42Mod1)) * sig1 + (~ulysse42Preset[\mod2].linlin(0, 1, 0, 5) * (0..8));

	sig2 = sig1.frac * cos(Ndef.kr(\ulysse42Mod2) * 0.5 + 0.5);
	sig3 = (0.8 ) - sig2.moddif(0.5, 1);

	z1 = gcd(sig1, mod1) +  (sig2  * cos(Ndef.kr(\ulysse42Mod1) * 0.5 + 0.5));
	z2 = lcm(sig1, mod1) + sig2;

	// sinFrq = 132 * ([z1, z2].flop.abs + 1);

	sinFrq = Ndef.kr(\ulysse42Mod2).linlin(-1,1,31,120) * ([z1, z2].flop.abs + 1);



	sig = (SinOsc.ar(sinFrq) * AmpComp.kr(sinFrq) * sig3).mean;

	// 300523 test greyhole
	sig = Greyhole.ar(
		sig, // in
		(Ndef.kr(\ulysse42Mod2) * 0.5 + 0.5), // delayTime
		(Ndef.kr(\ulysse42Mod1)).linlin(-1,1,0.02,0.2), // damp,
		0.05 , // size
		0.1,  // diff
		(Ndef.kr(\ulysse42Mod2)).linlin(-1,1,0.05,0.4), // fb
		0.1 ,  // modDepth
		SinOsc.kr(Ndef.kr(\ulysse42Mod1).linlin(-1,1,0.05,0.2), 0.0, 0.5, 0.5) // modFreq
	);
	sig = Limiter.ar(sig, 0.7, 0.02);
	sig = sig * env * ~ulysse42Preset[\amp] * 0.83;
	sig.sum;
})
);


Ndef(\ulysse42).play(0);

Ndef(\ulysse42).release(1);