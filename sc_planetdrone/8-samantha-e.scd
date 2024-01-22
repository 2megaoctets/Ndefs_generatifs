
(
~sePreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
Ndef(\se,{
	var sig;
    sig = FreqShift.ar(
		FreeVerb2.ar(
			Mix.fill(64,{Resonz.ar(Impulse.ar((~sePreset[\planetDrone_3a] * 0.045)+0.1.rand,0.8,9.9.rand),9/(1 + ~sePreset[\planetDrone_4a] * 0.23) + 99.rand.nthPrime*SinOsc.kr([1,1.7]*0.001+(~sePreset[\planetDrone_1a] * 0.125)).range([59,2],[2,11]),0.0004 + (~sePreset[\planetDrone_2a] * 0.0003),33)}),
			Mix.fill(64,{Resonz.ar(Impulse.ar((~sePreset[\planetDrone_3b] * 0.045)+0.1.rand,0.8,9.9.rand),9/(1 + ~sePreset[\planetDrone_4b] * 0.23) + 99.rand.nthPrime * SinOsc.kr([1,1.7] * 0.001 + (~sePreset[\planetDrone_1b] * 0.125)).range([59,2],[2,11]),0.0004+(~sePreset[\planetDrone_2b] * 0.0003), 33)}),
			mix:~sePreset[\planetDrone_effect_1], room:~sePreset[\planetDrone_effect_2], damp:0.25, mul:1.0, add:0.0),
		abs(~sePreset[\planetDrone_effect_3] * 8)/(4..16));
	sig = sig.sum * ~sePreset[\amp] * 0.33;
	sig = Limiter.ar(sig, 0.5);

   });

)

Ndef(\se).play(0);

Ndef(\se).clear;