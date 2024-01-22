(
~dppPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
Ndef(\dpp,{
	var sig ;
	a=LFTri;
	b=[3,4,8];
	sig = FreqShift.ar(
		FreeVerb.ar(
				Formlet.ar(a.ar(b*99+99),a.ar(b + SinOsc.ar(freq: 0.03, phase: 0.0, mul: abs(~dppPreset[\planetDrone_4a] * 4), add: 0.0)).round(a.ar(0.05 + ~dppPreset[\planetDrone_1a]).round(1/3)) * 99 + 175 + (~dppPreset[\planetDrone_2a] * 99), 1 , a.ar(b/6.011 + (~dppPreset[\planetDrone_3a] * 7))%1)/9,
			0.1 + ~dppPreset[\planetDrone_effect_1], 0.1 + ~dppPreset[\planetDrone_effect_2]),
		(0 + (~dppPreset[\planetDrone_effect_3] *500)) + SinOsc.ar(freq: 0.03, phase: 0.0, mul: (~dppPreset[\planetDrone_4a]*8), add: 0.0) / (2..9));
	sig = Splay.ar(sig, 1);
	sig = sig * ~dppPreset[\amp] * 0.25;
 });
)

Ndef(\dpp).play(0);

Ndef(\dpp).clear(0);