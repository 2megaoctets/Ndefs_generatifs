Ndef(\jb).fadeTime_(3);

(
~jbPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, hz: 100, amp: 0.35);
)

(
~jbPreset = ( 'planetDrone_1a': 0.16257837533951, 'planetDrone_3a': 0.16158791780472, 'planetDrone_2a': 0.10238282680511, 'hz': 223.19873691201, 'planetDrone_effect_2': 0.58164843916893, 'planetDrone_2b': 0.4870618224144, 'planetDrone_3b': 0.78684626579285, 'planetDrone_effect_1': 0.2969676399231, 'amp': 0.35, 'planetDrone_4b': 0.74926328659058, 'planetDrone_4a': 0.55461072921753, 'planetDrone_1b': 0.94340088367462, 'planetDrone_effect_3': 0.81989223957062 )
) // photek

(
~jbPreset = ( 'planetDrone_1a': 0.7342582821846, 'planetDrone_3a': 0.64424370527267, 'planetDrone_2a': 0.13713322877884, 'hz': 108.92707596302, 'planetDrone_effect_2': 0.25348136425018, 'planetDrone_2b': 0.83428972363472, 'planetDrone_3b': 0.78778732061386, 'planetDrone_effect_1': 0.59237744450569, 'amp': 0.35, 'planetDrone_4b': 0.40330772399902, 'planetDrone_4a': 0.50335187911987, 'planetDrone_1b': 0.77961468696594, 'planetDrone_effect_3': 0.14651641100645 )
) // controle fiscal de l'angoisse

(
~jbPreset = ( 'planetDrone_1a': 0.13, 'planetDrone_3a': 0.2, 'planetDrone_2a': 0.145, 'hz': 100,
  'planetDrone_effect_2': 0.25, 'planetDrone_2b': 0.145, 'planetDrone_3b': 0.2, 'planetDrone_effect_1': 0.3, 'amp': 0.35,
  'planetDrone_4b': 0.1, 'planetDrone_4a': 0.1, 'planetDrone_1b': 0.13, 'planetDrone_effect_3': 0.0625 ) // en attendant les résultats de la biopsie
)

(
~jbPreset = (planetDrone_1a: rrand(0.01, 0.99), planetDrone_2a: rrand(0.1, 0.95), planetDrone_3a: rrand(0.1, 1), planetDrone_4a: rrand(0.1, 0.9), planetDrone_1b: rrand(0.1, 1), planetDrone_2b: rrand(0.1, 0.95), planetDrone_3b: rrand(0.1, 0.92), planetDrone_4b: rrand(0.1, 0.9),  planetDrone_effect_1: rrand(0.1, 0.93), planetDrone_effect_2: rrand(0.1, 0.925), planetDrone_effect_3: rrand(0.1, 0.9625), hz: rrand(65.41, 300), amp: 0.35);
)


(
/*SynthDef(\freeVerb2x2, { |out, mix = 0.3, room = 0.11, damp = 0.45, amp = 1.0|
var signal;
signal = In.ar(out, 2);
ReplaceOut.ar(out,
FreeVerb2.ar( // FreeVerb2 - true stereo UGen
signal[0], // Left channel
signal[1], // Right Channel
mix, room, damp, amp
)
); // same params as FreeVerb 1 chn version
}).add;*/

Ndef(\jb,{
	var sig, mix1, mix2, mix3, mix4;
	mix1 = Pulse.ar(
		freq: SinOsc.kr(~jbPreset[\hz] + 50) + (~jbPreset[\planetDrone_1a] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) + (SinOsc.ar(0.075) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width:  SinOsc.ar(0.005 * (~jbPreset[\planetDrone_1b] * 200)) + 0.25,
		mul: 1.7,
	);
	mix1 = BRF.ar(
		mix1,
		2000 + (~jbPreset[\planetDrone_effect_1] * 200) - (SinOsc.ar(0.15) * 1100),
		0.5);
	mix1 = Pan2.ar(
		mix1,
		SinOsc.ar(0.015) - 0.5);
	mix2 = Pulse.ar(
		freq: LFPulse.kr(~jbPreset[\hz] + 123) + (~jbPreset[\planetDrone_2a] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) - (SinOsc.ar(0.05) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width: SinOsc.ar(0.012 * (~jbPreset[\planetDrone_2b] * 100)) + 0.25,
		mul: 1.8,
	);
	mix2 = BRF.ar(
		mix2,
		2000 + (~jbPreset[\planetDrone_effect_1] * 200) - (SinOsc.ar(0.08) * 1100),
		0.5);
	mix2 = Pan2.ar(
		mix2,
		SinOsc.ar(0.055));
	mix3 = Pulse.ar(
		freq: LFSaw.kr(~jbPreset[\hz] - 27) + (~jbPreset[\planetDrone_3a] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) + (SinOsc.ar(0.075) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width: SinOsc.ar(0.0005 * (~jbPreset[\planetDrone_3b] * 500)) + 0.25,
		mul: 1.9,
	);
	mix3 = BRF.ar(
		mix3,
		2000 + (~jbPreset[\planetDrone_effect_1] * 200) - (SinOsc.ar(0.02) * 1100),
		0.5);
	mix3 = Pan2.ar(
		mix3 ,
		SinOsc.ar(0.15)-0.5);
	mix4 = Pulse.ar(
		freq: SinOscFB.kr(~jbPreset[\hz] - 13) + (~jbPreset[\planetDrone_4a] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) - (SinOsc.ar(0.05) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width: SinOsc.ar(0.0005 * (~jbPreset[\planetDrone_4b] * 50)) + 0.25,
		mul: 2.0,
	);
	mix4 = BRF.ar(
		mix4,
		2000 + (~jbPreset[\planetDrone_effect_1] * 200) -(SinOsc.ar(0.005) * 1100), 0.5);
	mix4 = Pan2.ar(
		mix4 ,
		SinOsc.ar(0.005));

	sig = Mix.ar([
		mix1,
		mix2,
		mix3,
		mix4
	]);

	// spread the signal


	sig = DFM1.ar(sig, SinOsc.kr(0.1, 0, 0.5, 6200), 0.35);

	sig = Greyhole.ar(sig, delayTime:0.25 + abs(~jbPreset[\planetDrone_effect_1]));

	sig = Splay.ar(sig)* ~jbPreset[\amp] * 0.25;
	sig = Limiter.ar(sig, 0.25);

	// make sound!
	// Out.ar(0,sig);
	// s.sync;
	// z = Synth(\freeVerb2x2, [\outbus, 0], addAction:\addToTail);

});
)

Ndef(\jb).play(0);

Ndef(\jb).clear(1);