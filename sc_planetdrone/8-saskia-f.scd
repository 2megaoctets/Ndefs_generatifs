Ndef(\sf).fadeTime_(2);

(
~sfPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1, planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1)
)


(
~sfPreset = (planetDrone_1a: rrand(0,0.8), planetDrone_2a: rrand(0,20.0), planetDrone_3a: rrand(0,0.81), planetDrone_4a: rrand(0.1,0.8), planetDrone_1b: rrand(0.13,0.76), planetDrone_2b: rrand(0.145,0.76), planetDrone_3b: rrand(0.12, 0.7), planetDrone_4b: rrand(0.1, 0.8), planetDrone_effect_1: rrand(0.03,0.8), planetDrone_effect_2: rrand(0.25, 0.76), planetDrone_effect_3: rrand(0.0625, 0.76), amp: 0.1)
)

// Ndef('sf'): wrapped channels from 5 to 1 channels

(
Ndef(\sf, {
	var sig, src, q;

	src = { |i|
		RLPF.ar(
			0.6 ** i * 40 * Impulse.ar(
				2**i/32 + ~sfPreset[\planetDrone_2a], // Impulse freq
				1 / 2 + ~sfPreset[\planetDrone_3a] // Impulse phase
			), // input
			4 ** LFNoise0.kr(
				( 1 / 16 + ~sfPreset[\planetDrone_3b].abs * 8) // LFNoise0 freq
			) * 300 + (~sfPreset[\planetDrone_1a] * 100), // freq
			5e-3 + (~sfPreset[\planetDrone_4a] * 0.025) // rq
		).sin * 2
	} ! 8;

	q = Splay.ar(src);

	2.do {
		q = FreeVerb2.ar(
			q[0], // in1
			q[1], // in2
			0.11 + ~sfPreset[\planetDrone_effect_1] + SinOsc.ar(0.125, 0, ~sfPreset[\planetDrone_4b] * 0.125), // mix
			0.85 + ~sfPreset[\planetDrone_effect_2], // room
			0.85 + ~sfPreset[\planetDrone_effect_3] // damp
		)
	};

	sig = CombC.ar(
		q,
		maxdelaytime: 1.5,
		delaytime: ~sfPreset[\planetDrone_1b].abs * 0.25,
		decaytime: ~sfPreset[\planetDrone_2b].abs * 2,
		mul: 1,
		add: 0.0
	);

	sig = FreqShift.ar(
		sig, // input
		abs(~sfPreset[\planetDrone_effect_3] * 6) / (2..6) // freq
	);
	sig = Splay.ar(sig, 1);
	sig = sig * ~sfPreset[\amp] * 0.35;
	sig = Limiter.ar(sig, 0.79, 0.2);

});
)

Ndef(\sf).play(0);

Ndef(\sf).clear(1);