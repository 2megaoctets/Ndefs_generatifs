// 1102 demander à fabien pour forcer le type en char -> éval .ascii dans le graphe, génère un array

Ndef(\st).fadeTime_(7);

(
~stPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, ascii1: "8234986", ascii2: "slow", ascii3: "c7ding", amp: 0.1);
)

(
~stPreset = (planetDrone_1a: rrand(0.1,1.7), planetDrone_2a: rrand(0.1,0.8), planetDrone_3a: rrand(0,0.82), planetDrone_4a: rrand(0.1,1),  planetDrone_effect_1: rrand(0.01,1), planetDrone_effect_2: rrand(0.01,0.99), planetDrone_effect_3: rrand(0.01,0.99), ascii1: , ascii2: , ascii3: , amp: 0.1);
)

(
Ndef(\st,{
	var sig;

	// a=Saw;
	sig = BBandPass.ar(
		Saw.ar( ~stPreset[\ascii1].ascii),
		Saw.ar((2 + (~stPreset[\planetDrone_4a] * 45)) / ~stPreset[\ascii2]Char.ascii) * 1000 + (800 + (~stPreset[\planetDrone_1a] * 475)),
		Saw.ar((~stPreset[\planetDrone_3a] * 30)/~stPreset[\ascii3].ascii)+(0.0162+abs(~stPreset[\planetDrone_2a] * 0.75))
			);

	sig = Splay.ar(sig * 0.15, 1 /*/1.75*/);


	sig = FreqShift.ar(
		sig,
		(0 + (~stPreset[\planetDrone_effect_3]*0.75)) / (4..8)
	);

	sig = 	FreeVerb.ar(
		GVerb.ar(
			sig
		),
		0.1 + ~stPreset[\planetDrone_effect_1],
		0.1 + ~stPreset[\planetDrone_effect_2]
	);


	sig = Limiter.ar(LeakDC.ar(Splay.ar(sig)),0.5,0.13);

	sig = sig.sum * ~stPreset[\amp] * 0.35;
	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\st).play(0);

Ndef(\st).clear(0);