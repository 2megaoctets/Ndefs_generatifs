(
~sjPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)


(
Ndef(\sj,{
	var sig;
	sig = GVerb.ar(
		GVerb.ar(
			Impulse.ar(
				[
					8+(~sjPreset[\planetDrone_1a] * 16),
					6+(~sjPreset[\planetDrone_2a] * 16),
					4+(~sjPreset[\planetDrone_3a] * 16)] / 100,
				[0, 0.2, 0.6]) * 8,
			[2 - (~sjPreset[\planetDrone_4a] * 0.125 ),3,1.5],
			abs(12 + (~sjPreset[\planetDrone_effect_1] * 25)),
			drylevel:0).sum.sin.sum * 0.5,
		62 - abs(~sjPreset[\planetDrone_effect_2] * 100),
		24 + (~sjPreset[\planetDrone_effect_3] * 23)).tanh;
	sig = sig * ~sjPreset[\amp] * 0.5;
   });
)

Ndef(\sj).play(0);

Ndef(\sj).clear(1);