// 0102 : bonnes valeurs, sans facteurs
// ajout mod, pas convaincu pour l'instant
// presets validés, voir si on rajoute des mods

Ndef(\jbMod).fadeTime_(7);

(
~jbModPreset = (impulseFreqSlope: , impulseFreqStart: , impulseFreqEnd: , );
)

(
~jbModPreset = (impulseFreqSlope: , impulseFreqStart: , impulseFreqEnd: , );
)

(
~jbModPreset = (impulseFreqSlope: , impulseFreqStart: , impulseFreqEnd: , );
)

(
~jbModPreset = (tension: rrand(0.05, 0.1), loss: rrand(0.89,0.99999), freqSlope: rrand(0.1, 50), freqStart: rrand(10, 440), freqEnd: rrand(10, 440));
)

(
Ndef(\jbMod, {
	var sig;
	sig = MembraneHexagon.ar(
		SawDPW.ar(
			// ~jbModPreset[\freqStart]
			Phasor.kr(0.0, ~jbModPreset[\freqSlope], ~jbModPreset[\freqStart], ~jbModPreset[\freqEnd])
		),
		~jbModPreset[\tension],
		~jbModPreset[\loss],
		15,
		10
	);
	sig = LeakDC.ar(sig);
	sig;
});
)

Ndef(\jb).fadeTime_(7);

(
~jbPreset = (freqPulse1: 58.5, freqPulse2: 65.25, freqPulse3: 90, freqPulse4: 45, pulseWidth1: 0.13, pulseWidth2: 0.145, pulseWidth3: 0.2, pulseWidth4: 0.1,  brf: 60, planetDrone_effect_2: 87.5, planetDrone_effect_3: 0.5, hz: 100, amp: 0.35);
)

(
~jbPreset = ( 'freqPulse1': 73.1626890278, 'freqPulse3': 72.714563012124, 'freqPulse2': 46.0722720623, 'hz': 223.19873691201, 'planetDrone_effect_2': 203.57695370913, 'pulseWidth2': 0.4870618224144, 'pulseWidth3': 0.78684626579285, 'brf': 59.39352798462, 'amp': 0.35, 'pulseWidth4': 0.74926328659058, 'freqPulse4': 249.57482814789, 'pulseWidth1': 0.94340088367462, 'planetDrone_effect_3': 6.559137916565)
) // photek

(
~jbPreset = ( 'freqPulse1': 330.41622698307, 'freqPulse3': 289.9096673727, 'freqPulse2': 61.709952950478, 'hz': 108.92707596302, 'planetDrone_effect_2': 88.718477487563, 'pulseWidth2': 0.83428972363472, 'pulseWidth3': 0.78778732061386, 'brf': 118.47548890114, 'amp': 0.35, 'pulseWidth4': 0.40330772399902, 'freqPulse4': 258.6726665505, 'pulseWidth1': 0.77961468696594, 'planetDrone_effect_3':  1.1721312880516)
) // controle fiscal de l'angoisse


(
~jbPreset = ( 'brf': 197.10433331013, 'hz': 266.90051404357, 'planetDrone_effect_2': 209.58455272913, 'freqPulse2': 279.60722652674, 'freqPulse1': 376.14806695223, 'amp': 0.35, 'planetDrone_effect_3': 4.2149395808578, 'pulseWidth2': 0.26936638355255, 'freqPulse3': 847.66782822609, 'pulseWidth3': 0.42332327365875, 'pulseWidth1': 0.55059802532196, 'freqPulse4': 920.66878509521, 'pulseWidth4': 0.26954197883606 );
)

(
~jbPreset = ( 'brf': 127.36667049527, 'hz': 84.641014688015, 'planetDrone_effect_2': 56.868106368184, 'freqPulse2': 241.8301843524, 'freqPulse1': 320.41999649525, 'amp': 0.35, 'planetDrone_effect_3': 1.5654154035449, 'pulseWidth2': 0.31256300210953, 'freqPulse3': 584.63140890598, 'pulseWidth3': 0.30383098125458, 'pulseWidth1': 0.56578725576401, 'freqPulse4': 209.17822036743, 'pulseWidth4': 0.62760746479034 );
)

(
~jbPreset = ( 'freqPulse1': 370.46782708168, 'freqPulse2': 387.24766552448,  'freqPulse3': 411.91687524319, 'freqPulse4': 306.09467983246,  'pulseWidth1': 150.56587934494,  'pulseWidth2': 94.839679002762, 'pulseWidth3': 178.42485308647,  'pulseWidth4': 43.195476531983, 'brf': 34.018780231476, 'planetDrone_effect_2': 254.21176478267, 'planetDrone_effect_3': 2.6953571081162, 'hz': 157.48465546131, 'amp': 0.35);
) // photek 2

