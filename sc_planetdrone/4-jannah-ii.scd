// freqShifter et pan2 décalés
// passer BPeakEQ dans les args? Arrays de 4 freq, 4 rq, 4 db
// 0402 fabien: randseed

Ndef(\modJii).fadeTime_(7);

(
~modJiiPreset = (freqSlope: , freqStart: , freqEnd: , iphaseSlope: , iphaseStart: , iphaseEnd: , widthSlope: , widthStart: , widthEnd: );
)

(
~modJiiPreset = (freqSlope: 0.15, freqStart: rrand(0.2, 10), freqEnd: rrand(0.5, 30), iphaseSlope: 0.051, iphaseStart: rrand(0.0,0.5), iphaseEnd: rrand(0.0,1), widthSlope: 0.05, widthStart: rrand(0.25, 0.85), widthEnd: rrand(0.35, 0.75));
)


(
Ndef(\modJii, {
	SinOsc.kr(
		LFPulse.kr(
			Phasor.kr(0.0, ~modJiiPreset[\freqSlope], ~modJiiPreset[\freqStart], ~modJiiPreset[\freqEnd]),
			Phasor.kr(0.0, ~modJiiPreset[\iphaseSlope], ~modJiiPreset[\iphaseStart], ~modJiiPreset[\iphaseEnd]),
			Phasor.kr(0.0, ~modJiiPreset[\widthSlope], ~modJiiPreset[\widthStart], ~modJiiPreset[\widthEnd])
		)
	)
});
)

Ndef(\modJii2).fadeTime_(7);

(
(~modJii2Preset = (freqSlope: , freqStart: , freqEnd: , iphaseSlope: , iphaseStart: , iphaseEnd: ));
)

(
(~modJii2Preset = (freqSlope: 0.15, freqStart: rrand(0.2, 10), freqEnd: rrand(0.5, 20), iphaseSlope: 0.051, iphaseStart: rrand(0.0,pi/2), iphaseEnd: rrand(0.0,pi/2)));
)


(
Ndef(\modJii2, {
	LFCub.kr(
		Phasor.kr(0.0, ~modJii2Preset[\freqSlope], ~modJii2Preset[\freqStart], ~modJii2Preset[\freqEnd]),
		Phasor.kr(0.0, ~modJii2Preset[\iphaseSlope], ~modJii2Preset[\iphaseStart], ~modJii2Preset[\iphaseEnd])
	)
});
)

Ndef(\modJii).release;


Ndef(\jii).fadeTime_(7);

(
~jiiPreset = (verbMod: 0.13, select1: 0.145, select2: 0.2, panMod: 0.1, verbMix: 0.3, verbRoom: 0.25, fshift: 0.0625, amp: 0.1);
)

(
~jiiPreset = (verbMod: rrand(0.01, 0.99), select1: rrand(0.1, 0.95), select2: rrand(0.1, 1), panMod: rrand(0.1, 0.9), verbMix: rrand(0.1, 0.93), verbRoom: rrand(0.1, 0.925), fshift: rrand(0.1, 0.9625), hz: rrand(65.41, 300), amp: 0.1);
)

(
Ndef(\jii, {
var gamma, pd_1a = ~jiiPreset[\verbMod],
	pd_2a = ~jiiPreset[\select1] * 0.5,
	pd_3a = ~jiiPreset[\select2] * 0.5,
	pd_4a = ~jiiPreset[\panMod],
	sig, select;
	thisThread.randSeed = 100000000; // anciennement stocké dans une var, dont on n'a pas besoin

	gamma= {[rrand(30, 50), rrand(50, 70), rrand(50, 70), rrand(70, 100)].choose.midicps * LFNoise2.kr(1, 0.01, 1)} ! 24;


	select = SelectX.kr(
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

	sig = RLPF.ar(
		LFSaw.ar(gamma)/4,
		gamma * LFCub.kr(rrand(0.01, 0.1), 0, 2, 3),
		LFNoise2.kr(1/8, 0.6, 0.7)
	);

	sig =FreeVerb.ar(
		sig,
		0.12 + SinOsc.kr(pd_1a).linexp(-1,1,0.01,0.5),
		0.32 ,
		0.32 - Ndef.kr(\modJii2).linexp(-1,1,0.01,0.28)
	);

	sig = BPeakEQ.ar(
		sig,
		[100.rrand(200), 1000.rrand(2000), 5000.rrand(7000), 7100.rrand(15000)].debug("BPeakEQ freq"),
		Array.rand(4, 0.01, 4).debug("BPeakEQ rq"),
		Array.rand(4, 0.1, 6).debug("BPeakEQ db")
	).mean;

	sig = LeakDC.ar(
		Normalizer.ar(
			sig,
			0.8,
			0.1
		)
	);
	sig = FreqShift.ar(
		sig,
		(0.01 + (~jiiPreset[\fshift] * Ndef.kr(\modJii2).abs)) / Array.interpolation(17, rrand(0.99, 1.1), rrand(16.9, 17.01)).debug("ArraySize")
	);

	sig = Pan2.ar(
		sig,
		LFNoise2.kr(0.1.exprand(10)).range(-0.25, 0.25) + (LFNoise1.kr(pd_4a) * Ndef.kr(\modJii))
	);

	sig = FreeVerb.ar(
		sig,
		~jiiPreset[\verbMix],
		~jiiPreset[\verbRoom],
		LFPar.kr(Ndef.kr(\modJii, 1), 0.0, 0.35, 0.5),
		0.5 // 1
	);

	sig = Mix.ar(sig) * ~jiiPreset[\amp] * 0.25;
	sig = Limiter.ar(sig, 0.5);


});
)

Ndef(\jii).play(0);

Ndef(\jii).clear(1);