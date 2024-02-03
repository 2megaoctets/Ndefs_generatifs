// 0302 : valeurs des args, dé-factorisation

Ndef(\jb).fadeTime_(7);

(
~jbPreset = (planetDrone_1a: 58.5, planetDrone_2a: 65.25, planetDrone_3a: 90, planetDrone_4a: 45, planetDrone_1b: 26, planetDrone_2b: 14.5, planetDrone_3b: 100, planetDrone_4b: 5,  planetDrone_effect_1: 60, planetDrone_effect_2: 87.5, planetDrone_effect_3: 0.5, hz: 100, amp: 0.1);
)

(
~jbPreset = ( 'planetDrone_1a': 73.1602, 'planetDrone_3a': 72.714563012124, 'planetDrone_2a': 46.0722720623, 'hz': 223.19873691201, 'planetDrone_effect_2': 203.57695370913, 'planetDrone_2b': 48.70618224144, 'planetDrone_3b': 393.42313289642, 'planetDrone_effect_1': 59.39352798462, 'amp': 0.1, 'planetDrone_4b': 37.463164329529, 'planetDrone_4a': 249.57482814789, 'planetDrone_1b': 188.68017673492, 'planetDrone_effect_3': 6.559137916565);
) // photek


(
~jbPreset = ( 'planetDrone_1a': 330.41622698307, 'planetDrone_2a': 61.709952950478, 'planetDrone_3a': 289.9096673727, 'planetDrone_4a': 226.50834560394, 'planetDrone_1b': 155.92293739319, 'planetDrone_2b': 83.428972363472, 'planetDrone_3b': 393.89366030693, 'planetDrone_4b': 20.165386199951, 'planetDrone_effect_1': 11878.705596924, 'planetDrone_effect_2': 88.718477487563, 'planetDrone_effect_3': 1.1721312880516,  'hz': 108.92707596302,  'amp': 0.1 );
) // controle fiscal de l'angoisse


(
~jbPreset = ( 'planetDrone_1a': 58.5, 'planetDrone_2a': 65.25, 'planetDrone_3a': 90, 'planetDrone_4a': 45, 'planetDrone_1b': 58.5, 'planetDrone_2b': 14.5, 'planetDrone_3b': 100, 'planetDrone_4b': 5, 'planetDrone_effect_1': 60, 'planetDrone_effect_2': 87.5,  'planetDrone_effect_3': 0.5, 'hz': 100,  'amp': 0.1 );
) // en attendant les résultats de la biopsie


(
~jbPreset = ( 'planetDrone_1a': 370.46782708168, 'planetDrone_2a': 387.24766552448,  'planetDrone_3a': 411.91687524319, 'planetDrone_4a': 306.09467983246,  'planetDrone_1b': 150.56587934494,  'planetDrone_2b': 94.839679002762, 'planetDrone_3b': 178.42485308647,  'planetDrone_4b': 43.195476531983, 'planetDrone_effect_1': 34.018780231476, 'planetDrone_effect_2': 254.21176478267, 'planetDrone_effect_3': 2.6953571081162, 'hz': 157.48465546131, 'amp': 0.1);
) // photek 2

(
~jbPreset = ( 'planetDrone_1a': 184.17928183079, 'planetDrone_2a': 387.24766552448, 'planetDrone_3a': 411.91687524319, 'planetDrone_4a': 306.09467983246, 'planetDrone_1b': 150.56587934494, 'planetDrone_2b': 94.839679002762, 'planetDrone_3b': 178.42485308647, 'planetDrone_4b': 38.195476531983, 'planetDrone_effect_1': 156.41414856911,  'planetDrone_effect_2': 220.84672480822, 'planetDrone_effect_3':  4.9143203377724, 'hz': 134.17719386816, 'amp': 0.1); // demi-photek
)

(
~jbPreset = (planetDrone_1a: rrand(0.01, 450), planetDrone_2a: rrand(0.1, 450), planetDrone_3a: rrand(0.1, 450), planetDrone_4a: rrand(0.1, 450), planetDrone_1b: rrand(0.1, 200), planetDrone_2b: rrand(0.1, 100), planetDrone_3b: rrand(0.1, 500), planetDrone_4b: rrand(0.1, 50),  planetDrone_effect_1: rrand(0.1, 200), planetDrone_effect_2: rrand(0.1, 350), planetDrone_effect_3: rrand(0.1, 8), hz: rrand(65.41, 300), amp: 0.1);
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
		freq: SinOsc.kr(~jbPreset[\hz] + 50) + ~jbPreset[\planetDrone_1a] + ~jbPreset[\planetDrone_effect_2]  + (SinOsc.ar(0.075) * ~jbPreset[\planetDrone_effect_3]),
		width:  SinOsc.ar(0.005 * ~jbPreset[\planetDrone_1b]) + 0.25,
		mul: 1.7,
	);
	mix1 = BRF.ar(
		mix1,
		2000 + ~jbPreset[\planetDrone_effect_1] - (SinOsc.ar(0.15) * 1100),
		0.5);
	mix1 = Pan2.ar(
		mix1,
		SinOsc.ar(0.015) - 0.5);
	mix2 = Pulse.ar(
		freq: LFPulse.kr(~jbPreset[\hz] + 123) + ~jbPreset[\planetDrone_2a] + ~jbPreset[\planetDrone_effect_2]  - (SinOsc.ar(0.05) * ~jbPreset[\planetDrone_effect_3] ),
		width: SinOsc.ar(0.012 * ~jbPreset[\planetDrone_2b] ) + 0.25,
		mul: 1.8,
	);
	mix2 = BRF.ar(
		mix2,
		2000 + ~jbPreset[\planetDrone_effect_1]  - (SinOsc.ar(0.08) * 1100),
		0.5
	);
	mix2 = Pan2.ar(
		mix2,
		SinOsc.ar(0.055)
	);
	mix3 = Pulse.ar(
		freq: LFSaw.kr(~jbPreset[\hz] - 27) + ~jbPreset[\planetDrone_3a]  + ~jbPreset[\planetDrone_effect_2] + (SinOsc.ar(0.075) * ~jbPreset[\planetDrone_effect_3] ),
		width: SinOsc.ar(0.0005 * ~jbPreset[\planetDrone_3b] ) + 0.25,
		mul: 1.9,
	);
	mix3 = BRF.ar(
		mix3,
		2000 + ~jbPreset[\planetDrone_effect_1] - (SinOsc.ar(0.02) * 1100),
		0.5
	);
	mix3 = Pan2.ar(
		mix3 ,
		SinOsc.ar(0.15)-0.5
	);
	mix4 = Pulse.ar(
		freq: SinOscFB.kr(~jbPreset[\hz] - 13) + ~jbPreset[\planetDrone_4a]  + ~jbPreset[\planetDrone_effect_2]  - (SinOsc.ar(0.05) * ~jbPreset[\planetDrone_effect_3]),
		width: SinOsc.ar(0.0005 * ~jbPreset[\planetDrone_4b] ) + 0.25,
		mul: 2.0,
	);
	mix4 = BRF.ar(
		mix4,
		2000 + ~jbPreset[\planetDrone_effect_1]  - (SinOsc.ar(0.005) * 1100), 0.5);
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


	sig = DFM1.ar(sig, SinOsc.kr(0.0, 15, 0.5, 6200), 0.35);

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