// sept23 parfait + niveaux

(
Ndef(\mod1).fadeTime_(12);
)

(~mod1Preset = (freq: 0.1, freqTo: 0.5, freqSlope: 0.01, iphase: 0.0, iphaseTo: 0.5, iphaseSlope: 0.01, width: 0.33, widthTo: 0.85, widthSlope: 0.01, mul: 0.85, mulTo: 0.85, mulSlope: 0.01);)

(~mod1Preset = (freq: 0.65, freqTo: 3, freqSlope: 0.01, iphase: 0.65, iphaseTo: 0.15, iphaseSlope: 0.01, width: 0.99, widthTo: 0.45, widthSlope: 0.03, mul: 0.9, mulTo: 0.8, mulSlope: 0.01);)

(~mod1Preset = (freq: rrand(0.02, 3), freqTo: rrand(0.2, 0.03), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.0, 1), iphaseTo: rrand(0.0, 1), iphaseSlope: rrand(0.01, 0.1), width: rrand(0.45, 1), widthTo: rrand(0.45, 1), widthSlope: rrand(0.01, 0.1), mul: rrand(0.85, 1), mulTo: rrand(0.85, 1), mulSlope: rrand(0.01, 0.1));)

(
Ndef(\mod1, {
	LFPulse.kr(
		freq: Phasor.kr(0.0, ~mod1Preset[\freqSlope], ~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqTo]) * Ndef.kr(\mod3) * 0.5 + 0.5,
		iphase: Phasor.kr(0.0, ~mod1Preset[\iphaseSlope], ~mod1Preset[\iphase], ~mod1Preset[\iphaseTo], ~mod1Preset[\iphaseTo]) * Pulse.kr(Ndef.kr(\mod2).cos), // 0..1
		width: Phasor.kr(0.0, ~mod1Preset[\widthSlope], ~mod1Preset[\width], ~mod1Preset[\widthTo], ~mod1Preset[\widthTo]),
		mul: Phasor.kr(0.0, ~mod1Preset[\mulSlope], ~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulTo])
	);
})
)

(Ndef(\mod2).fadeTime_(12);)

(
~mod2Preset = (freq: 0.5, freqTo: 0.62, freqSlope: 0.05, feedback: 0.1, feedbackTo: pi/4, feedbackSlope: 0.02, mul: 1, mulTo: 0.5, mulSlope: 0.05);
)

(
~mod2Preset = ( 'mul': 0.81274175643921, 'freqSlope': 0.096158572435379, 'freqTo': 96.60120639801, 'feedback': 0.10402382119255, 'freq': 3.5919137954712, 'feedbackSlope': 0.054205282926559, 'mulTo': 0.76629991531372, 'mulSlope': 0.080954266786575, 'feedbackTo': 1.3974138039626 );
)

(
~mod2Preset = ( 'mul': 0.6971711397171, 'freqSlope': 0.084784740209579, 'freqTo': 271.31825978756, 'feedback': 0.77047368381297, 'freq': 0.65525512695313, 'feedbackSlope': 0.010041692256927, 'mulTo': 0.84707050323486, 'mulSlope': 0.088914043903351, 'feedbackTo': 1.1727996559275 );
)

(
~mod2Preset = ( 'mul': 0.77721283435822, 'freqSlope': 0.077247807979584, 'freqTo': 938.9463133812, 'feedback': 1.3370891481128, 'freq': 2.4459287643433, 'feedbackSlope': 0.069925731420517, 'mulTo': 0.81639413833618, 'mulSlope': 0.033315681219101, 'feedbackTo': 0.94268605943537 );
)

(
~mod2Preset = (freq: 6.5, freqTo: 0.3, freqSlope: 0.003, feedback: pi/2, feedbackTo: 0, feedbackSlope: 0.05, mul: 1, mulTo: 0.9, mulSlope: 0.1);
)

(
~mod2Preset = (freq: rrand(0.2, 5), freqTo: rrand(0.2, 1200), freqSlope: rrand(0.01, 0.1), feedback: rrand(0.0, 0.15), feedbackTo: rrand(0.0, 0.15), feedbackSlope: rrand(0.01, 0.1), mul: rrand(0.65, 0.85), mulTo: rrand(0.65, 0.85), mulSlope: rrand(0.01, 0.1));
)

