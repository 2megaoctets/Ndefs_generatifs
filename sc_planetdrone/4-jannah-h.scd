(
~jhPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
Ndef(\jh,{
	var sig;
	l=LFNoise2;
	sig = FreeVerb2.ar( * XFade2.ar(
		SinOscFB.ar(
			[80 + (~jhPreset[\planetDrone_1a] * 80) + (SinOsc.ar(0.0075 * (1 + ~jhPreset[\planetDrone_effect_3] * 6)) * (~jhPreset[\planetDrone_effect_1] * 160)) ,
				81 + (~jhPreset[\planetDrone_2a] * 81) - (SinOsc.ar(0.0075 * (1 + ~jhPreset[\planetDrone_effect_3] * 6)) * (~jhPreset[\planetDrone_effect_1] * 121)) ], l.kr(1) + 1/2), SinOscFB.ar(
			[121+(~jhPreset[\planetDrone_3a] * 121) + (SinOsc.ar(0.0075 * (1 + ~jhPreset[\planetDrone_effect_3] * 6)) * (~jhPreset[\planetDrone_effect_2] * 81)) ,
				160 + (~jhPreset[\planetDrone_4a] * 160) - (SinOsc.ar(0.0075 * (1 + ~jhPreset[\planetDrone_effect_3] * 6)) * (~jhPreset[\planetDrone_effect_2] * 80)) ], l.kr(1) + 1/2),l.kr(1)));

	// Ndef('jh'): wrapped channels from 2 to 1 channels

	sig = Splay.ar(sig, 2, 1, 0.5);

	sig = sig * ~jhPreset[\amp] * 0.5;
});
)

Ndef(\jh).play(0);

Ndef(\jh).clear(2);