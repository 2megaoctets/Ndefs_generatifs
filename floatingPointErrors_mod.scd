// 3105 pas fini  : graphe, mod1

(
Ndef(\mod1).fadeTime_(2);
)

(~mod1Preset = (freq: , freqTo: , freqSlope: , iphase: , iphaseTo: , iphaseSlope: , width: , widthTo: , widthSlope: , mul: , mulTo: , mulSlope: );)

(~mod1Preset = (freq: , freqTo: , freqSlope: , iphase: , iphaseTo: , iphaseSlope: , width: , widthTo: , widthSlope: , mul: , mulTo: , mulSlope: );)

(~mod1Preset = (freq: rrand(0.2, 3), freqTo: rrand(0.2, 3), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.0, 1), iphaseTo: rrand(0.0, 1), iphaseSlope: rrand(0.01, 0.1), width: rrand(0.45, 1), widthTo: rrand(0.45, 1), widthSlope: rrand(0.01, 0.1), mul: rrand(0.78, 1), mulTo: rrand(0.75, 1), mulSlope: rrand(0.01, 0.1));)

(
Ndef(\mod1, {
	LFPulse.kr(
		freq: Phasor.kr(0.0, ~mod1Preset[\freqSlope], ~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqTo]),
		iphase: Phasor.kr(0.0, ~mod1Preset[\iphaseSlope], ~mod1Preset[\iphase], ~mod1Preset[\iphaseTo], ~mod1Preset[\iphaseTo]) * SinOsc.kr(Ndef.kr(\mod2).cos), // 0..1
		width: Phasor.kr(0.0, ~mod1Preset[\widthSlope], ~mod1Preset[\width], ~mod1Preset[\widthTo], ~mod1Preset[\widthTo]),
		mul: Phasor.kr(0.0, ~mod1Preset[\mulSlope], ~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulTo])
	);
})
)

(
Ndef(\mod2).fadeTime_(12);
)

(~mod2Preset = (freq: , freqTo: , freqSlope: , phase: , phaseTo: , phaseSlope: , mul: , mulTo: , mulSlope: );)

(~mod2Preset = (freq: , freqTo: , freqSlope: , phase: , phaseTo: , phaseSlope: , mul: , mulTo: , mulSlope: );)

(~mod2Preset = (freq: , freqTo: , freqSlope: , phase: , phaseTo: , phaseSlope: , mul: , mulTo: , mulSlope: );)

(~mod2Preset = (freq: rrand(0.2, 3), freqTo: rrand(0.2, 2), freqSlope: rrand(0.01, 0.1), phase: rrand(0, pi), phaseTo: rrand(0, pi), phaseSlope: rrand(0.01, 0.1), mul: rrand(0.65, 0.95), mulTo: rrand(0.65, 0.95), mulSlope: rrand(0.01, 0.1));)

(
Ndef(\mod2, {
	SinOsc.kr(
		freq: Phasor.kr(0.0, ~mod2Preset[\freqSlope], ~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqTo]) +  (Ndef(\mod1)).cos,
		phase: Phasor.kr(0.0, ~mod2Preset[\phaseSlope], ~mod2Preset[\phase], ~mod2Preset[\phaseTo], ~mod2Preset[\phaseTo]).mod(pi), // radians, 0..8pi
		mul: Phasor.kr(0.0, ~mod2Preset[\mulSlope], ~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulTo])
	)
})
)

(
Ndef(\mod3).fadeTime_(12);
)

(~mod3Preset = ;)

(
Ndef(\mod3, {})
)

(
~floatingPointErrorsPreset = ( out: 0, amp: 0.061, attack: 0, release: 1.4, sustain: 1, curve: (-4), envPow: 1, med4: 30, med5: 50);
)

(
~floatingPointErrorsPreset = ( out: 0, amp: 0.061, attack: 0, release: 1.4, sustain: 1, curve: (-4), envPow: 1, med4: 3, med5: 5);
)