(
~jbPreset = ( 'freqPulse1': 184.17928183079, 'freqPulse2': 387.24766552448, 'freqPulse3': 411.91687524319, 'freqPulse4': 306.09467983246, 'pulseWidth1': 150.56587934494, 'pulseWidth2': 94.839679002762, 'pulseWidth3': 178.42485308647, 'pulseWidth4': 38.195476531983, 'brf': 156.41414856911,  'planetDrone_effect_2': 220.84672480822, 'planetDrone_effect_3':  4.9143203377724, 'hz': 134.17719386816, 'amp': 0.35); // demi-photek
)

(
~jbPreset = (freqPulse1: rrand(50.0, 440.99), freqPulse2: rrand(50.1, 300.95), freqPulse3: rrand(50.1, 1000), freqPulse4: rrand(50.1, 990.9), pulseWidth1: rrand(0.25, 0.75), pulseWidth2: rrand(0.25, 0.75), pulseWidth3: rrand(0.25, 0.75), pulseWidth4: rrand(0.25, 0.75),  brf: rrand(40.1, 200.93), planetDrone_effect_2: rrand(50.1, 300.925), planetDrone_effect_3: rrand(0.51, 10.9625), hz: rrand(65.41, 300), amp: 0.35);
)


(
Ndef(\jb,{
	var sig, mix1, mix2, mix3, mix4, mix5;
	mix1 = Impulse.ar(
		freq: ~jbPreset[\hz] + 50 + ~jbPreset[\freqPulse1] + ~jbPreset[\planetDrone_effect_2] + (SinOsc.ar(0.075) * ~jbPreset[\planetDrone_effect_3]),
		// width:  SinOsc.ar(~jbPreset[\pulseWidth1]) + 0.25,
		mul: 1.7,
	);
	mix1 = BRF.ar(
		mix1,
		2000 + ~jbPreset[\brf] - (SinOsc.ar(0.15) * 1100),
		0.5
	);
	mix1 = Pan2.ar(
		mix1,
		SinOsc.ar(0.015) - 0.5
	);
	mix2 = Pulse.ar(
		freq: ~jbPreset[\hz] + 123 + ~jbPreset[\freqPulse2] + ~jbPreset[\planetDrone_effect_2] - (SinOsc.ar(0.05) * ~jbPreset[\planetDrone_effect_3]),
		width: SinOsc.ar(~jbPreset[\pulseWidth2]) + 0.25,
		mul: 1.8,
	);
	mix2 = BRF.ar(
		mix2,
		2000 + ~jbPreset[\brf] - (SinOsc.ar(0.08) * 1100),
		0.5);
	mix2 = Pan2.ar(
		mix2,
		SinOsc.ar(0.055)
	);
	mix3 = Pulse.ar(
		freq: ~jbPreset[\hz] - 27 + ~jbPreset[\freqPulse3] + ~jbPreset[\planetDrone_effect_2] + (SinOsc.ar(0.075) * ~jbPreset[\planetDrone_effect_3]),
		width: SinOsc.ar(~jbPreset[\pulseWidth3]) + 0.25,
		mul: 1.9,
	);
	mix3 = BRF.ar(
		mix3,
		2000 + ~jbPreset[\brf] - (SinOsc.ar(0.02) * 1100),
		0.5
	);
	mix3 = Pan2.ar(
		mix3 ,
		SinOsc.ar(0.15) - 0.5
	);
	mix4 = Pulse.ar(
		freq: ~jbPreset[\hz] - 13 + ~jbPreset[\freqPulse4] + ~jbPreset[\planetDrone_effect_2]- (SinOsc.ar(0.05) * ~jbPreset[\planetDrone_effect_3]),
		width: SinOsc.ar(~jbPreset[\pulseWidth4]) + 0.25,
		mul: 2.0,
	);
	mix4 = BRF.ar(
		mix4,
		2000 + ~jbPreset[\brf] -(SinOsc.ar(0.005) * 1100), 0.5);
	mix4 = Pan2.ar(
		mix4 ,
		SinOsc.ar(0.005)
	);

	// mix5 = LPF.ar(PinkNoise.ar(Ndef.ar(\jbMod)), SinOsc.kr(0.1, 0.0, 4000, 8800), 7.5, 0.0);

	sig = Mix.ar([
		mix1,
		mix2,
		mix3,
		mix4 //,
		// mix5
	]);

	// spread the signal

	sig = DFM1.ar(
		sig,
		LFPar.kr(0.15, 0.0, 800, 2400), // 6200,
		LFTri.kr(0.25, 0.0, 0.15, 0.65)
	);

	sig = Greyhole.ar(
		sig,
		delayTime:0.25 + (Ndef.kr(\jpMod, 1) * ~jbPreset[\brf])
	);

	sig = Splay.ar(sig)* ~jbPreset[\amp] * 0.051;
	sig = Limiter.ar(sig, 0.15);
	sig;
});
)

Ndef(\jb).play(0);

Ndef(\jb).clear(10);