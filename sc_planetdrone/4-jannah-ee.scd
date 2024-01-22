
(
~jeePreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.65);
)

(
Ndef(\jee,{
	var sig;
	sig = FreqShift.ar(

		GVerb.ar(

			SinOsc.ar(LFNoise0.ar(10).range(
				100+(~jeePreset[\planetDrone_1a] * 1000)    + SinOsc.ar(freq: 0.03, phase: 0.0, mul: (~jeePreset[\planetDrone_4a] * 251), add: 0.0)   ,
				10000 + (~jeePreset[\planetDrone_2a] * 10000) + SinOsc.ar(freq: 0.03, phase: 0.0, mul: (~jeePreset[\planetDrone_4a] * 522), add: 0.0)  ),
			0,0.095) * Decay.kr(Dust.kr(1)) * LFNoise1.ar(40+(~jeePreset[\planetDrone_3a] * 8000)),

			299,400,0.5,0.5,50,0,0.2,0.9),

		0 + ~jeePreset[\planetDrone_effect_1] * 500) / ((2..8) +   SinOsc.ar(freq: 0.00025 + (~jeePreset[\planetDrone_effect_3]), phase: 0.0, mul: ~jeePreset[\planetDrone_effect_2] * 0.25, add: 0.0) );
	sig = Splay.ar(sig, 1);
	sig = sig * ~jeePreset[\amp];
	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\jee).play(0);

Ndef(\jee).clear(1);