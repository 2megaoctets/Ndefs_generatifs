Ndef(\rungler).fadeTime_(18);

(
Ndef(\mod1).fadeTime_(12);
)

(~mod1Preset = (freq: 0.1, freqTo: 0.5, freqSlope: 0.01, iphase: 0.0, iphaseTo: 0.5, iphaseSlope: 0.01, width: 0.33, widthTo: 0.85, widthSlope: 0.01, mul: 0.85, mulTo: 0.85, mulSlope: 0.01);)

(~mod1Preset = (freq: 0.65, freqTo: 3, freqSlope: 0.01, iphase: 0.65, iphaseTo: 0.15, iphaseSlope: 0.01, width: 0.99, widthTo: 0.45, widthSlope: 0.03, mul: 0.9, mulTo: 0.8, mulSlope: 0.01);)

(~mod1Preset = (freq: rrand(0.2, 3), freqTo: rrand(0.2, 3), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.0, 1), iphaseTo: rrand(0.0, 1), iphaseSlope: rrand(0.01, 0.1), width: rrand(0.45, 1), widthTo: rrand(0.45, 1), widthSlope: rrand(0.01, 0.1), mul: rrand(0.85, 1), mulTo: rrand(0.85, 1), mulSlope: rrand(0.01, 0.1));)

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

(
Ndef(\mod2).fadeTime_(12);
)

(~mod2Preset = (freq: 1.75, freqTo: 0.175, freqSlope: 0.01, phase: 0.0, phaseTo: 0.0, phaseSlope: 0.01, mul: 1, mulTo: 1, mulSlope: 0.01);)

(~mod2Preset = (freq: 0.66, freqTo: 0.165, freqSlope: 0.001, phase: pi/2, phaseTo: 0, phaseSlope: 0.001, mul: 0.85, mulTo: 0.95, mulSlope: 0.005);)

(~mod2Preset = (freq: 1, freqTo: 0.1, freqSlope: 0.001, phase: 0.0, phaseTo: 0.0, phaseSlope: 0.01, mul: 1, mulTo: 0.95, mulSlope: 0.005);)

(~mod2Preset = (freq: rrand(0.1, 3), freqTo: rrand(0.1, 2), freqSlope: rrand(0.01, 0.1), phase: rrand(0, pi), phaseTo: rrand(0, pi), phaseSlope: rrand(0.01, 0.1), mul: rrand(0.85, 0.95), mulTo: rrand(0.85, 0.95), mulSlope: rrand(0.01, 0.1));)

(
Ndef(\mod2, {
	SinOsc.kr(
		freq: Phasor.kr(0.0, ~mod2Preset[\freqSlope], ~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqTo]) +  (Ndef(\mod1) * 0.25 + 0.75),
		phase: Phasor.kr(0.0, ~mod2Preset[\phaseSlope], ~mod2Preset[\phase], ~mod2Preset[\phaseTo], ~mod2Preset[\phaseTo]).mod(pi), // radians, 0..8pi
		mul: Phasor.kr(0.0, ~mod2Preset[\mulSlope], ~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulTo])
	)
})
)

(
Ndef(\mod3).fadeTime_(12);
)

(~mod3Preset = (carfreq: 0.1, carfreqTo: 0.6, carfreqSlope: 0.05, modfreq: 0.12, modfreqTo: 6.3, modfreqSlope: 0.15, pmindex: 0.6, pmindexTo: 1.2, pmindexSlope: 0.01, modphase: 0.01, modphaseTo: 0.0, modphaseSlope: 0.01,  mul: 0.95, mulTo: 0.99, mulSlope: 0.01);)

(~mod3Preset = (carfreq: 1.5, carfreqTo: 0.115, carfreqSlope: 0.01, modfreq: 0.5, modfreqTo: 6, modfreqSlope: 0.05, pmindex: 2, pmindexTo: 10, pmindexSlope: 0.5, modphase: 0.0, modphaseTo: 0.0, modphaseSlope: 0.01, mul: 1, mulTo: 0.99, mulSlope: 0.001);)

(
~mod3Preset = (carfreq: rrand(0.5,3), carfreqTo: rrand(0.5,3), carfreqSlope: rrand(0.01,0.1), modfreq: rrand(1.0, 60), modfreqTo: rrand(1.0, 60), modfreqSlope: rrand(0.01, 0.1), pmindex: rrand(0.25, 3), pmindexTo: rrand(0.25, 3), pmindexSlope: rrand(0.01, 0.1), modphase: rrand(0.0, 2pi), modphaseTo: rrand(0.0, 2pi), modphaseSlope: rrand(0.01, 0.1), mul: rrand(0.85,1), mulTo: rrand(0.85,1), mulSlope: rrand(0.01,0.1));
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
~runglerPreset = (amp: 0.2, spread: 0.3, attack: 0.001, release: 1.4, sustain: 1, curve: (-4), envPow: 1, lfoTrigRate: 0.4, tu: 24, ffreq: 24, gate: 1, doneAction: 2);
// default
)

