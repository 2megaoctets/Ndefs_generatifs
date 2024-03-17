// 1102 modèle randseed

// 1403 edit, ajout PortedPlugins
// fabien l'a fait
// 0202 ajout HPF en amont de gverb, args nommés, ajout envs dans les args, moins d'opérations, edit gverb, ajout mod (?)

Ndef(\sdMod1).fadeTime_(7);

(
~sdModPreset = (freqSlope: , freqStart: , freqEnd: , iphaseSlope: , iphaseStart: , iphaseEnd: );
)

(
~sdModPreset = (freqSlope: 25000, freqStart: 1.0, freqEnd: 30, iphaseSlope: 50000, iphaseStart: 0.01, iphaseEnd: 2.0);
)

(
~sdModPreset = (freqSlope: rrand(2025, 250000), freqStart: rrand(1.0, 800), freqEnd: rrand(1.0, 800.0), iphaseSlope: rrand(20001, 100000), iphaseStart: rrand(0.0, 1.0), iphaseEnd: rrand(0.0, 2.0));
)

(
Ndef(\sdMod1, {
	LFCub.kr(
		Phasor.kr(0.0, ~sdModPreset[\freqSlope], ~sdModPreset[\freqStart], ~sdModPreset[\freqEnd]),
		Phasor.kr(0.0, ~sdModPreset[\iphaseSlope], ~sdModPreset[\iphaseStart], ~sdModPreset[\iphaseEnd]),
		3,
		6
	)
});
)

Ndef(\sdMod2).fadeTime_(10);

(
~sdMod2Preset = (speedSlope: 48000, speedStart: 0.001, speedEnd: 0.01, aSlope: 96000, aStart: 0.3, aEnd: 0.5, bSlope: 44100, bStart: 0.3, bEnd: 0.45, cSlope: 196000, cStart: 0.18, cEnd: 0.33);
)

(
~sdMod2Preset = (speedSlope: , speedStart: , speedEnd: , aSlope: , aStart: , aEnd: , bSlope: , bStart: , bEnd: , cSlope: , cStart: , cEnd: );
)

(
~sdMod2Preset = (speedSlope: , speedStart: , speedEnd: , aSlope: , aStart: , aEnd: , bSlope: , bStart: , bEnd: , cSlope: , cStart: , cEnd: );
)

(
~sdMod2Preset = (speedSlope: rrand(44100, 96000), speedStart: rrand(0.01, 1), speedEnd: rrand(0.01, 1), aSlope: rrand(44100, 96000), aStart: rrand(0.05, 0.97), aEnd: rrand(0.05, 0.97), bSlope: rrand(44100, 96000), bStart: rrand(0.05, 0.97), bEnd: rrand(0.05, 0.97), cSlope: rrand(44100, 96000), cStart: rrand(0.05, 0.97), cEnd: rrand(0.05, 0.97));
)


(
Ndef(\sdMod2, {
	var chen, sig;
	chen = Chen.kr(
		speed: Phasor.kr(0.0,~sdMod2Preset[\speedSlope], ~sdMod2Preset[\speedStart], ~sdMod2Preset[\speedEnd], ~sdMod2Preset[\speedEnd]),
		a: Phasor.kr(0.0, ~sdMod2Preset[\aSlope], ~sdMod2Preset[\aStart], ~sdMod2Preset[\aEnd], ~sdMod2Preset[\aEnd]),
		b: Phasor.kr(0.0, ~sdMod2Preset[\bSlope], ~sdMod2Preset[\bStart], ~sdMod2Preset[\bEnd], ~sdMod2Preset[\bEnd]),
		c: Phasor.kr(0.0, ~sdMod2Preset[\cSlope], ~sdMod2Preset[\cStart], ~sdMod2Preset[\cEnd], ~sdMod2Preset[\cEnd])
	);
	sig = SinOsc.ar(chen);
});
)

Ndef(\sdMod2).clear(1);

Ndef(\sd).fadeTime_(7);

(
~sdPreset = (random2: 0.4120153, random4: 37.25, random1: 0.00012, random3: 1.075,  dryLevel: -2.8, earlyRef: -2.2, tailLevel: 2.12265625, envs: 68, hpfLfo: 0.125, hpfFreq: 975, amp: 0.3, phasorSkew: 0.15, phasorMod: 0.75, phasorStages: 18, randSeed: 3953744, randSeed: 4608358, random3Factor: [ 362.72950172424, 158.4414768219 ]);
)

(
~sdPreset = ( 'random4': 166.71161150932, 'random3': 1.8330188798904, 'hz': 234.63791787148, 'dryLevel': -2.25,   'earlyRef': 0.2449935555458, 'amp': 0.3, 'tailLevel': 1.8750575162, 'random2': 0.6004249215126, envs: 43, hpfLfo: 0.0625, hpfFreq: 1027, 'random1': 0.00010452611684799, phasorSkew: 0.85, phasorMod: 0.25, phasorStages: 28, randSeed: 9154162 , random3Factor: [ 482.48176574707, 229.6308106184 ]);
)

