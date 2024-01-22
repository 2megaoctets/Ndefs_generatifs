// sig = Splay.ar(sig, 1);


(
~sbbPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
~sfPreset = (planetDrone_1a: rrand(0,0.8), planetDrone_2a: rrand(0,20.0), planetDrone_3a: rrand(0,0.81), planetDrone_4a: rrand(0.1,0.8), planetDrone_effect_1: rrand(0.03,0.8), planetDrone_effect_2: rrand(0.25, 0.76), planetDrone_effect_3: rrand(0.0625, 0.76), amp: 0.1)
)

(
Ndef(\sbb, {

	var pd_1a = (~sbbPreset[\planetDrone_1a] * 77), pd_2a = (~sbbPreset[\planetDrone_2a] * 70), pd_3a = (~sbbPreset[\planetDrone_3a]*63), pd_4a = (~sbbPreset[\planetDrone_4a] * 55), sig;

	sig = FreqShift.ar(

		FreeVerb.ar(

			PanB2.ar(Gendy1.ar(3,1,2,1,
				305+pd_1a +abs(SinOsc.ar(freq: 0.0033, phase: 0.0, mul: (pd_3a*3.5), add: 0.0)),
				500+pd_2a +abs(SinOsc.ar(freq: 0.0132, phase: 0.0, mul: (pd_4a*7.2), add: 0.0)),0.33)*LFNoise2.kr(0.2,0.5),Saw.kr(0.2,3)),

			0.25 + ~sbbPreset[\planetDrone_effect_1],0.25 + ~sbbPreset[\planetDrone_effect_2], 1),

		(0 + (~sbbPreset[\planetDrone_effect_3] * 2)) / (1..18));
	sig = Splay.ar(sig, 1);

	sig = sig * ~sbbPreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);

});

)

Ndef(\sbb).play(0);

Ndef(\sbb).clear(1);