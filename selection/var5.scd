Ndef(\mod1).fadeTime_(12);

(
~mod1Preset = (freq: 0.031, freqTo: 20.1, freqSlope: 0.025, iphase: 0.0, iphaseTo: pi, iphaseSlope: 0.1325, width: 0.5, widthTo: 0.95, widthSlope: 0.045, mul: 0.5, mulTo: 0.95, mulSlope: 0.05);
)

(
~mod1Preset = (freq: 0.03, freqTo: 0.5, freqSlope: 0.02, iphase: 0.0, iphaseTo: 0.1, iphaseSlope: 0.03, width: 0.95, widthTo: 0.25, widthSlope: 0.05, mul: 0.95, mulTo: 0.5, mulSlope: 0.06);
)

(
~mod1Preset = (freq: rrand(0.1, 1020), freqTo: rrand(0.1, 1520.020), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.0, 1), iphaseTo: rrand(0.01, 1), iphaseSlope: rrand(0.01, 0.10), width: rrand(0.1, 1), widthTo: rrand(0.1, 1), widthSlope: rrand(0.01, 0.10), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.01, 0.10));
)

(
Ndef(\mod1, {
	LFPulse.kr(
		freq: Phasor.kr(start: ~mod1Preset[\freq], end: ~mod1Preset[\freqTo], rate: ~mod1Preset[\freqSlope], resetPos: ~mod1Preset[\freqTo]),
		iphase: Phasor.kr(start: ~mod1Preset[\iphase], end: ~mod1Preset[\iphaseTo], rate: ~mod1Preset[\iphaseSlope], resetPos: ~mod1Preset[\iphaseTo]),
		width: Phasor.kr(start: ~mod1Preset[\width], end: ~mod1Preset[\widthTo], rate: ~mod1Preset[\widthSlope], resetPos: ~mod1Preset[\widthTo]),
		mul: Phasor.kr(start: ~mod1Preset[\mul], end: ~mod1Preset[\mulTo], rate: ~mod1Preset[\mulSlope], resetPos: ~mod1Preset[\mulTo])
	)
});
)


Ndef(\mod2).fadeTime_(12);

(
~mod2Preset = (freq: 0.5, freqTo: 0.025, freqSlope: 0.05, feedback: 0.0, feedbackTo: pi, feedbackSlope: 0.06, mul: 0.47, mulTo: 0.75, mulSlope: 0.07);
)

(
~mod2Preset = (freq: rrand(0.05, 1200), freqTo: rrand(0.01, 3120.0), freqSlope: rrand(0.01, 0.10), feedback: rrand(0, pi), feedbackTo: rrand(0, 2*pi), feedbackSlope: rrand(0.010, 0.10), mul: rrand(0.85, 1), mulTo: rrand(0.85, 1), mulSlope: rrand(0.01, 0.10));
)

(
Ndef(\mod2, {
	SinOscFB.kr(
		freq: Phasor.kr(~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqSlope]),
		feedback: Phasor.kr(~mod2Preset[\feedback], ~mod2Preset[\feedbackTo], ~mod2Preset[\feedbackSlope]),
		mul: Phasor.kr(~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulSlope])
	)
});
)


Ndef(\variation5).fadeTime_(19);

(
~variation5Preset = ('amp': 0.6, 'atk': 0.0001, 'dcy': 0.1, 'stn': 1, 'rls': 1.2, 'bohlen':[1,27/25,25/21,9/7,7/5,75/49,5/3,9/5,49/25,15/7,7/3,63/25,25/9,3], size: 8, iter: 5)
) // default

(~variation5Preset = ( 'stn': 1, 'rls': 1.2, 'atk': 0.0001, 'dcy': 0.1,
  'amp': 0.6, 'bohlen': [ 0.061, 0.331, 0.392, 0.723, 1.115, 1.838, 2.953, 4.791, 7.744, 12.535, 20.279, 32.814, 53.093, 85.907 ], size: 28, iter: 5);
) // instants chavirés

(
~variation5Preset = ( 'stn': 1, 'rls': 1.2, 'atk': 0.0001, 'dcy': 0.1, 'amp': 0.6, 'bohlen': [ 0.0261, 0.0888, 0.1149, 0.2037, 0.3186, 0.5223, 0.8409, 1.3632, 2.2041, 3.5673, 5.7714, 9.3387, 15.1101, 24.4488 ], size: 8, iter: 5); // certifié sans aucun revenu
)

(
~variation5Preset = ('amp': 0.6, 'atk': 0.0001, 'dcy': 0.1, 'stn': 1, 'rls': 1.2, 'bohlen': Array.fib(14, 0.0627, 0.0261), size: rrand(5, 12), iter: rrand(2, 8));
)

(
Ndef(\variation5, {
	var sig, env, a, bohlen;
	env = EnvGen.ar(Env.adsr(~variation5Preset[\atk], ~variation5Preset[\dcy], ~variation5Preset[\stn], ~variation5Preset[\rls]));
	bohlen = ~variation5Preset[\bohlen] * Ndef.kr(\mod1).linlin(-1,1,0.025,1.3);
	sig = {
		a = LFTri.ar(bohlen.choose * 10/27, 0, 11);
		~variation5Preset[\iter].do{
			a = BAllPass.ar(a, PinkNoise.kr(1, Ndef.kr(\mod2).linlin(-1,1,10,30).sum/*30*/ * bohlen.choose), 2,
				1);
			a = BAllPass.ar(a, PinkNoise.kr(1, Ndef.kr(\mod1).linlin(-1,1,60,270).sum/*270*/ * bohlen.choose *
				[27, 3, 9].choose),0.001,17);
			a = ((a * LFNoise1.ar(bohlen.choose/9, 3, 1)) +
				WhiteNoise.ar(PinkNoise.ar(0.1) * LFNoise2.ar(3, 0.001))).tanh;
			a = LPF.ar(LeakDC.ar(a, 0.995), 10000)
		};
		a / (~variation5Preset[\size] * 5);
	} ! ~variation5Preset[\size]; //8;
	sig = Splay.ar(sig, 0.98) * ~variation5Preset[\amp] * 0.974 * env;
	sig = sig * 0.95;
});
)

Ndef(\variation5).play(2);

Ndef(\variation5).release(1);

Ndef(\variation5).clear;