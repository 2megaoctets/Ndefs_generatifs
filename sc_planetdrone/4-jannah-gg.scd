// 0602 correc graphe, valeurs (défactorisation), args: noms et rajouts
// todo: SinOscFB > moduler feedbacks et phases
// todo: GVerb > modulateurs kr

Ndef(\jgg).fadeTime_(7);


(
~jggPreset = (sine2Freq2: 97.5, sine2Freq1: 0.073, sine2Mul: 119.625, sine1Mul: 3.4, sine1Freq: 0.025, freqShift1: 150, freqDiv: (2..8), freqShift2Mul: 0.125, freqShift2: 80.625, amp: 0.1);
)

(
~jggPreset = (sine2Freq2: rrand(0.01, 750), sine2Freq1: rrand(0.001,1), sine2Mul: rrand(0.1, 825), sine1Mul: rrand(0.1, 17), sine1Freq: rrand(0.1, 0.25),  freqShift1: rrand(0.1, 500), freqDiv: Array.interpolation(7, rrand(1.5,2.7), rrand(7.5,8.5)), freqShift2Mul: rrand(0.1, 0.5), freqShift2: rrand(0.1, 100), amp: 0.1);
)


(
Ndef(\jgg, {

	var
	sig, srcA;


	srcA = Splay.ar(
		SinOscFB.ar(
			SinOscFB.ar(
				1 / (10..15),
				Phasor.kr(0.0, 10.0, 0.0, 8.0, 8.0)  // test fb mod // 2
			) < 1 * 450 + 90
			+ SinOsc.ar (
				freq: ~jggPreset[\sine1Freq] % 0.0173 , // 0.0173 + ~jggPreset[\sine1Freq],
				phase: 0.0,
				mul: ~jggPreset[\sine1Mul],
				add: 0.0
			)
		) / 7
		+ SinOscFB.ar(
			SinOsc.ar(
				freq: ~jggPreset[\sine2Freq1], // 0.0073,
				phase: 0.0,
				mul: ~jggPreset[\sine2Mul],
				add: 0.0
			)
			+ ~jggPreset[\sine2Freq2] + 600 ,
			SinOscFB.ar(
				SinOscFB.ar(1, 1) > 0.1 + 1, 1.05
			) % 1,
			SinOscFB.ar( 0.1 - 1, 1.744).min(0)
		)
	)/2;

	srcA = FreqShift.ar(
		srcA,
		0.1 + ~jggPreset[\freqShift1]) / (~jggPreset[\freqDiv] +   SinOsc.ar(
		freq: 0.00025 + (~jggPreset[\freqShift2]),
		phase: 0.0,
		mul: ~jggPreset[\freqShift2Mul],
		add: 0.0
	)
	);
	sig = GVerb.ar(
		Mix.ar(srcA * 0.5),
		roomsize: 180,
		revtime: 30,
		damping: 0.47,
		inputbw: 0.7,
		spread: 40,
		drylevel: 40,
		earlyreflevel: 0,
		taillevel: -11,
		mul: 0.3
	);

	sig = HPF.ar(sig, 200);

	sig = Splay.ar(sig, 1) * ~jggPreset[\amp] * 0.15;
	sig = Limiter.ar(sig, 0.5);
});

)

Ndef(\jgg).play(0);

Ndef(\jgg).clear(1);