Ndef(\sk).fadeTime_(3);

(
~skPreset = (planetDrone_1a: 0.73, planetDrone_2a: 0.45, planetDrone_3a: 0.62, planetDrone_4a: 0.31,  planetDrone_effect_1: 0.53, planetDrone_effect_2: 0.5, planetDrone_effect_3: 0.625, amp: 0.15);
)

(
~skPreset = (planetDrone_1a: rrand(0.1,1.7), planetDrone_2a: rrand(0.1,0.8), planetDrone_3a: rrand(0,0.82), planetDrone_4a: rrand(0.1,1),  planetDrone_effect_1: rrand(0,0.6), planetDrone_effect_2: rrand(0,0.6), planetDrone_effect_3: rrand(0,0.625), amp: 0.15);
)

(
Ndef(\sk,{
	var pd_1a = (~skPreset[\planetDrone_1a] * 177), pd_2a = (~skPreset[\planetDrone_2a] * 170), pd_3a = (~skPreset[\planetDrone_3a] * 163), pd_4a = (~skPreset[\planetDrone_4a] * 155), sig;

	sig = Pan2.ar(
		FreeVerb.ar(
			SinOsc.ar(
				Demand.kr(Impulse.kr(Rand(10,100)
				+ pd_1a
				+ SinOsc.ar(freq: 0.0032, phase: 0.0, mul: (pd_3a*4), add: 0.0)),0,Dseq([Rand(100,333),Rand(100,333)
				+ pd_2a
				+ SinOsc.ar(freq: 0.0019, phase: 0.0, mul: (pd_4a*6), add: 0.0)
			],inf)  ),

		0,0.08),

			0.25 + ~skPreset[\planetDrone_effect_1],1,1), pos:SinOsc.ar(freq: 0.0125 + abs(~skPreset[\planetDrone_effect_3] * 4), phase: 0.0, mul: (~skPreset[\planetDrone_effect_2] * 0.75), add: 0.0));

	sig = sig * ~skPreset[\amp] ;
	// sig = Limiter.ar(sig, 0.5);

   });
)


Ndef(\sk).play(0);

Ndef(\sk).clear(1);

