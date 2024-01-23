Ndef(\sjj).fadeTime_(3);

(
~sjjPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.5);
)

(
~sjjPreset = (planetDrone_1a: rrand(0.01, 0.99), planetDrone_2a: rrand(0.1, 0.95), planetDrone_3a: rrand(0.1, 1), planetDrone_4a: rrand(0.1, 0.9), planetDrone_1b: rrand(0.1, 1), planetDrone_2b: rrand(0.1, 0.95), planetDrone_3b: rrand(0.1, 0.92), planetDrone_4b: rrand(0.1, 0.9),  planetDrone_effect_1: rrand(0.1, 0.93), planetDrone_effect_2: rrand(0.1, 0.925), planetDrone_effect_3: rrand(0.1, 0.9625), hz: rrand(65.41, 300), amp: 0.5);
)

(
Ndef(\sjj, {
	var sig;
	sig = tanh(
		3 * GVerb.ar(
			HPF.ar(
				PinkNoise.ar(0.08 + LFNoise1.kr(0.3, 0.02)) + LPF.ar(Dust2.ar(LFNoise1.kr(0.2).range(40, 50)), 6600 + (~sjjPreset[\planetDrone_3a] * 5500)),
				100
			),
			250, 100 - abs(~sjjPreset[\planetDrone_1a] * 75), 0.25, drylevel:0.3
		) * Line.kr(0, 1, 10)
	);
	sig = sig + (
		GVerb.ar(
			LPF.ar(
				10 * HPF.ar(PinkNoise.ar(LFNoise1.kr(3).clip(0, 1) * LFNoise1.kr(2).clip(0, 1) ** 1.8), 20 + (~sjjPreset[\planetDrone_4a] * 15))
				,LFNoise1.kr(1).exprange(100, 2500)
			).tanh,
			270, 30, 0.7, drylevel: 0.6 + (~sjjPreset[\planetDrone_2a]*3)
		) * Line.kr(0, 0.7, 30)
	);
	sig = FreqShift.ar(sig, 0 + ~sjjPreset[\planetDrone_effect_1] * 550) / ((2..8) + SinOsc.ar(
		freq: 0.00025 + (~sjjPreset[\planetDrone_effect_3]),
		phase: 0.0,
		mul: ~sjjPreset[\planetDrone_effect_2] * 0.3,
		add: 0.0) );
	sig = Splay.ar(sig, 1)* ~sjjPreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\sjj).play(0);

Ndef(\sjj).clear(1);