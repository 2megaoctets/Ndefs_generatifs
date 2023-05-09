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

	pink1 = { PinkNoise.ar().range(0.08, 0.12) } ! 2;
    sig1 = 0.5 * LeakDC.ar(Median.ar(2, Limiter.ar(99999999*(SawDPW.ar(pink1, 0) + SawDPW.ar(pink1, pi)), 0.9)));

	pink2 = { PinkNoise.ar().range(0.0999/3, 0.1001/3) } ! 2;
    sig2 = 0.5*LeakDC.ar(Median.ar(5, Limiter.ar(99999999*(SawDPW.ar(pink2, 0) + SawDPW.ar(pink2, pi)), 0.9)));

	pink3 = { PinkNoise.ar().range(0.00999, 0.01001) } ! 2;
    sig3 = 0.5 * Median.ar(20, Limiter.ar(999999*LeakDC.ar(SawDPW.ar(pink3, 0+(pi/2)) + SawDPW.ar(pink3, pi+(pi/2))), 0.1));

	sig4 = 0.5 * Median.ar(
		max(1, ~floatingPointErrorsPreset[\med4]),
		Limiter.ar(99999999*LeakDC.ar((SinOsc.ar(0.005, 0) + SinOsc.ar(0.005, pi)), 0.05))
	) ! 2;

	sig5 = 0.5 * SVF.ar((
		Median.ar(
			max(1, ~floatingPointErrorsPreset[\med5]),
			Limiter.ar(999999*LeakDC.ar(LFPulse.ar(0.5, 0) + LFPulse.ar(0.5, pi)), 0.6)
		)
	), 800) ! 2;

	// sig = sig1 + sig2 + sig3 + sig4 + sig5;
    sig = sig1 + sig2 + sig3 + sig4 + sig5;
	sig = sig * ~floatingPointErrorsPreset[\amp];
    sig = Limiter.ar(sig, 0.6);
	sig = sig * globalEnv;
});
)

Ndef(\floatingPointErrors).fadeTime_(16);

Ndef(\floatingPointErrors).play(2);

Ndef(\floatingPointErrors).release(32);

Ndef(\floatingPointErrors).clear;

