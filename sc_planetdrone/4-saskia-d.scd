// 1102 modèle randseed
// fabien l'a fait
// 0202 ajout HPF en amont de gverb, args nommés, ajout envs dans les args, moins d'opérations, edit gverb, ajout mod (?)

Ndef(\sdMod).fadeTime_(7);

(
~sdModPreset = (freqSlope: , freqStart: , freqEnd: , iphaseSlope: , iphaseStart: , iphaseEnd: );
)

(
~sdModPreset = (freqSlope: 0.025, freqStart: 1.0, freqEnd: 30, iphaseSlope: 0.05, iphaseStart: 0.01, iphaseEnd: 2.0);
)

(
~sdModPreset = (freqSlope: rrand(20.25, 5), freqStart: rrand(1.0, 800), freqEnd: rrand(1.0, 800.0), iphaseSlope: rrand(20.01, 0.1), iphaseStart: rrand(0.0, 1.0), iphaseEnd: rrand(0.0, 2.0));
)

(
Ndef(\sdMod, {
	LFCub.kr(
		Phasor.kr(0.0, ~sdModPreset[\freqSlope], ~sdModPreset[\freqStart], ~sdModPreset[\freqEnd]),
		Phasor.kr(0.0, ~sdModPreset[\iphaseSlope], ~sdModPreset[\iphaseStart], ~sdModPreset[\iphaseEnd]),
		3,
		6
	)
});
)

Ndef(\sd).fadeTime_(7);

(
~sdPreset = (random2: 0.4120153, random4: 37.25, random1: 0.00012, random3: 1.075,  dryLevel: -2.8, earlyRef: -2.2, tailLevel: 2.12265625, envs: 68, hpfLfo: 0.125, hpfFreq: 975, amp: 0.3);
)

(
~sdPreset = ( 'random4': 166.71161150932, 'random3': 1.8330188798904, 'hz': 234.63791787148, 'dryLevel': -2.25,   'earlyRef': 0.2449935555458, 'amp': 0.3, 'tailLevel': 1.8750575162, 'random2': 0.6004249215126, envs: 43, hpfLfo: 0.0625, hpfFreq: 1027, 'random1': 0.00010452611684799 );
)

(
~sdPreset = ( 'dryLevel': -2.9293020057678, 'tailLevel': 1.626927190423, 'earlyRef': -1.627618971467, 'hz': 118.84280915976, 'random2': 0.69399229884148, 'random1': 0.00010575314164162, 'random3': 1.0151849246025, 'envs': 79, 'amp': 0.3, hpfFreq: 124, hpfLfo: 0.15, 'random4': 129.59043478966 ) ;
)

(
~sdPreset = ( 'hpfFreq': 420, 'hz': 79.447018175125, 'random2': 0.59548714756966, 'random1': 0.0001445009803772, 'hpfLfo': 2.2932776784897, 'random3': 1.0393334960937, 'earlyRef': -1.488172724843, 'random4': 14.983815908432, 'dryLevel': -3.4241995668411, 'tailLevel': 1.7820497608185, 'amp': 0.3, 'envs': 64 );
)

(
~sdPreset = ( 'hpfFreq': 1353, 'hz': 135.57551516056, 'random2': 0.67252621650696, 'random1': 0.00016268412590027, 'hpfLfo': 2.5256552696228, 'random3': 1.0688130867481, 'earlyRef': -2.5699128478765, 'random4': 238.69688606262, 'dryLevel': -1.8587717914581, 'tailLevel': 1.5515693694353, 'amp': 0.3, 'randSeed': 206854, 'envs': 87 );
)

(
~sdPreset = (random2: rrand(0.25, 0.8), random4: rrand(1.0, 251), random1: rrand(0.0001, 0.00021), random3: rrand(1.01, 1.9), dryLevel: rrand(-3.96, 0.0), earlyRef: rrand(-3, 0.925), tailLevel: rrand(0.90125, 2.15), hz: rrand(65.41, 300), envs: rrand(30,99), hpfLfo: rrand(0.01, 3), hpfFreq: rrand(150, 1500), randSeed: 10000000.rand, amp: 0.1);
)


(
Ndef(\sd, {

	var sig;
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
			LFPulse.kr(~sdPreset[\random3]) * [9e2.rand2, 7.35e2.rand],
			~sdPreset[\random4] * sig * 9 % [9,7,5.5]
		)
	}!4).mean;

	sig = HPF.ar(sig, SinOsc.kr(
		~sdPreset[\hpfLfo],
		LFPulse.kr(0.51),
		~sdPreset[\hpfFreq],
		(~sdPreset[\hpfFreq] * 1.32051282)
	),
	1.15);

	sig = GVerb.ar(
		sig,
		roomsize: 100, // 200,
		revtime: LFPulse.kr(Ndef.kr(\sdMod), 0.0, 0.5, 10, 13), // 23, // 385,
		damping: Ndef.kr(\sdMod, 1).linexp(-3,3,0.15,0.85), //0.15, //0.5,
		inputbw: 0.5,
		spread: 20, // 50,
		drylevel: ~sdPreset[\dryLevel],
		earlyreflevel:~sdPreset[\earlyRef],
		taillevel: ~sdPreset[\tailLevel]
	);
	sig = Mix.ar(sig) * ~sdPreset[\amp] * 0.3;
	sig = Limiter.ar(sig, 0.5);
});
)

Ndef(\sd).play(0);

Ndef(\sd).clear(1);