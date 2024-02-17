(
~suPreset = (planetDrone_1a: 0.3, planetDrone_2a: 0.45, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.625, amp: 0.15);
)

(
Ndef(\su, {

	var src, loc, delay=0.01 + (~suPreset[\planetDrone_2a] * 0.012),
	src2, loc2, del2,
	src3, loc3, del3 = 1/4, sig, localIn, locFb, loc2Fb, loc3Fb;

	src = Decay2.ar(
		Impulse.ar(1/8),
		LFNoise2.kr(4).range(0.001,0.0001),
		LFNoise2.kr(4).range(0.005, 0.05)
	)!2 * Saw.ar(
		LFNoise2.kr(4).exprange(40, 3000)
	);
	localIn = LocalIn.ar(6);
	loc = BPF.ar(
		localIn[0..1] + [src, 0],
		LFNoise0.kr(1/4).range(10,907).lag,
		3.2
	);
	loc = GVerb.ar(
		loc,
		100,
		4,
		mul:0.02 + (~suPreset[\planetDrone_1a] * 6),
		add:loc
	);
	loc = Compander.ar(
		loc,
		loc,
		0.9,
		1,
		0.001
	);
	loc = (loc * 0.501).tanh;
	loc = Compander.ar(
		loc,
		loc,
		0.1,
		1,
		0.1
	);
	loc = DelayC.ar(
		loc,
		delay * 2,
		delay * 1
	);
	locFb = loc.reverse * (0.49 + (~suPreset[\planetDrone_effect_1] * 0.5));

	del2 = 1/100;
	src2 = Decay2.ar(
		TDuty.ar(
			1/4,
			0,
			Dseq([1, 0.5, 003, 0.1 + (~suPreset[\planetDrone_4a] * 1000)], inf)
		),
		LFNoise2.kr(4).range(0.001, 0.0001),
		LFNoise2.kr(4).range(0.005, 0.05)
	)!2 * Saw.ar(
		LFNoise2.kr(200).exprange(40, 10000)
	);
	loc2 = BPF.ar(
		localIn[2..3] + [src2, 0],
		LFNoise2.kr(0.1).range(40, 400),
		3.2
	);
	loc2 = GVerb.ar(
		loc2,
		100,
		4,
		mul:0.02 + (~suPreset[\planetDrone_3a] * 6),
		add:loc2
	);
	loc2 = Compander.ar(
		loc2,
		loc2,
		0.9,
		1,
		0.001
	);
	loc2 = (loc2 * 0.51).tanh;
	loc2 = Compander.ar(
		loc2,
		loc2,
		0.1,
		1,
		0.1
	);
	loc2 = DelayC.ar(
		loc2,
		del2 * 2,
		del2 * 1
	);
	loc2Fb = loc2.reverse * (0.45 + (~suPreset[\planetDrone_effect_2] * 100));

	src3 = Decay2.ar(
		Impulse.ar(1),
		0.0001,
		0.05
	) * SinOsc.ar(60);
	loc3 = src3 + localIn[4..5];
	loc3 = BPF.ar(
		loc3,
		800,
		3.2
	).softclip;
	loc3 = DelayN.ar(
		loc3,
		del3,
		[0, del3]
	);
	loc3Fb = loc3.reverse * (0.99 + (~suPreset[\planetDrone_effect_3] * 0.75));
	LocalOut.ar(LPF.ar(locFb ++ loc2Fb ++ loc3Fb, 800) * 0.092);
	sig = (loc * 0.15) + (Compander.ar(loc2, loc2, 0.1, 1, 0.05) * 0.15);
	sig = Mix.ar(Mix.ar(sig));
	sig = sig * ~suPreset[\amp] ;
	sig = Limiter.ar(sig, 0.5, 0.01);
	sig;
});
)

Ndef(\su).play(0);

Ndef(\su).clear(1);