
(
~jiiPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
Ndef(\jii, {

	var seed = thisThread.randSeed = 100000000.rand.debug('seed'),
	gamma= {[rrand(30, 50), rrand(50, 70),
		rrand(50, 70), rrand(70, 100)].choose.midicps*LFNoise2.kr(1, 0.01, 1)}!24,
	pd_1a = ~jiiPreset[\planetDrone_1a] * 10, pd_2a = ~jiiPreset[\planetDrone_2a] * 0.5, pd_3a = ~jiiPreset[\planetDrone_3a] * 0.5, pd_4a = ~jiiPreset[\planetDrone_4a] * 0.25, sig;

	sig = FreqShift.ar(

		FreeVerb.ar(

			Pan2.ar(
				LeakDC.ar(
					Normalizer.ar(
						BPeakEQ.ar(
							FreeVerb.ar(
								Splay.ar(RLPF.ar(LFSaw.ar(gamma)/4,gamma*LFCub.kr(rrand(0.01, 0.1), 0, 2, 3), LFNoise2.kr(1/8, 0.6, 0.7))),
								0.12 + pd_1a,0.32,0.52
							),
							[100.rrand(200), 1000.rrand(2000), 5000.rrand(7000), 10000.rrand(15000)], Array.rand(4, 0, 6),Array.rand(4, 0, 6)
						).mean,
						0.8, 0.1
					)
				),
				LFNoise2.kr(0.1.exprand(10)).range(-0.25, 0.25) + pd_4a,
				SelectX.kr(
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
				),
			),

			0.05 + ~jiiPreset[\planetDrone_effect_1], 0.25 + ~jiiPreset[\planetDrone_effect_2], 1),

		(0 + (~jiiPreset[\planetDrone_effect_3] * 2)) / (1..17));
	sig = Splay.ar(sig, 1) * ~jiiPreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);


});
)

Ndef(\jii).play(0);

Ndef(\jii).clear(1);