(
~sdPreset = ( 'dryLevel': -2.9293020057678, 'tailLevel': 1.626927190423, 'earlyRef': -1.627618971467, 'hz': 118.84280915976, 'random2': 0.69399229884148, 'random1': 0.00010575314164162, 'random3': 1.0151849246025, 'envs': 79, 'amp': 0.3, hpfFreq: 124, hpfLfo: 0.15, 'random4': 129.59043478966 , phasorSkew: 0.5, phasorMod: 0.5, phasorStages: 8, randSeed: 9154162, random3Factor: [ 132.17046260834, 211.27869665623 ]) ;
)

(
~sdPreset = ( 'hpfFreq': 420, 'hz': 79.447018175125, 'random2': 0.59548714756966, 'random1': 0.0001445009803772, 'hpfLfo': 2.2932776784897, 'random3': 1.0393334960937, 'earlyRef': -1.488172724843, 'random4': 14.983815908432, 'dryLevel': -3.4241995668411, 'tailLevel': 1.7820497608185, 'amp': 0.3, 'envs': 64 , phasorSkew: 0.5, phasorMod: 0.5, phasorStages: 8, random3Factor: [ 863.85068893433, 534.45250689983 ]);
)

(
~sdPreset = ( 'hpfFreq': 1353, 'hz': 135.57551516056, 'random2': 0.67252621650696, 'random1': 0.00016268412590027, 'hpfLfo': 2.5256552696228, 'random3': 1.0688130867481, 'earlyRef': -2.5699128478765, 'random4': 238.69688606262, 'dryLevel': -1.8587717914581, 'tailLevel': 1.5515693694353, 'amp': 0.3, 'randSeed': 206854, 'envs': 87, phasorSkew: 0.5, phasorMod: 0.5, phasorStages: 8 , random3Factor: [ 608.81767272949, 389.56364750862 ]);
)

(
~sdPreset = ( 'envs': 87, 'hz': 335.57551516056, 'earlyRef': -2.5699128478765, 'hpfFreq': 1353, 'tailLevel': 1.5515693694353, 'random2': 0.67252621650696, 'amp': 0.3, 'random4': 238.69688606262, 'random1': 0.00016268412590027, 'dryLevel': -1.8587717914581, 'randSeed': 206854, 'hpfLfo': 2.5256552696228,'random3': 1.0688130867481, 'randSeed': 5267280 ,phasorSkew: 0.85, phasorMod: 0.85, phasorStages: 38, random3Factor: [34.695, 157.724]);
)

(
~sdPreset = (random2: rrand(0.25, 0.8), random4: rrand(1.0, 251), random1: rrand(0.0001, 0.00021), random3: rrand(1.01, 1.9), dryLevel: rrand(-3.96, 0.0), earlyRef: rrand(-3, 0.925), tailLevel: rrand(0.90125, 2.15), hz: rrand(65.41, 800), envs: rrand(30,99), hpfLfo: rrand(0.01, 3), hpfFreq: rrand(150, 1500), randSeed: 10000000.rand, phasorSkew: rrand(-1.0,1), phasorMod: rrand(0.1, 1), phasorStages: rrand(2,40),  amp: 0.1, random3Factor: [9e2.rand2, 7.35e2.rand]);
)

(
Ndef(\sd, {

	var sig, phaserSources, phaserCycle;
	thisThread.randSeed = ~sdPreset[\randSeed] ?? ({ 10000000.rand.debug("randSeed") });

	sig = EnvGen.ar(
		Env(
			{0.65.rand2 ** 3}!~sdPreset[\envs],
			{exprand(~sdPreset[\random1], ~sdPreset[\random2]  )} ! (~sdPreset[\envs] - 1),
			0.05,
			~sdPreset[\envs] - 2,
			0.0
		)
	);

	sig = ({
		sig * Blip.ar(
			LFPulse.kr(~sdPreset[\random3]) * ~sdPreset[\random3Factor],
			~sdPreset[\random4] * sig * 9 % [9,7,5.5]
		)
	}!4).mean;

	sig = HPF.ar(sig, SinOsc.kr(
		~sdPreset[\hpfLfo] + Ndef.kr(\sdMod2, 1, 2),
		LFPulse.kr(0.51),
		~sdPreset[\hpfFreq],
		(~sdPreset[\hpfFreq] * 1.32051282)
	),
	1.15);

	phaserSources = [SinOsc.kr(~sdPreset[\phasorSkew]),  Ndef.kr(\sdMod2, 1, 1)]; // skew: SinOsc.kr(0.5),
	phaserCycle = phaserSources.size * 0.25;

	sig = AnalogPhaserMod.ar(
		sig,
		Select.kr(phaserCycle, phaserSources),
		LFPulse.kr(~sdPreset[\phasorMod]), // modulation: LFPulse.kr(0.1),
		~sdPreset[\phasorStages]
	);

	// sig = Mix.ar(sig);

	sig = GVerb.ar(
		Splay.ar(sig, 0),
		roomsize: 100, // 200,
		revtime: Ndef.kr(\sdMod2, 1).linlin(-1, 1, 20, 35), // 23, // 385,
		damping: Ndef.kr(\sdMod, 1).linexp(-3,3,0.15,0.85), //0.15, //0.5,
		inputbw: 0.5,
		spread: 20, // 50,
		drylevel: ~sdPreset[\dryLevel],
		earlyreflevel:~sdPreset[\earlyRef],
		taillevel: ~sdPreset[\tailLevel]
	);
	sig = Mix.ar(sig) * ~sdPreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);
});
)

Ndef(\sd).play(0);

Ndef(\sd).clear(1);