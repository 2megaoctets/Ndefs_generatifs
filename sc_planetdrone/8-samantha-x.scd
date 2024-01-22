
(
~sxPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
Ndef(\sx,{
	var sig;


	sig = Limiter.ar(
		GVerb.ar(
			(
				BPF.ar(
					WhiteNoise.ar([0.04,0.08]) + Blip.ar([12,22]+(~sxPreset[\planetDrone_1a] * 375) + SinOsc.ar(freq: 0.0125, phase: 0.0, mul: (~sxPreset[\planetDrone_1b] * 350), add:0.0) , 250.rand, mul:0.5)*(1 + ~sxPreset[\planetDrone_effect_3]),
					SinOsc.kr(
						SinOsc.kr([1/108,1/109]).range(1/106, 1/16)
					).exprange(195, 8000) + (~sxPreset[\planetDrone_2a] * 35) + SinOsc.ar(freq: 0.03, phase: 0.0, mul: (~sxPreset[\planetDrone_2b] * 175), add: 0.0) ,
					PMOsc.kr(1/54-(~sxPreset[\planetDrone_4a] * 10),1/216, 3).range(0.1, 2)
				)
				*
				SinOsc.ar(Array.rand(20, 1/216, 1) + (~sxPreset[\planetDrone_3a] * 125)  , mul: Array.rand(22, 0.21, 1)).reshape(10,2)
			).sum,
			roomsize:12,
			damping: (~sxPreset[\planetDrone_effect_1] * 0.12) + PMOsc.kr(1/28, 1/100, 3).range(0.25, 0.88)  + SinOsc.ar(freq: 0.02, phase: 0.0, mul: (~sxPreset[\planetDrone_4b] * 0.123), add: 0.0)  ,
			drylevel:SinOsc.kr(1/125).range(0.25, 0.95)
		)
		+
		GVerb.ar(
			Pan2.ar(
				LPF.ar(
					DynKlank.ar(
						`[
							Array.rand(6, (400+(~sxPreset[\planetDrone_effect_2] * 4000)), 5000 + SinOsc.ar(freq: 0.063, phase: 0.0, mul: (~sxPreset[\planetDrone_3b] * 2000), add:0.0) ).collect({|freq|
								SinOsc.kr(1/108).range(freq/2,freq)
							}),
							nil,
							Array.rand(6, 1/108, 1/27).collect({|freq|
								SinOsc.kr(freq).range(1/108,1/3)
							})
						],
						Limiter.ar(
							Dust.ar( SinOsc.kr(1/256).exprange(1/27, 3), TRand.kr(0.15, 0.25, Dust.kr(1/9)))
							+
							Impulse.ar( SinOsc.kr(1/108).exprange(1/54, 3), 0, TRand.kr(0.6, 0.8, Dust.kr(1/3)))
						)
					),
					942,
					LFPar.kr(1/27).exprange(0.05, 0.2)
				),
				SinOsc.kr(1/125).range(-012, 0.12)
			),
			roomsize: 12,
			drylevel:0.6
		)
	);
	sig = Mix.ar(sig);
	sig = sig * ~sxPreset[\amp] * 0.25;
	sig = Limiter.ar(sig, 0.5);
});
)


Ndef(\sx).play(0);

Ndef(\sx).clear(1);