(Ndef(\mod2, {
	SinOscFB.kr(
		freq: Phasor.kr(0.0, ~mod2Preset[\freqSlope], ~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqTo]) * (Ndef.kr(\mod3).linlin(-1,1,0.25,1)),
		feedback: Phasor.kr(0.0, ~mod2Preset[\feedbackSlope], ~mod2Preset[\feedback], ~mod2Preset[\feedbackTo], ~mod2Preset[\feedbackTo]) * SinOsc.kr(Ndef.kr(\mod1)),
		mul: Phasor.kr(0.0, ~mod2Preset[\mulSlope], ~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulTo])
	);
});)

(
Ndef(\mod3).fadeTime_(12);
)

(~mod3Preset = (carfreq: 0.1, carfreqTo: 0.6, carfreqSlope: 0.05, modfreq: 0.12, modfreqTo: 6.3, modfreqSlope: 0.15, pmindex: 0.6, pmindexTo: 1.2, pmindexSlope: 0.01, modphase: 0.01, modphaseTo: 0.0, modphaseSlope: 0.01,  mul: 0.95, mulTo: 0.99, mulSlope: 0.01);)

(~mod3Preset = (carfreq: 1.5, carfreqTo: 0.115, carfreqSlope: 0.01, modfreq: 0.5, modfreqTo: 6, modfreqSlope: 0.05, pmindex: 2, pmindexTo: 10, pmindexSlope: 0.5, modphase: 0.0, modphaseTo: 0.0, modphaseSlope: 0.01, mul: 1, mulTo: 0.99, mulSlope: 0.001);)

(
~mod3Preset = (carfreq: rrand(0.05,0.3), carfreqTo: rrand(0.05,0.3), carfreqSlope: rrand(0.01,0.1), modfreq: rrand(1.0, 600), modfreqTo: rrand(1.0, 1060), modfreqSlope: rrand(0.01, 0.1), pmindex: rrand(0.25, 3), pmindexTo: rrand(0.25, 123), pmindexSlope: rrand(0.01, 0.1), modphase: rrand(0.0, 2pi), modphaseTo: rrand(0.0, 2pi), modphaseSlope: rrand(0.01, 0.1), mul: rrand(0.85,1), mulTo: rrand(0.85,1), mulSlope: rrand(0.01,0.1));
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

(
~variation13Preset = (amp: 0.6, atk: 0.0001, dcy: 0.1, stn: 1, rls: 1.2, factor1: 5, denom1: 4, factor2: 4, denom2: 3, size: 10, hpf: 60, iter: 17);
)

(
~variation13Preset = (amp: 0.6, atk: 0.0001, dcy: 0.1, stn: 1, rls: 1.2, factor1: rrand(5, 20), denom1: rrand(3, 8), factor2: rrand(3,20), denom2: rrand(1,3), size: rrand(6, 10), hpf: 160, iter: rrand(3,20));
)


Ndef(\variation13).fadeTime_(26);

(
Ndef(\variation13, {
     var sig, env, a;
	env = EnvGen.ar(Env.adsr(~variation13Preset[\atk], ~variation13Preset[\dcy], ~variation13Preset[\stn], ~variation13Preset[\rls]));
     sig = {
		a = LFSaw.ar(~variation13Preset[\factor1]/~variation13Preset[\denom1]);
         ~variation13Preset[\iter].do{
			a = BAllPass.ar(a, Ndef.kr(\mod1).linlin(-1,1,30,400).sum /*30*/, Ndef.kr(\mod3).sum.abs /*0.7*/);
			a = (a * LFNoise0.kr(~variation13Preset[\factor2]/~variation13Preset[\denom2], Ndef.kr(\mod2).sum.range(1.2, 2.8) /*3*/, 1)).tanh;
             a = LeakDC.ar(a, 0.997)
         };
		a / (~variation13Preset[\size] * 1.25);
     } ! ~variation13Preset[\size];
	sig = HPF.ar(sig, ~variation13Preset[\hpf]);
	sig = Splay.ar(sig, 0.99) * ~variation13Preset[\amp] * 0.9 * env;
	// Limiter.ar(sig, 0.7);
	sig;
});
)

Ndef(\variation13).play(2);

Ndef(\variation13).release(0);