// sept23 revoir tout le graphe !!
// ne joue pas ! pas clair !

Ndef(\mod1).fadeTime_(12);

(
~mod1Preset = (freq: 2, iphase: pi/4, width: 0.7, mul: 0.25);
)

(
~mod1Preset = (freq: 0.5, iphase: 0.0, width: 1, mul: 0.25);
)

(
~mod1Preset = (freq: rrand(0.05, 2.0), iphase: rrand(0.0, 0.9), width: rrand(0.15, 1), mul: rrand(0.65, 0.51));
)

(
Ndef(\mod1, {
	LFPulse.kr(
		freq: ~mod1Preset[\freq] * (Ndef.kr(\mod2) * 0.5 + 0.5),
		iphase: ~mod1Preset[\iphase],
		width: ~mod1Preset[\width] * (Ndef.kr(\mod3) * 0.5 + 0.5),
		mul: ~mod1Preset[\mul]
	)
});
)

(
Ndef(\mod1, {
	LFPulse.kr(
		freq: Phasor.kr(rate: 0.1, start: 1 / ~mod1Preset[\freq], end: ~mod1Preset[\freq], resetPos: ~mod1Preset[\freq]),
		iphase: ~mod1Preset[\iphase] * (Ndef.kr(\mod2) * 0.5 + 0.5),
		width: Phasor.kr(rate: 0.1, start: 1 / ~mod1Preset[\width], end: ~mod1Preset[\width], resetPos: ~mod1Preset[\width])* (Ndef.kr(\mod3) * 0.5 + 0.5),
		mul: ~mod1Preset[\mul]
	)
});
)


Ndef(\mod2).fadeTime_(10);

(
~mod2Preset = (freq: 0.6, iphase: 0.1, mul: 0.35);
)

(
~mod2Preset = (freq: 2, iphase: 0.01, mul: 0.35);
)

(
~mod2Preset = (freq: 0.125, iphase: 0.3, mul: 0.35);
)

(
~mod2Preset = (freq: rrand(0.01, 20), iphase: rrand(0.01, 1), mul: 0.35);
)

(
Ndef(\mod2, {
	LFPar.kr(
		freq: ~mod2Preset[\freq] % (Ndef.kr(\mod1) * 0.5 + 0.5),
		iphase: ~mod2Preset[\iphase] * (Ndef.kr(\mod3) * (pi/2) + (pi/2)),
		mul: ~mod2Preset[\mul]
	)
});
)

(
Ndef(\mod2, {
	LFPar.kr(
		freq: Phasor.kr(rate: 0.1, start: 1 / ~mod2Preset[\freq], end: ~mod2Preset[\freq], resetPos: ~mod2Preset[\freq]) * (Ndef.kr(\mod1) + 0.5 * 0.5),
		iphase: Phasor.kr(rate: 0.1, start: 1 / ~mod2Preset[\iphase], end: ~mod2Preset[\iphase], resetPos: ~mod2Preset[\iphase]) /** (Ndef.kr(\mod3) * (pi/2) + (pi/2))*/,
		mul: ~mod2Preset[\mul]
	)
});
)

Ndef(\mod3).fadeTime_(10);

(
~mod3Preset = (carfreq: 0.122, modfreq: 0.34, pmindex: 0.3, modphase: 0.01, mul: 0.25);
)

(
~mod3Preset = (carfreq: , modfreq: , pmindex: , modphase: , mul: );
)

(
~mod3Preset = (carfreq: rrand(0.01, 12.8), modfreq: rrand(0.1, 5.47), pmindex: rrand(0.01, 2.0), modphase: rrand(0.0, pi/4), mul: 0.25 );
)

(
Ndef(\mod3, {
	PMOsc.kr(
		carfreq: ~mod3Preset[\carfreq],
		modfreq: ~mod3Preset[\modfreq],
		pmindex: ~mod3Preset[\pmindex] * (Ndef.kr(\mod2) * 2 + 2),
		modphase: ~mod3Preset[\modphase] % (Ndef.kr(\mod1) * 0.5 + 0.5),
		mul: ~mod3Preset[\mul]
	)
});
)


(
Ndef(\mod3, {
	PMOsc.kr(
		carfreq: Phasor.kr(rate: 0.1, start: 1 / ~mod3Preset[\carfreq], end: ~mod3Preset[\carfreq], resetPos: ~mod3Preset[\carfreq] ) + (Ndef.kr(\mod1) * 0.5 + 0.5),
		modfreq: Phasor.kr(rate: 0.1, start: 1 / ~mod3Preset[\modfreq], end: ~mod3Preset[\modfreq], resetPos: ~mod3Preset[\modfreq]),
		pmindex: Phasor.kr(rate: 0.1, start: 1 / ~mod3Preset[\pmindex], end: ~mod3Preset[\pmindex], resetPos: ~mod3Preset[\pmindex]) % (Ndef.kr(\mod2) * 0.25 + 0.25),
		modphase: Phasor.kr(rate: 0.1, start: 1 / ~mod3Preset[\modphase], end: ~mod3Preset[\modphase], resetPos: ~mod3Preset[\modphase]),
		mul: ~mod3Preset[\mul]
	)
});
)