(
~runglerPreset = ( 'sustain': 1, 'spread': 0.024839186668396, 'release': 1.9842470645905, 'lfoTrigRate': 0.25718367099762, 'envPow': 1.0567637443542, 'amp': 0.2, 'ffreq': 34.63054275513, 'curve': -2, 'tu': 7.5839493274689, 'attack': 0.050888548016548 );
)

(
~runglerPreset = ( 'sustain': 1, 'spread': 0.28134504079819, 'release': 9.4825898170471, 'lfoTrigRate': 0.50979968309402,  'envPow': 0.98303428888321, 'amp': 0.2, 'ffreq': 24.855098724365, 'curve': -4, 'tu': 15.518655776978, 'attack': 0.01711200273037 );
)

(
~runglerPreset = ( 'sustain': 1, 'spread': 0.19752838850021, 'release': 1.5388622999191, 'lfoTrigRate': 0.72720127105713, 'envPow': 0.84595999717712, 'amp': 0.2, 'ffreq': 1210.51501846313, 'curve': -3, 'tu': 23.242499351501, 'attack': 0.083144748568535 );
)

(
~runglerPreset = (amp: 0.2, spread: rrand(0.01, 0.5), attack: rrand(0.001, 0.1), release: rrand(1.4, 10), sustain: 1, curve: rrand(-4, 2), envPow: rrand(0.6, 1.1), lfoTrigRate: rrand(0.1, 0.8), tu: rrand(4.0, 42), ffreq: rrand(24.0, 440));
// rrand
)


(
Ndef(\rungler, {
    var rungler, lfo, snd, runglerOut, globalEnv;


	globalEnv = EnvGen.ar(Env.asr(~runglerPreset[\attack], ~runglerPreset[\sustain], ~runglerPreset[\release], ~runglerPreset[\curve])).pow(~runglerPreset[\envPow]);

    lfo = {
        var trigger;
		trigger = Dust.ar(~runglerPreset[\lfoTrigRate] * Ndef.kr(\mod1).pow(2));
        Select.ar(ToggleFF.ar(trigger), [
			LFNoise2.ar(TExpRand.ar(0.5 * Ndef.kr(\mod2).pow(2), 10 * Ndef.kr(\mod1).pow(2), trigger)),
            TRand.ar(-1, 1, trigger),
        ]);
    };

    rungler = { |dataSignal, clockSignal|
        var numBits, bits, bit, out, doDAC;
        doDAC = { |bits|
            var result;
            result = bits[0] + (bits[1] * 2) + (bits[2] * 4);
            result = result / 7;
            result = (result * 2) - 1;
            result;
        };
        bit = dataSignal > 0;
        numBits = 8;
        bits = [];
        numBits.do {
			bit = Latch.ar(bit, clockSignal * Pulse.kr(Ndef.kr(\mod3)).linlin(-1, 1, 0.75, 1));
            bits = bits.add(bit);
            bit = Delay1.ar(bit);
        };
        (
            out: doDAC.(bits[numBits - 3..numBits - 1]),
            outReverse: doDAC.(bits[numBits - 2..numBits - 4]),
        );
    };
    snd = LocalIn.ar(2);
    runglerOut = rungler.(snd[0], snd[1]);
    snd = [runglerOut[\out], runglerOut[\outReverse]];
	snd = LFTri.ar(({ lfo.() } ! 2).linexp(-1, 1, [10, 1], 8000) * (snd * ~runglerPreset[\tu]).midiratio);
    LocalOut.ar(LeakDC.ar(Sanitize.ar(snd)));
    snd = (snd[0] > snd[1]) - 0.5;
	snd = MoogFF.ar(snd, ({ lfo.() } ! 2).linexp(-1, 1, 100, 8000) * (runglerOut[\out] * (~runglerPreset[\ffreq] * Ndef.kr(\mod3).linlin(-1, 1, 0.5, 1))).midiratio, 3);
	snd = Splay.ar(snd, ~runglerPreset[\spread]);
    snd = snd * globalEnv * -10.dbamp;
	// OffsetOut.ar(out, snd * amp);
	snd = snd * ~runglerPreset[\amp];
	snd = Limiter.ar(HPF.ar(snd, 70), 0.9);
});
)

Ndef(\rungler).fadeTime_(16);

Ndef(\rungler).play(2);

Ndef(\rungler).release(12);
