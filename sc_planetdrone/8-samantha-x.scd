// 1802 todo

Ndef(\sx).fadeTime_(10);

(
~sxPreset =
)

(
~sxPreset =
)

(
~sxPreset =
)

(
Post << ~sxPreset = (blipFreq: rrand(1,375), bpfFreq1: rrand(1.0,35), arrayFreqAdd: rrand(1,125), bpfRqFreq: rrand(0.1,10), blipLfoMul: rrand(1,350), bpfFreq2: rrand(1,175), planetDrone_3b: 0.2, verb1DampLfoMul: rrand(0.01, 0.123),  verb1DampBase: rrand(0.01, 0.13), dynKlankArrayMinFreq: rrand(400, 4400), dynKlankArrayMaxFreq: rrand(4600,5200), blipFreqFactor: rrand(1.0,2), amp: 0.1, arrayFreqBase: Array.rand(20, 1/216, 1), arrayFreqMul: Array.rand(22, 0.21, 1) );
)

(
Ndef(\sx,{
	var sig, sig2;

	sig = BPF.ar(
		WhiteNoise.ar([0.04,0.08]) + Blip.ar(
			[12,22] + ~sxPreset[\blipFreq] + SinOsc.ar(
				freq: 0.0125,
				phase: 0.0,
				mul: ~sxPreset[\blipLfoMul],
				add:0.0
			) ,
			250.rand,
			mul:0.5
		)
		*  ~sxPreset[\blipFreqFactor], // in
		SinOsc.kr(
			SinOsc.kr([1/108,1/109]).range(1/106, 1/16)
		).exprange(195, 8000) + ~sxPreset[\bpfFreq1] + SinOsc.ar(
			freq: 0.03,
			phase: 0.0,
			mul: ~sxPreset[\bpfFreq2],
			add: 0.0
		) , // freq
		PMOsc.kr(
			1/54-~sxPreset[\bpfRqFreq],
			1/216,
			3
		).range(0.1, 2) // rq
	).scope;

	sig = (sig * SinOsc.ar(
		~sxPreset[\arrayFreqBase] + ~sxPreset[\arrayFreqAdd]  ,
		mul: ~sxPreset[\arrayFreqMul]
	).reshape(10,2)
	).sum;

	sig = GVerb.ar(
		sig,
		roomsize:12,
		damping: ~sxPreset[\verb1DampBase] + PMOsc.kr(
			1/28,
			1/100,
			3
		).range(0.25, 0.88)  + SinOsc.ar(
			freq: 0.02,
			phase: 0.0,
			mul: ~sxPreset[\verb1DampLfoMul] ,
			add: 0.0
		)  ,
		drylevel:SinOsc.kr(1/125).range(0.25, 0.95)
	);

	sig2 = DynKlank.ar(
		`[
			Array.rand(6, ~sxPreset[\dynKlankArrayMinFreq], ~sxPreset[\dynKlankArrayMaxFreq] + SinOsc.ar(
				freq: 0.063,
				phase: 0.0,
				mul: (~sxPreset[\planetDrone_3b] * 2000),
				add:0.0
			)
			).collect({|freq|
				SinOsc.kr(1/108).range(freq/2,freq)
			}),
			nil,
			Array.rand(6, 1/108, 1/27).collect({ |freq|
				SinOsc.kr(freq).range(1/108,1/3)
			})
		], // specificationsArrayRef
		Limiter.ar(
			Dust.ar(
				SinOsc.kr(1/256).exprange(1/27, 3),
				TRand.kr(0.15, 0.25, Dust.kr(1/9))
			)
			+
			Impulse.ar(
				SinOsc.kr(1/108).exprange(1/54, 3),
				0,
				TRand.kr(0.6, 0.8, Dust.kr(1/3))
			)
		) // input
	);
	sig2 = LPF.ar(
		sig2,
		942,
		LFPar.kr(1/27).exprange(0.05, 0.2)
	);

	sig2 = Pan2.ar(
		sig2,
		SinOsc.kr(1/125).range(-012, 0.12)
	);

	sig2 = GVerb.ar(
		sig2,
		roomsize: 12,
		drylevel:0.6
	);

	sig = Limiter.ar(
		sig
		+
		sig2
	);

	sig = Mix.ar(sig);
	sig = HPF.ar(sig, 140);
	sig = sig * ~sxPreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);
});
)


Ndef(\sx).play(0);

Ndef(\sx).clear(1);