Ndef(\nVirgo).fadeTime_(10);

(
~nVirgoPreset = (amp: 0.1, att: 0.01, rel: 20, feedBack: 7.5, sawFreq1: 32, sawFreq2: 33, sawAmp: 0.2, bpff: 2, bpffModSpeed: 1.33, bpffModAmt: 4, delayTime: 2, decayTime: 40);
// default
)

(
~nVirgoPreset = ( 'att': 0.089472068548203, 'sawAmp': 0.2, 'bpffModAmt': 3.0938064455986, 'rel': 15, 'sawFreq2': 552, 'bpff': 2, 'delayTime': 1.8205498456955, 'feedBack': 5.5620234012604, 'bpffModSpeed': 2.9549210321903, 'decayTime': 40, 'amp': 0.2, 'sawFreq1': 225 )
)

(
~nVirgoPreset = ( 'att': 0.11469817638397, 'sawAmp': 0.2, 'bpffModAmt': 2.12881731987, 'rel': 12, 'sawFreq2': 524, 'bpff': 2, 'delayTime': 1.1182125210762, 'feedBack': 0.84835304915905, 'bpffModSpeed': 2.9216046774387, 'decayTime': 40, 'amp': 0.2, 'sawFreq1': 69 )
)

(
~nVirgoPreset = ( 'att': 0.17509307265282, 'sawAmp': 0.2, 'bpffModAmt': 3.5155351161957, 'rel': 13, 'sawFreq2': 279, 'bpff': 2, 'delayTime': 0.257721811532974, 'feedBack': 0.6553511619568, 'bpffModSpeed': 1.3605163013935, 'decayTime': 40, 'amp': 0.2, 'sawFreq1': 166 )
)

(
~nVirgoPreset = ( 'att': 0.11383947849274, 'sawAmp': 0.2, 'bpffModAmt': 1.4050741195679, 'rel': 6, 'sawFreq2': 444, 'bpff': 2, 'delayTime': 1.8397490978241, 'feedBack': 1.61629204154015, 'bpffModSpeed': 2.0261113810539, 'decayTime': 40, 'amp': 0.2, 'sawFreq1': 188 )
)

(
~nVirgoPreset = ( 'att': 0.18990749120712, 'sawAmp': 0.2, 'bpffModAmt': 2.2081257104874, 'rel': 13, 'sawFreq2': 694, 'bpff': 2, 'delayTime': 0.87268024682999, 'feedBack': 2.393406867981, 'bpffModSpeed': 2.7786209928989, 'decayTime': 40, 'amp': 0.2, 'sawFreq1': 105 )
)

~nVirgoPreset[\sawFreq2] = 34;

(
~nVirgoPreset = (amp: 0.2, att: rrand(0.01, 0.2), rel: rrand(1.0,20), feedBack: rrand(4, 7.5), sawFreq1: rrand(32, 230), sawFreq2: rrand(33, 820), sawAmp: 0.2, bpff: 2, bpffModSpeed: rrand(1.33, 3), bpffModAmt: rrand(0.5, 4), delayTime: rrand(0.5, 2), decayTime: 40);
// rrand à faire
)



(
Ndef(\nVirgo, {
	var sig, env;
	env = EnvGen.ar(Env.asr(~nVirgoPreset[\att], 1, ~nVirgoPreset[\rel] ));
	sig = LocalIn.ar(2, 1) * ~nVirgoPreset[\feedBack].max(1).min(4) /** Saw.ar(
		[~nVirgoPreset[\sawFreq1] % (Ndef.kr(\mod2) * 0.5 + 0.5), ~nVirgoPreset[\sawFreq2] % (Ndef.kr(\mod3) * 0.25 + 0.25).sqrt],
		~nVirgoPreset[\sawAmp]
	) * env*/;
	sig = BPF.ar(
		sig, // in
		~nVirgoPreset[\bpff] ** LFNoise0.kr(
			~nVirgoPreset[\bpffModSpeed] * (Ndef.kr(\mod1) * 0.25 + 0.25),
			~nVirgoPreset[\bpffModAmt]) * 300  * (Ndef.kr(\mod2) * 0.2 + 0.2) , // * 300 ,
		0.1
).distort ;
	sig = Limiter.ar(CombN.ar(sig, 1 + (Ndef.kr(\mod3) * 0.5 + 0.5), ~nVirgoPreset[\delayTime] , ~nVirgoPreset[\decayTime]), 0.7, 0.09);
	LocalOut.ar(sig);
	sig = Limiter.ar(HPF.ar(sig * ~nVirgoPreset[\amp] * env * 1.75, 65), 0.5, 0.01);
});
)

Ndef(\nVirgo).play(2);

Ndef(\nVirgo).release(30);

Ndef(\nVirgo).clear;