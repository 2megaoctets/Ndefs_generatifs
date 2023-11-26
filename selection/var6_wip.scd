
(
Ndef(\mod1).fadeTime_(12);
)

(
~mod1Preset = (syncFreq: 20.1, syncFreqTo: 60.7, syncFreqSlope: 0.05, sawFreq: 433.0, sawFreqTo: 10.5, sawFreqSlope: 0.04, mul: 1, mulTo: 0.75, mulSlope: 0.065, LPFFreq: 1400.0, LPFFreqTo: 500, LPFFreqSlope: 0.012, LPFMul: 0.6, LPFMulTo: 0.75, LPFMulSlope: 0.05);
)

(
~mod1Preset = (syncFreq: 2, syncFreqTo: 4, syncFreqSlope: 0.015, sawFreq: 0.5, sawFreqTo: 1.6, sawFreqSlope: 0.025, mul: 1.0, mulTo: 1.0, mulSlope: 0.1, LPFFreq: 14000, LPFFreqTo: 40, LPFFreqSlope: 0.10, LPFMul: 0.10, LPFMulTo: 0.37, LPFMulSlope: 0.025);
)

(
~mod1Preset = (syncFreq: rrand(0.1, 200), syncFreqTo: rrand(0.01, 300), syncFreqSlope: rrand(0.01, 0.10), sawFreq: rrand(0.1, 100), sawFreqTo: rrand(0.1, 200.35), sawFreqSlope: rrand(0.01, 0.10), mul: rrand(0.45, 0.75), mulTo: rrand(0.45, 0.75), mulSlope: rrand(0.01, 0.10), LPFFreq: rrand(20.0, 8000), LPFFreqTo: rrand(20.0, 8000), LPFFreqSlope: rrand(0.01, 0.10), LPFMul: rrand(0.45, 0.95), LPFMulTo: rrand(0.45, 0.95), LPFMulSlope: rrand(0.01, 0.10));
)

(
Ndef(\mod1, {
	LPF.kr(
		SyncSaw.kr(
			syncFreq: Phasor.kr(start: ~mod1Preset[\syncFreq], end: ~mod1Preset[\syncFreqTo], rate: ~mod1Preset[\syncFreqSlope], resetPos: ~mod1Preset[\syncFreqTo]) + (Ndef.kr(\mod2) * 0.5 + 0.5),
			sawFreq: Phasor.kr(start: ~mod1Preset[\sawFreq], end: ~mod1Preset[\sawFreqTo], rate: ~mod1Preset[\sawFreqSlope], resetPos: ~mod1Preset[\sawFreqTo]) + cos(Ndef.kr(\mod3) * 0.25 + 0.25),
			mul: Phasor.kr(start: ~mod1Preset[\mul], end: ~mod1Preset[\mulTo], rate: ~mod1Preset[\mulSlope], resetPos: ~mod1Preset[\mulTo])
		),
		freq: Phasor.kr(start: ~mod1Preset[\LPFFreq], end: ~mod1Preset[\LPFFreqTo], rate: ~mod1Preset[\LPFFreqTo], resetPos: ~mod1Preset[\LPFFreqTo]),
		mul: Phasor.kr(start: ~mod1Preset[\LPFMul], end: ~mod1Preset[\LPFMulTo], rate: ~mod1Preset[\LPFMulSlope], resetPos: ~mod1Preset[\LPFMulTo])
	);
});
)

(Ndef(\mod2).fadeTime_(12);)

(
~mod2Preset = (freq: 0.5, freqTo: 20, freqSlope: 0.05, feedback: 0.1, feedbackTo: pi, feedbackSlope: 0.02, mul: 1, mulTo: 0.5, mulSlope: 0.05);
)

(
~mod2Preset = ( 'mul': 0.81274175643921, 'freqSlope': 0.096158572435379, 'freqTo': 0.9660120639801, 'feedback': 0.10402382119255, 'freq': 3.5919137954712, 'feedbackSlope': 0.054205282926559, 'mulTo': 0.76629991531372, 'mulSlope': 0.080954266786575, 'feedbackTo': 1.3974138039626 );
)

(
~mod2Preset = ( 'mul': 0.6971711397171, 'freqSlope': 0.084784740209579, 'freqTo': 271.31825978756, 'feedback': 0.77047368381297, 'freq': 20.65525512695313, 'feedbackSlope': 0.010041692256927, 'mulTo': 0.84707050323486, 'mulSlope': 0.088914043903351, 'feedbackTo': 1.1727996559275 );
)

