todo: suites Array.fib à refaire

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


(~mod1Preset = (carfreq: rrand(0.05, 410), carfreqTo: rrand(0.2, 820.60), carfreqSlope: rrand(0.015, 20.100), modfreq: rrand(0.5, 20.00), modfreqTo: rrand(0.5, 20.0), modfreqSlope: rrand(0.015, 3.1), pmindex: rrand(0.5, 3), pmindexTo: rrand(0.5, 3), pmindexSlope: rrand(0.01, 0.1), modphase: rrand(0.0, pi), modphaseTo: rrand(0.0, pi), modphaseSlope: rrand(0.01, 0.1), mul: rrand(0.5, 0.95), mulTo: rrand(0.5, 0.95), mulSlope:rrand(0.01, 0.1));)

(
Ndef(\mod1, {
	PMOsc.kr(
		carfreq: Phasor.kr(0.0, ~mod1Preset[\carfreqSlope], ~mod1Preset[\carfreq], ~mod1Preset[\carfreqTo], ~mod1Preset[\carfreqTo]) ,
		modfreq: Phasor.kr(0.0, ~mod1Preset[\modfreqSlope], ~mod1Preset[\modfreq], ~mod1Preset[\modfreqTo], ~mod1Preset[\modfreqTo]) * Ndef.kr(\mod3).linexp(-1,1,0.01,2).sum, // cps
		pmindex: Phasor.kr(0.0, ~mod1Preset[\pmindexSlope], ~mod1Preset[\pmindex], ~mod1Preset[\pmindexTo], ~mod1Preset[\pmindexTo]) * Ndef.kr(\mod2).linexp(-1,1,0.5,1).sum ,
		modphase: Phasor.kr(0.0, ~mod1Preset[\modphaseSlope], ~mod1Preset[\modphase], ~mod1Preset[\modphaseTo], ~mod1Preset[\modphaseTo]), // rad
		mul: Phasor.kr(0.0,  ~mod1Preset[\mulSlope], ~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulTo])
	)
});
)

(Ndef(\mod2).fadeTime_(12);)

(
~mod2Preset = (freq: 0.5, freqTo: 0.2, freqSlope: 0.05, feedback: 0.1, feedbackTo: pi, feedbackSlope: 0.02, mul: 1, mulTo: 0.5, mulSlope: 0.05);
)

(
~mod2Preset = ( 'mul': 0.81274175643921, 'freqSlope': 0.096158572435379, 'freqTo': 96.60120639801, 'feedback': 0.10402382119255, 'freq': 3.5919137954712, 'feedbackSlope': 0.054205282926559, 'mulTo': 0.76629991531372, 'mulSlope': 0.080954266786575, 'feedbackTo': 1.3974138039626 );
)

(
~mod2Preset = ( 'mul': 0.6971711397171, 'freqSlope': 0.084784740209579, 'freqTo': 271.31825978756, 'feedback': 0.77047368381297, 'freq': 0.65525512695313, 'feedbackSlope': 0.010041692256927, 'mulTo': 0.84707050323486, 'mulSlope': 0.088914043903351, 'feedbackTo': 1.1727996559275 );
)

(
~mod2Preset = ( 'mul': 0.77721283435822, 'freqSlope': 0.077247807979584, 'freqTo': 300.9389463133812, 'feedback': 0.13370891481128, 'freq': 2.4459287643433, 'feedbackSlope': 0.069925731420517, 'mulTo': 0.81639413833618, 'mulSlope': 0.033315681219101, 'feedbackTo': 0.94268605943537 );
)

(
~mod2Preset = (freq: 6.5, freqTo: 0.3, freqSlope: 0.003, feedback: pi/2, feedbackTo: 0, feedbackSlope: 0.05, mul: 1, mulTo: 0.9, mulSlope: 0.1);
)

(
~mod2Preset = (freq: rrand(10.02, 800.5), freqTo: rrand(20.2, 912.00), freqSlope: rrand(0.01, 90.1), feedback: rrand(0.0, 0.5), feedbackTo: rrand(0.0, 0.95), feedbackSlope: rrand(0.01, 0.1), mul: rrand(0.65, 0.85), mulTo: rrand(0.65, 0.85), mulSlope: rrand(0.01, 0.1));
)

(Ndef(\mod2, {
	SinOscFB.kr(
		freq: Phasor.kr(0.0, ~mod2Preset[\freqSlope], ~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqTo]) * (Ndef.kr(\mod3).linexp(-1,1,0.25,1)),
		feedback: Phasor.kr(0.0, ~mod2Preset[\feedbackSlope], ~mod2Preset[\feedback], ~mod2Preset[\feedbackTo], ~mod2Preset[\feedbackTo]) * SinOsc.kr(Ndef.kr(\mod1)).linexp(-1,1,0.01,0.6),
		mul: Phasor.kr(0.0, ~mod2Preset[\mulSlope], ~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulTo])
	);
});)

(
Ndef(\mod3).fadeTime_(12);
)

(~mod3Preset = (carfreq: 0.1, carfreqTo: 10.6, carfreqSlope: 0.05, modfreq: 0.12, modfreqTo: 6.3, modfreqSlope: 0.15, pmindex: 0.6, pmindexTo: 1.2, pmindexSlope: 0.01, modphase: 0.01, modphaseTo: 0.0, modphaseSlope: 0.01,  mul: 0.95, mulTo: 0.99, mulSlope: 0.01);)

