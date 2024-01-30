// presets validés, voir si on rajoute des mods

Ndef(\jb).fadeTime_(3);

(
~jbPreset = (freqPulse1: 0.13, freqPulse2: 0.145, freqPulse3: 0.2, freqPulse4: 0.1, pulseWidth1: 0.13, pulseWidth2: 0.145, pulseWidth3: 0.2, pulseWidth4: 0.1,  brf: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, hz: 100, amp: 0.35);
)

(
~jbPreset = ( 'freqPulse1': 0.16257837533951, 'freqPulse3': 0.16158791780472, 'freqPulse2': 0.10238282680511, 'hz': 223.19873691201, 'planetDrone_effect_2': 0.58164843916893, 'pulseWidth2': 0.4870618224144, 'pulseWidth3': 0.78684626579285, 'brf': 0.2969676399231, 'amp': 0.35, 'pulseWidth4': 0.74926328659058, 'freqPulse4': 0.55461072921753, 'pulseWidth1': 0.94340088367462, 'planetDrone_effect_3': 0.81989223957062 )
) // photek

(
~jbPreset = ( 'freqPulse1': 0.7342582821846, 'freqPulse3': 0.64424370527267, 'freqPulse2': 0.13713322877884, 'hz': 108.92707596302, 'planetDrone_effect_2': 0.25348136425018, 'pulseWidth2': 0.83428972363472, 'pulseWidth3': 0.78778732061386, 'brf': 0.59237744450569, 'amp': 0.35, 'pulseWidth4': 0.40330772399902, 'freqPulse4': 0.50335187911987, 'pulseWidth1': 0.77961468696594, 'planetDrone_effect_3': 0.14651641100645 )
) // controle fiscal de l'angoisse

(
~jbPreset = (freqPulse1: rrand(0.01, 0.99), freqPulse2: rrand(0.1, 0.95), freqPulse3: rrand(0.1, 1), freqPulse4: rrand(0.1, 0.9), pulseWidth1: rrand(0.1, 1), pulseWidth2: rrand(0.1, 0.95), pulseWidth3: rrand(0.1, 0.92), pulseWidth4: rrand(0.1, 0.9),  brf: rrand(0.1, 0.93), planetDrone_effect_2: rrand(0.1, 0.925), planetDrone_effect_3: rrand(0.1, 0.9625), hz: rrand(65.41, 300), amp: 0.35);
)


(
Ndef(\jb,{
	var sig, mix1, mix2, mix3, mix4;
	mix1 = Pulse.ar(
		freq: ~jbPreset[\hz] + 50 + (~jbPreset[\freqPulse1] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) + (SinOsc.ar(0.075) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width:  SinOsc.ar( (~jbPreset[\pulseWidth1] )) + 0.25,
		mul: 1.7,
	);
	mix1 = BRF.ar(
		mix1,
		2000 + (~jbPreset[\brf] * 200) - (SinOsc.ar(0.15) * 1100),
		0.5
	);
	mix1 = Pan2.ar(
		mix1,
		SinOsc.ar(0.015) - 0.5
	);
	mix2 = Pulse.ar(
		freq: ~jbPreset[\hz] + 123 + (~jbPreset[\freqPulse2] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) - (SinOsc.ar(0.05) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width: SinOsc.ar((~jbPreset[\pulseWidth2] )) + 0.25,
		mul: 1.8,
	);
	mix2 = BRF.ar(
		mix2,
		2000 + (~jbPreset[\brf] * 200) - (SinOsc.ar(0.08) * 1100),
		0.5);
	mix2 = Pan2.ar(
		mix2,
		SinOsc.ar(0.055)
	);
	mix3 = Pulse.ar(
		freq: ~jbPreset[\hz] - 27 + (~jbPreset[\freqPulse3] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) + (SinOsc.ar(0.075) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width: SinOsc.ar((~jbPreset[\pulseWidth3] )) + 0.25,
		mul: 1.9,
	);
	mix3 = BRF.ar(
		mix3,
		2000 + (~jbPreset[\brf] * 200) - (SinOsc.ar(0.02) * 1100),
		0.5
	);
	mix3 = Pan2.ar(
		mix3 ,
		SinOsc.ar(0.15) - 0.5
	);
	mix4 = Pulse.ar(
		freq: ~jbPreset[\hz] - 13 + (~jbPreset[\freqPulse4] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) - (SinOsc.ar(0.05) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width: SinOsc.ar((~jbPreset[\pulseWidth4] )) + 0.25,
		mul: 2.0,
	);
	mix4 = BRF.ar(
		mix4,
		2000 + (~jbPreset[\brf] * 200) -(SinOsc.ar(0.005) * 1100), 0.5);
	mix4 = Pan2.ar(
		mix4 ,
		SinOsc.ar(0.005)
	);

	sig = Mix.ar([
		mix1,
		mix2,
		mix3,
		mix4
	]);

	// spread the signal

	sig = DFM1.ar(sig, 6200, 0.35);

	sig = Greyhole.ar(sig, delayTime:0.25 + abs(~jbPreset[\brf]));

	sig = Splay.ar(sig)* ~jbPreset[\amp] * 0.051;
	sig = Limiter.ar(sig, 0.15);
	sig;
});
)

Ndef(\jb).play(0);

Ndef(\jb).clear(10);