(
~floatingPointErrorsPreset = ( out: 0, amp: 0.061, attack: 0, release: 1.4, sustain: 1, curve: (-4), envPow: 1, med4: 1.3, med5: 13.5);
)

(
~floatingPointErrorsPreset = ( out: 0, amp: 0.061, attack: 0, release: 1.4, sustain: 1, curve: (-4), envPow: 1, med4: 21, med5: 1.2);
)

(
~floatingPointErrorsPreset = (amp: 0.061, attack: 0, release: rrand(0.9, 1.7), sustain: rrand(0.9, 1.2), curve: (-4), envPow: 1, med4: rrand(3.0,20), med5: rrand(1.0, 15));
)

(
Ndef(\floatingPointErrors, {
    var sig, sig1, pink1, sig2, pink2, sig3, pink3, sig4, sig5, globalEnv;

	globalEnv = EnvGen.ar(
		Env.asr(
			~floatingPointErrorsPreset[\attack],
			1,
			~floatingPointErrorsPreset[\release],
			~floatingPointErrorsPreset[\curve]
		),
		timeScale: ~floatingPointErrorsPreset[\sustain]
	).pow(~floatingPointErrorsPreset[\envPow]);

	pink1 = { PinkNoise.ar().range(1 /*0.08*/, 0.12) } ! 2;
    sig1 = 0.5 * LeakDC.ar(Median.ar(2, Limiter.ar(99999999*(SawDPW.ar(pink1, 0) + SawDPW.ar(pink1, pi)), 0.9)));

	pink2 = { PinkNoise.ar().range(0.0999/3, 0.1001/3 * Ndef.kr(\mod2)) } ! 2;
    sig2 = 0.5*LeakDC.ar(Median.ar(5, Limiter.ar(99999999*(SawDPW.ar(pink2, 0) + SawDPW.ar(pink2, pi)), 0.9)));

	pink3 = { PinkNoise.ar().range(0.00999, 0.01001 + Ndef.kr(\mod1)) } ! 2;
	// sig3 = 0.5 * Median.ar(20, Limiter.ar(999999*LeakDC.ar(SawDPW.ar(pink3, 0+(pi/2)) + SawDPW.ar(pink3 , pi+(pi/2))), 0.1));
	sig3 = /*0.5 * */Median.ar((20 * (Ndef.kr(\mod1) + Ndef.kr(\mod2).cos)), Limiter.ar(999999*LeakDC.ar(SawDPW.ar(pink3, 0+(pi/2)) + SawDPW.ar(pink3 , pi+(pi/2))), 0.1)) ;

	sig4 = 0.5 * Median.ar(
		min(1, ~floatingPointErrorsPreset[\med4] + Ndef.kr(\mod2).cos),
		Limiter.ar(99999999*LeakDC.ar((SinOsc.ar(0.005, 0) + SinOsc.ar(0.005 * Ndef.kr(\mod1), pi)), 0.05))
	) ! 2;

	sig5 = 0.5 * SVF.ar((
		Median.ar(
			// max(1, ~floatingPointErrorsPreset[\med5] + Ndef.kr(\mod1)),
			max(1, ~floatingPointErrorsPreset[\med5] + Ndef.kr(\mod1)),
			Limiter.ar(999999*LeakDC.ar(LFPulse.ar(0.5, 0) + LFPulse.ar(0.5 * Ndef.kr(\mod2).cos, pi)), 0.6)
		)
	), 800) ! 2;

	// sig = sig1 + sig2 + sig3 + sig4 + sig5;
    sig = sig1 + sig2  + sig3 + sig4 + sig5;
	sig = sig * ~floatingPointErrorsPreset[\amp];
    sig = Limiter.ar(sig, 0.6);
	sig = sig * globalEnv;
});
)

Ndef(\floatingPointErrors).fadeTime_(1);

Ndef(\floatingPointErrors).play(2);

Ndef(\floatingPointErrors).release(32);

Ndef(\floatingPointErrors).clear;