(
~mod2Preset = ( 'mul': 0.77721283435822, 'freqSlope': 0.077247807979584, 'freqTo': 938.9463133812, 'feedback': 0.3370891481128, 'freq': 2.4459287643433, 'feedbackSlope': 0.069925731420517, 'mulTo': 0.81639413833618, 'mulSlope': 0.033315681219101, 'feedbackTo': 0.94268605943537 );
)

(
~mod2Preset = (freq: 6.5, freqTo: 0.3, freqSlope: 0.003, feedback: pi/2, feedbackTo: 0, feedbackSlope: 0.05, mul: 1, mulTo: 0.9, mulSlope: 0.1);
)

(
~mod2Preset = (freq: rrand(0.2, 1500), freqTo: rrand(0.2, 3200), freqSlope: rrand(0.01, 0.1), feedback: rrand(0.0, 0.15), feedbackTo: rrand(0.0, 0.15), feedbackSlope: rrand(0.01, 0.1), mul: rrand(0.65, 0.85), mulTo: rrand(0.65, 0.85), mulSlope: rrand(0.01, 0.1));
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

(~mod3Preset = (carfreq: 0.1, carfreqTo: 20.6, carfreqSlope: 0.05, modfreq: 0.12, modfreqTo: 16.3, modfreqSlope: 0.15, pmindex: 20.6, pmindexTo: 1.2, pmindexSlope: 0.01, modphase: 0.01, modphaseTo: 0.0, modphaseSlope: 0.01,  mul: 0.95, mulTo: 0.99, mulSlope: 0.01);)

(~mod3Preset = (carfreq: 1.5, carfreqTo: 20.115, carfreqSlope: 0.01, modfreq: 0.5, modfreqTo: 6, modfreqSlope: 0.05, pmindex: 2, pmindexTo: 10, pmindexSlope: 0.5, modphase: 0.0, modphaseTo: 0.0, modphaseSlope: 0.01, mul: 1, mulTo: 0.99, mulSlope: 0.0012);)

(
~mod3Preset = (carfreq: rrand(0.05,1000.012), carfreqTo: rrand(0.5,4300), carfreqSlope: rrand(0.001,0.01), modfreq: rrand(0.01, 320.600), modfreqTo: rrand(1.0, 310.60), modfreqSlope: rrand(0.01, 0.021), pmindex: rrand(0.25, 3), pmindexTo: rrand(0.025, 1.23), pmindexSlope: rrand(0.01, 0.1), modphase: rrand(0.0, pi), modphaseTo: rrand(0.0, pi), modphaseSlope: rrand(0.01, 0.1), mul: rrand(0.85,1), mulTo: rrand(0.85,1), mulSlope: rrand(0.01,0.1));
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


Ndef(\variation6).fadeTime_(28);

(
~variation6Preset = (amp: 0.3, atk: 0.0001, dcy: 0.1, stn: 1, rls: 1.2, iter: 7, size: 8, hpf: 64);
)

(
~variation6Preset = (amp: 0.3, atk: 0.0001, dcy: 0.1, stn: 1, rls: 1.2, iter: 6, size: 12, hpf: 104);
)

(
~variation6Preset = (amp: 0.6, atk: 0.0001, dcy: 0.31, stn: 1.3, rls: 1.2, iter: rrand(5,9), size: rrand(7,10), hpf: 194);
)


(
Ndef(\variation6, {
	var sig, env, a;
	env = EnvGen.ar(Env.adsr(~variation6Preset[\atk], ~variation6Preset[\dcy], ~variation6Preset[\stn], ~variation6Preset[\rls]));
	sig = {
		a = LFTri.ar(Ndef.kr(\mod1).linexp(-1, 1, 0.1, 1/3).sum /*1/3*/);
		~variation6Preset[\iter].do{
			a = BAllPass.ar(a, PinkNoise.kr(0.1, Ndef.kr(\mod2).linexp(-1,1,0.4,40).sum /*40*/), 1);
			a = BAllPass.ar(a, LFNoise0.kr(Ndef.kr(\mod3).linexp(-1,1,0.375,0.875).sum/*7/8*/, 2400, 2200), 2);
			a = (a * LFNoise0.kr(3/4, 1.4, 2)).tanh;
			a = LeakDC.ar(a)
		};
		a/(~variation6Preset[\size] * 1.25) /*10*/
	} ! (~variation6Preset[\size]) /*8*/ ;
	sig = HPF.ar(sig, ~variation6Preset[\hpf]);
	sig = Splay.ar(sig, 0.99) * ~variation6Preset[\amp] * 0.87 * env;
	// sig * 0.89;
});
)

Ndef(\variation6).play(2);

Ndef(\variation6).release(3);

Ndef(\variation6).clear;