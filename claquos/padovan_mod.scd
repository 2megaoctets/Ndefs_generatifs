// sept23 revoir graphes et mods

(
Ndef(\mod1).fadeTime_(17);
)

(
~mod1Preset = (freq: 0.4, rate: 6, depth: 0.2, delay: 0.0, onset: 0.0, rateVariation: 0.04, depthVariation: 0.1, iphase: 0.0);
)

(
~mod1Preset = (freq: 0.04, rate: 1, depth: 0.32, delay: 0.20, onset: 0.0, rateVariation: 0.04, depthVariation: 0.1, iphase: 0.0);
)

(
~mod1Preset = (freq: rrand(0.1, 1), rate: rrand(0.1, 20), depth: 0.2, delay: 0.12, onset: 0.0, rateVariation: 0.014, depthVariation: rrand(0.01, 0.1), iphase: 0.0);
)

(
Ndef(\mod1, {
	Vibrato.kr(
		freq: Phasor.kr(start: ~mod1Preset[\freq], end: ~mod1Preset[\rate], rate: 0.1, resetPos: ~mod1Preset[\rate]),
		rate: ~mod1Preset[\rate] + (Ndef.kr(\mod2) * 0.5 + 0.5),
		depth: ~mod1Preset[\depth],
		delay: ~mod1Preset[\delay] * (Ndef.kr(\mod2) * 0.5 + 0.5),
		onset: ~mod1Preset[\onset],
		rateVariation: Phasor.kr(rate: 0.1, start: 1 / ~mod1Preset[\rateVariation], end: ~mod1Preset[\rateVariation], resetPos: ~mod1Preset[\rateVariation]),
		depthVariation: LFNoise1.kr(~mod1Preset[\depthVariation], 0.5, 0.5),
		iphase: ~mod1Preset[\iphase]
	)
});
)

(
Ndef(\mod2).fadeTime_(7);
)

(
~mod2Preset = (freq: , phase: , mul:);
)

(
~mod2Preset = (freq: , phase: , mul:);
)

(
~mod2Preset = (freq: rrand(0.1, 1), phase: rrand(0.0, 1), mul: 0.85);
)

(
Ndef(\mod2, {
	SinOsc.kr(
		freq: Phasor.kr(end: ~mod2Preset[\freq], start: ~mod2Preset[\freq] * (Ndef.kr(\mod1) * 0.5 + 0.5), rate: 0.1, resetPos: ~mod2Preset[\freq]),
		phase: Phasor.kr(rate: 0.1, start: 0, end: ~mod2Preset[\phase], resetPos: ~mod2Preset[\phase]),
		mul: ~mod2Preset[\mul]
	);
});
)

(
Ndef(\mod3).fadeTime_(7);
)

(
~mod3Preset = (freq: rrand(0.05, 1), mul: 0.25);
)

(
Ndef(\mod3, {
	LFNoise1.kr(
		freq: ~mod3Preset[\freq],
		mul: ~mod3Preset[\mul],
	);
});
)

(
~padovanPreset = (amp: 0.0121, tridDur: 1, freq: 165, roomSize: 9)
// default
)

(
~padovanPreset = ( 'roomSize': 3.6036995053291, 'freq': 245.55842895508, 'tridDur': 0.65141571164131, 'amp': 0.01521 );
)

(
~padovanPreset = ( 'roomSize': 8.4315677285194, 'freq': 124.36461868286, 'tridDur': 0.86605371832848, 'amp': 0.021 );
)

(
~padovanPreset = ( 'roomSize': 5.2112172245979, 'freq': 299.78749885559, 'tridDur': 0.8859096467495, 'amp': 0.021) ;
)

(
~padovanPreset = (amp: 0.021, tridDur: rrand(0.165, 1), freq: rrand(165, 320.2), roomSize: rrand(0.05, 9))
// rrand
)

// module GVerb !
(
Ndef(\padovan, {

	var sig, env, input, mod, grainTr, sinMod;
	env = EnvGen.ar(Env.asr(0,1, 1, 5));
	sig = SinOsc;
	mod = Trig.ar(
		Saw.ar(~padovanPreset[\freq] ),
		~padovanPreset[\tridDur]
	);
	grainTr = sig.ar(mod * ~padovanPreset[\freq] /** cos(Ndef.kr(\mod1) * 0.5 + 0.5)*/);
	sinMod = sig.ar(mod + (Ndef.kr(\mod2) * 0.5 + 0.5));
	sig = GrainIn.ar(1, grainTr, grainTr * Ndef.kr(\mod2) / 2, sinMod, mod * sinMod, -1, mul: env);

	sig = GVerb.ar(
		in: sig,
		roomsize: ~padovanPreset[\roomSize],
		damping: SinOsc.kr(Ndef.kr(\mod2) * 0.5 + 0.5 , pi/2, 0.5, 0.5),
		inputbw: SinOsc.kr(Ndef.kr(\mod3) * 0.5 + 0.5, pi, 0.25, 0.5),
		earlyreflevel: LFNoise1.kr(0.5, 0.5, 0.55),
		taillevel: LFNoise0.kr(0.25, 0.25, 0.5),
		mul: ~padovanPreset[\amp] * 0.5
	);
	sig = HPF.ar(sig.sum, 94);
	sig;
	// OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan));
});
)

Ndef(\padovan).fadeTime_(22);

Ndef(\padovan).clear;

Ndef(\padovan).play(2);

Ndef(\padovan).release(42);
