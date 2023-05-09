// Moduler Greyhole

(
~modelAixPreset = ( 'atk': 0.0010641890645027, 'pan': 0, 'revtSel': 1, 'out': 2, 'amp': 0.1, 'rls': 0.25551299858093, 'sustain': 1 )
)


(
~modelAixPreset = (out: 2, amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, revtSel: 0)
) // default

(
~modelAixPreset = ( 'atk': 0.00071098121404648, 'revtSel': 1, 'out': 2, 'amp': 0.1, 'rls': 0.16832694339752, 'sustain': 1 )
)

(
~modelAixPreset = ( 'atk': 0.0008523430109024, 'pan': 0, 'revtSel': 0, 'out': 2, 'amp': 0.1, 'rls': 0.16422292542458, 'sustain': 1 )
)

(
~modelAixPreset = (out: 2, amp: 0.1, pan: 0, atk: rrand(0.0005, 0.12), rls: rrand(0.162, 2.3), sustain: 1, revtSel: rrand(0,1))
) // rrand

(
~mod1Preset = (freq: 1, iphase: 0.0, width: 0.5, mul: 0.785, freqSlope: 10, iphaseSlope: 5, widthSlope: 15, mulSlope: 20);
)

(
~mod1Preset = (freq: rrand(0.25, 5), iphase: rrand(0.0, pi), width: rrand(0.45, 0.95), mul: rrand(0.25, 0.95), freqSlope: rrand(1.0, 18), iphaseSlope: rrand(0.0, pi*2), widthSlope: rrand(3.0, 25), mulSlope: rrand(2.0, 14));
)

(
Ndef(\mod1, {
	LFPulse.kr(
		freq: Line.kr(0, ~mod1Preset[\freq], ~mod1Preset[\freqSlope]),
		iphase: Line.kr(0.01, ~mod1Preset[\iphase], ~mod1Preset[\iphaseSlope]),
		// iphase: ~mod1Preset[\iphase],
		width: Line.kr(rrand(0.0, 0.2), ~mod1Preset[\width], ~mod1Preset[\widthSlope]),
		mul: Line.kr(0.01, ~mod1Preset[\mul], ~mod1Preset[\mulSlope])
	)
});
)

(
Ndef(\modelAix, {
	var snd, revt, revt1, revt2, revt3, env;

	env = EnvGen.kr(Env.asr(~modelAixPreset[\atk], 1, ~modelAixPreset[\rls]), timeScale: ~modelAixPreset[\sustain]);

	snd = Pulse.ar(freq: LFNoise0.ar([2,3] + ~mod1Preset[\freq]).exprange(50,5000), width: ~mod1Preset[\width]);
	snd = snd * LFPulse.ar(
		freq: LFNoise0.ar(1).exprange(0.5,8),
		width:Line.kr(0.02, 0.02 * Ndef.kr(\mod1) + ~mod1Preset[\width], ~mod1Preset[\widthSlope] * 10),
		mul: LFNoise1.ar(3).exprange(0.01,1000));
	snd = HPF.ar(snd, 50);

	// reverb time - various optons:
	revt1 = LFNoise0.ar(1).exprange(0.0001, 0.01) * ~mod1+Preset[\width];
	revt2 = LFTri.ar(0.0165, -1).exprange(1, 0.0001) * ~mod1Preset[\iphase];
	revt3 = LFTri.ar(1/10, 1).range(0.01, 0.0001) * ~mod1Preset[\freq];

	revt = Select.ar(~modelAixPreset[\revtSel], [revt1, revt2, revt3, K2A.ar(0.000001)]);
	snd = Greyhole.ar(
		snd * Ndef.kr(\mod1),
		revt * (~mod1Preset[\iphase] * 2),
		0.5 * (~mod1Preset[\width] + 1),
		revt * (~mod1Preset[\mul] * 3)
	);
	snd = Limiter.ar(snd, 0.9);
	snd = (snd * env * ~modelAixPreset[\amp]);
	// OffsetOut.ar(out, snd);
});
)

Ndef(\mod1).fadeTime_(12);

Ndef(\modelAix).play(2);

Ndef(\modelAix).release(18);

Ndef(\modelAix).fadeTime_(9);