(~mod3Preset = (carfreq: 431.5, carfreqTo: 360.115, carfreqSlope: 3.01, modfreq: 10.5, modfreqTo: 6, modfreqSlope: 0.05, pmindex: 12, pmindexTo: 20, pmindexSlope: 0.5, modphase: 0.0, modphaseTo: 0.0, modphaseSlope: 0.01, mul: 1, mulTo: 0.99, mulSlope: 0.001);)

(
~mod3Preset = (carfreq: rrand(10.5,930), carfreqTo: rrand(10.5,3000), carfreqSlope: rrand(0.01,30.1), modfreq: rrand(1.0, 600), modfreqTo: rrand(1.0, 1060), modfreqSlope: rrand(0.01, 90.1), pmindex: rrand(0.25, 3), pmindexTo: rrand(0.25, 123), pmindexSlope: rrand(0.01, 0.1), modphase: rrand(0.0, 2pi), modphaseTo: rrand(0.0, 2pi), modphaseSlope: rrand(0.01, 0.1), mul: rrand(0.85,1), mulTo: rrand(0.85,1), mulSlope: rrand(0.01,0.1));
)

(
Ndef(\mod3, {
	PMOsc.kr(
		Phasor.kr(0.0, ~mod3Preset[\carfreqSlope], ~mod3Preset[\carfreq], ~mod3Preset[\carfreqTo], ~mod3Preset[\carfreqTo]) + Ndef.kr(\mod1).cos * 0.5,
		Phasor.kr(0.0, ~mod3Preset[\modfreqSlope], ~mod3Preset[\modfreq], ~mod3Preset[\modfreqTo], ~mod3Preset[\modfreqTo]),
		Phasor.kr(0.0, ~mod3Preset[\pmindexSlope], ~mod3Preset[\pmindex], ~mod3Preset[\pmindexTo], ~mod3Preset[\pmindexTo]) , //  *  (Ndef(\mod2).linlin(-1,1,0.75,1)), // ERROR: NotYetImplementedError
		Phasor.kr(0.0, ~mod3Preset[\modphaseSlope], ~mod3Preset[\modphase], ~mod3Preset[\modphaseTo], ~mod3Preset[\modphaseTo]),
		mul: Phasor.kr(0.0, ~mod2Preset[\mulSlope], ~mod3Preset[\mul], ~mod3Preset[\mulTo], ~mod3Preset[\mulTo])
	)
});
)


Ndef(\variation2).fadeTime_(13);

(
~variation2Preset = (amp: 0.26, atk: 0.0001, dcy: 0.1, stn: 1, rls: 1.2, bohlen: 	[1,27/25,25/21,9/7,7/5,75/49,5/3,9/5,49/25,15/7,7/3,63/25,25/9,3], bohlen2:[1,3,9/7,9/5,7/3,25/9] , bohlen3: [1, 3, 9], size: 8, iter: 4);
)

(
~variation2Preset = (amp: 0.16, atk: 0.0001, dcy: 0.31, stn: 1.2, rls: 1.12, bohlen: Array.fib(14, 3.01, 1/1.01), bohlen2: Array.fib(6, 1.0, 1/2.777), bohlen3: Array.fib(3, 1/9, 1), size: 10, iter: 5);
)

(
~variation2Preset = (amp: 0.16, atk: 0.0001, dcy: 0.31, stn: 1.2, rls: 1.12, bohlen: Array.fib(rrand(7,14), 3.1/rrand(8.5,15), 1/rrand(1.01,3)), bohlen2: Array.fib(6, 1.0, 1/rrand(2.777,3.65)), bohlen3: Array.fib(3, 1/rrand(7.9,11.0), 1), size: 10, iter: 5);
)


(
Ndef(\variation2, {
	var sig, env, a, bohlen;
	env = EnvGen.ar(Env.adsr(~variation2Preset[\atk], ~variation2Preset[\dcy], ~variation2Preset[\stn], ~variation2Preset[\rls]));
	bohlen = ~variation2Preset[\bohlen];
	sig = {
		a = LFTri.ar(bohlen.choose/3);
		~variation2Preset[\iter].do{
			a = BAllPass.ar(a, PinkNoise.kr(/*11*/Ndef.kr(\mod1).linexp(-1,1,0.2,[3.1,31,3100].choose).sum, 30 *
				~variation2Preset[\bohlen2].choose),0.01);
			a = BAllPass.ar(a, PinkNoise.kr(/*23*/ Ndef.kr(\mod2).linexp(-1,1,2.1,[2.3,23,230].choose).sum , 270 * ~variation2Preset[\bohlen3].choose *
				bohlen.choose), 0.003);
			a = ((a * LFNoise0.ar(bohlen.choose/7, 7, 3)) +
				WhiteNoise.ar(Lag.ar(Dust2.ar(LFNoise1.kr(Ndef.kr(\mod1).linexp(-1,1,0.2,[0.8,0.6,1]).sum,25,3), 1,
					PinkNoise.kr(0.001)), 0.02), 0)).tanh;
			a = LPF.ar(LeakDC.ar(a, 0.996), 10000)
		};
		a = (a/(~variation2Preset[\size] * 1.25))
	} ! ~variation2Preset[\size];
	sig = Splay.ar(sig) * 0.65 * ~variation2Preset[\amp] * env;
});
)

Ndef(\variation2).play(2);

Ndef(\variation2).release(6);