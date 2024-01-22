// on le garde

(
~snPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
~snPreset = (planetDrone_1a: rrand(0.1,1.7), planetDrone_2a: rrand(0.1,0.8), planetDrone_3a: rrand(0,0.82), planetDrone_4a: rrand(0.1,1), planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: rrand(0,0.6), planetDrone_effect_2: rrand(0,0.6), planetDrone_effect_3: rrand(0,0.625), amp: 0.15);
)

(
Ndef(\sn,{
	var sig;
	sig = AllpassN.ar(
		FreeVerb.ar(
			q = 0;
			(100..90).do{|f|f = f / 2 + (~snPreset[\planetDrone_1a] * 16) + (1.0 + SinOsc.ar(~snPreset[\planetDrone_2b] * 1.25, 1.25, ~snPreset[\planetDrone_3b] * 25));
				q = SinOsc.ar(f + [0 + (~snPreset[\planetDrone_3a] * 100 + SinOsc.ar(freq: 0.03, phase: 0.0, mul: (~snPreset[\planetDrone_1b] * 8), add: 0.0)   ),1 + (~snPreset[\planetDrone_2a] * 100  - SinOsc.ar(freq: 0.03, phase: 0.0, mul: (~snPreset[\planetDrone_1b] * 8), add: 0.0)   )],q*LFTri.kr(0.75,1.25).range(1.2+~snPreset[\planetDrone_4a], 0.25 + ~snPreset[\planetDrone_4b]))};
			q;,
			mix:  abs(~snPreset[\planetDrone_effect_1]),
			room: abs(~snPreset[\planetDrone_effect_2]),
			damp:  0.25,
			mul: 1.0,
			add: 0.0),
		2.75, abs(SinOsc.ar(0.0258, 1.38, 0.12, 1.0/(1.0 + abs(~snPreset[\planetDrone_effect_3] * 250)))));
	sig = sig * ~snPreset[\amp] * 0.25;
	sig = Limiter.ar(sig, 0.5);
});
)

Ndef(\sn).play(0);

Ndef(\sn).clear(1);