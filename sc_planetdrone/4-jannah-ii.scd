Ndef(\jii).fadeTime_(3);

(
~jiiPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,   revmix: 0.3, revroom: 0.25, fshift: 0.0625, amp: 0.5);
)

(
~jiiPreset = (planetDrone_1a: rrand(0.01, 0.99), planetDrone_2a: rrand(0.1, 0.95), planetDrone_3a: rrand(0.1, 1), planetDrone_4a: rrand(0.1, 0.9),  revmix: rrand(0.1, 0.93), revroom: rrand(0.1, 0.925), fshift: rrand(0.1, 0.9625), hz: rrand(65.41, 300), amp: 0.5);
)

(
Ndef(\jii, {

	var sig, panpos, panlev,
	seed = thisThread.randSeed = 100000000.rand.debug('seed'),
	gamma= {[rrand(30, 50), rrand(50, 70), rrand(50, 70), rrand(70, 100)].choose.midicps * LFNoise2.kr(1, 0.01, 1)}!24,
	pd_1a = ~jiiPreset[\planetDrone_1a] * 10,
	pd_2a = ~jiiPreset[\planetDrone_2a] * 0.5,
	pd_3a = ~jiiPreset[\planetDrone_3a] * 0.5,
	pd_4a = ~jiiPreset[\planetDrone_4a] * 0.25;

	sig = LPF.ar(
		10 * HPF.ar(PinkNoise.ar(LFNoise1.kr(3).clip(0, 1) * LFNoise1.kr(2).clip(0, 1) ** 1.8), 20 + (~sjjPreset[\planetDrone_4a] * 15))
		,LFNoise1.kr(1).exprange(100, 2500)
	).tanh;
	sig = FreeVerb.ar(
		sig,
		0.12 + pd_1a,
		0.32,
		0.52
	);

	sig = BPeakEQ.ar(
		sig,
		[100.rrand(200), 1000.rrand(2000), 5000.rrand(7000), 10000.rrand(15000)],
		Array.rand(4, 0, 6),
		Array.rand(4, 0, 6)
	).mean;

	sig = LeakDC.ar(
		Normalizer.ar(
			sig,
			0.8,
			0.1
		)
	);

	panpos = LFNoise2.kr(0.1.exprand(10)).range(-0.25, 0.25) + pd_4a;

	panlev = SelectX.kr(
		[SinOsc,LFTri].choose.kr(2.rrand(25).reciprocal).range(0,2) - pd_2a,
		[
			0.7.rrand(1),
			LFGauss.kr(
				Latch.kr(
					LFNoise2.kr(1).range(1/5, 5.rrand(20)).reciprocal - pd_3a,
					Impulse.kr(LFNoise2.kr(3.rrand(10).reciprocal).range(0.5, 3.rrand(6)))
				),
				SinOsc.kr(3.rrand(15).reciprocal).range(0.07.rrand(0.16), 0.25.rrand(0.4))
			),
			0.1.rrand(0.5)
		]
	);
	sig = Pan2.ar(
		sig,
		panpos,
		panlev
	);
	sig = FreeVerb.ar(
		sig,
		mix: 0.05 + ~jiiPreset[\revmix],
		room: 0.25 + ~jiiPreset[\revroom],
		damp: LFNoise1.kr(1, 0.5, 0.5).linexp(0, 1, 0.1, 0.35));
	sig = FreqShift.ar(
		sig,
		freq: (0 + (~jiiPreset[\fshift] * 2)) / (1..17));
	sig = Splay.ar(sig, 1) * ~jiiPreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);


});
)

Ndef(\jii).play(0);

Ndef(\jii).clear(1);