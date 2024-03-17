// 1603 modulateurs, Dust au lieu de Impulse
// 2102 ajout AnalogPhaser, à moduler
// 1802 args, graphe, presets

Ndef(\suMod1).fadeTime_(7);

(
~suMod1Preset = (speedSlope: rrand(44100, 96000), speedStart: rrand(0.15, 1), speedEnd: rrand(0.15, 1), aSlope: rrand(44100, 96000), aStart: rrand(0.15, 1), aEnd: rrand(0.15, 1), bSlope: rrand(44100, 96000), bStart: rrand(0.15, 1), bEnd: rrand(0.15, 1), cSlope: rrand(44100, 96000), cStart: rrand(0.15, 1), cEnd: rrand(0.15, 1));
)

(
Ndef(\suMod1, {
	Chen.kr(
		Phasor.kr(0.0, ~suMod1Preset[\speedSlope], ~suMod1Preset[\speedStart], ~suMod1Preset[\speedEnd], ~suMod1Preset[\speedEnd]),
		Phasor.kr(0.0, ~suMod1Preset[\aSlope], ~suMod1Preset[\aStart], ~suMod1Preset[\aEnd], ~suMod1Preset[\aEnd]),
		Phasor.kr(0.0, ~suMod1Preset[\bSlope], ~suMod1Preset[\bStart], ~suMod1Preset[\bEnd], ~suMod1Preset[\bEnd]),
		Phasor.kr(0.0, ~suMod1Preset[\cSlope], ~suMod1Preset[\cStart], ~suMod1Preset[\cEnd], ~suMod1Preset[\cEnd])
	)
});
)

Ndef(\suMod2).fadeTime_(7);

(
~suMod2Preset = (formantfreqSlope: rrand(44100, 96100), formantfreqStart: rrand(5.0, 100), formantfreqEnd: rrand(5.0, 100), carrierfreqSlope: rrand(44100, 96000), carrierfreqStart: rrand(4.0, 180), carrierfreqEnd: rrand(4.0, 180), phaseshiftSlope: rrand(44100, 96000), phaseshiftStart: rrand(0.01, 0.8), phaseshiftEnd: rrand(0.01, 0.8), biasSlope: rrand(44100, 96000), biasStart: rrand(0.01, 0.95), biasEnd: rrand(0.01, 0.95), saturationSlope: rrand(44100, 96000), saturationStart:  rrand(0.15, 0.75), saturationEnd: rrand(0.15, 0.75), driveSlope: rrand(44100, 96000), driveStart: rrand(0.35, 1), driveEnd: rrand(0.35, 1), oversample: rrand(0,4));
)

(
Ndef(\suMod2, {
	AnalogTape.ar(
		NeoFormant.ar(
			Phasor.kr(0.0, ~suMod2Preset[\formantfreqSlope], ~suMod2Preset[\formantfreqStart], ~suMod2Preset[\formantfreqEnd], ~suMod2Preset[\formantfreqEnd]),
			Phasor.kr(0.0, ~suMod2Preset[\carrierfreqSlope], ~suMod2Preset[\carrierfreqStart], ~suMod2Preset[\carrierfreqEnd], ~suMod2Preset[\carrierfreqEnd]),
			Phasor.kr(0.0, ~suMod2Preset[\phaseshiftSlope], ~suMod2Preset[\phaseshiftStart], ~suMod2Preset[\phaseshiftEnd], ~suMod2Preset[\phaseshiftEnd])
		),
		Phasor.kr(0.0, ~suMod2Preset[\biasSlope], ~suMod2Preset[\biasStart], ~suMod2Preset[\biasEnd], ~suMod2Preset[\biasEnd]),
		Phasor.kr(0.0, ~suMod2Preset[\saturationSlope], ~suMod2Preset[\saturationStart], ~suMod2Preset[\saturationEnd], ~suMod2Preset[\saturationEnd]) * Ndef.kr(\sdMod1, 1, 0).abs,
		Phasor.kr(0.0, ~suMod2Preset[\driveSlope], ~suMod2Preset[\driveStart], ~suMod2Preset[\driveEnd], ~suMod2Preset[\driveEnd]) * Ndef.kr(\sdMod1, 1, 1).abs,
		~suMod2Preset[\oversample]
	)
});
)

Ndef(\su).fadeTime_(7);



(
~suPreset = (verbMul1: 1.88, delayTime: 0.0154, verbMul2: 1.28, dutyMaxLevel: 100.1,  locFbFactor: 0.8, loc2FbFactor: 25.45, loc3FbFactor: 1.625, amp: 0.15, inputRate: 11/8, attackRate: 4, decayRate: 4, factorRate: 1.25, del2: 0.01, del3: 0.25, impulseRate2: 0.25, attackRate2: 4, decayRate2: 4, factorRate2: 200, impulseRate3: 1, attackRate3: 0.0001, decayRate3: 0.05, factorRate3: 60, bpf1LfoRate: 0.25, bpf1MaxFreq: 907, bpf2LfoRate: 1/10, bpf2MaxFreq: 400, bpf3LfoRate: 0.5, bpf3MaxFreq: 800, fbGain: 0.025 );
)

(
~suPreset = ( 'bpf2MaxFreq': 481, 'loc3FbFactor': 1.5478957843781, 'attackRate': 2.606788277626, 'del2': 0.014747921586037, 'verbMul2': 5.0923924446106, 'bpf3LfoRate': 1.8185831797123, 'bpf1LfoRate': 0.20376715660095, 'loc2FbFactor': 7.571170258522, 'locFbFactor': 0.56367336750031, 'bpf1MaxFreq': 982, 'bpf2LfoRate': 0.15518953204155, 'factorRate2': 207, 'factorRate3': 54, 'bpf3MaxFreq': 1014, 'del3': 0.38892655074596, 'attackRate3': 0.040580005407333, 'dutyMaxLevel': 796.46572518349, 'impulseRate2': 5.1037675440311, 'amp': 0.25, 'verbMul1': 2.8605582427979, 'inputRate': 0.67233561144935, 'decayRate': 3.9577262759209, 'factorRate': 8.8845307826996, 'delayTime': 0.014311553001404, 'decayRate3': 0.076360139846802, 'impulseRate3': 3.380769610405, 'attackRate2': 1.6308920681477, 'decayRate2': 0.73822015523911, fbGain: 0.025  );
)

(
~suPreset = ( 'bpf2MaxFreq': 567, 'loc3FbFactor': 1.4624202823639, 'attackRate': 6.5117040276527, 'del2': 0.019540417551994, 'verbMul2': 1.9468469238281, 'bpf3LfoRate': 1.6579450273514, 'bpf1LfoRate': 0.71816377639771, 'loc2FbFactor': 1.7143434464931, 'locFbFactor': 0.78729843139648, 'bpf1MaxFreq': 1477, 'bpf2LfoRate': 0.38191156387329, 'factorRate2': 240, 'factorRate3': 59, 'bpf3MaxFreq': 941, 'del3': 0.53556900719802, 'attackRate3': 0.0054904809355736, 'dutyMaxLevel': 724.74836360216, 'impulseRate2': 5.5670514702797, 'amp': 0.25, 'verbMul1': 0.089870185852051, 'inputRate': 8.9522015121248, 'decayRate': 4.76869109869, 'factorRate': 9.9081506729126, 'delayTime': 0.021074039936066, 'decayRate3': 0.071730699539185, 'impulseRate3': 2.2366079688072, 'attackRate2': 5.2939974069595, 'decayRate2': 6.343303501606, fbGain: 0.025  );
)

(
~suPreset = ( 'bpf2MaxFreq': 607, 'loc3FbFactor': 1.5915118932724, 'attackRate': 7.9770498275757, 'del2': 0.027728331565857, 'verbMul2': 5.7399376106262, 'bpf3LfoRate': 0.082394406795502, 'bpf1LfoRate': 0.30470029115677, 'loc2FbFactor': 68.30790989995, 'locFbFactor': 0.57579760789871, 'bpf1MaxFreq': 1834, 'bpf2LfoRate': 0.29162122011185, 'factorRate2': 184, 'factorRate3': 70, 'bpf3MaxFreq': 805, 'del3': 0.32873823742072, 'attackRate3': 0.034216598534584, 'dutyMaxLevel': 161.00905740261, 'impulseRate2': 3.4190546274185, 'amp': 0.25, 'verbMul1': 3.7369066810608, 'inputRate': 3.1527024904887, 'decayRate': 5.8268003463745, 'factorRate': 7.860754609108, 'delayTime': 0.019305422782898, 'decayRate3': 0.027314434051514, 'impulseRate3': 5.4257053732872, 'attackRate2': 5.2688412964344, 'decayRate2': 2.8847979307175, fbGain: 0.025  );
)

(
~suPreset = ( 'bpf2MaxFreq': 745, 'loc3FbFactor': 1.0828200054169, 'attackRate': 7.2934935092926, 'del2': 0.024491477847099, 'verbMul2': 4.206123008728, 'bpf3LfoRate': 0.42890046000481, 'bpf1LfoRate': 0.89575519561768, 'loc2FbFactor': 51.140846627951, 'locFbFactor': 0.54969959497452, 'bpf1MaxFreq': 1494, 'bpf2LfoRate': 0.42753545641899, 'factorRate2': 136, 'factorRate3': 54, 'bpf3MaxFreq': 880, 'del3': 0.46862778564294, 'attackRate3': 0.04088287550211, 'dutyMaxLevel': 642.07390310764, 'impulseRate2': 0.40544977784157, 'amp': 0.25, 'verbMul1': 4.2187250328064, 'inputRate': 9.998263557752, 'decayRate': 2.4458189666271, 'factorRate': 2.9219608902931, 'delayTime': 0.019367585659027, 'decayRate3': 0.060073804855347, 'impulseRate3': 0.99852496385574, 'attackRate2': 6.8850601911545, 'decayRate2': 7.6127451956272, fbGain: 0.025  );
)

(
~suPreset = ( 'bpf2MaxFreq': 727, 'loc3FbFactor': 1.0136472606659, 'attackRate': 2.7065559625626, 'del2': 0.030388828635216, 'verbMul2': 0.28225341796875, 'bpf3LfoRate': 0.84296149969101, 'bpf1LfoRate': 0.72334891557693, 'loc2FbFactor': 23.316305214167, 'locFbFactor': 0.68488471746445, 'bpf1MaxFreq': 1152, 'bpf2LfoRate': 0.24978825449944, 'factorRate2': 120, 'factorRate3': 56, 'bpf3MaxFreq': 869, 'del3': 0.27648488183816, 'attackRate3': 0.012439724171162, 'dutyMaxLevel': 509.83145526648, 'impulseRate2': 5.3168013393879, 'amp': 0.25, 'verbMul1': 2.1492132568359, 'inputRate': 1.5825248824226, 'decayRate': 9.1545037209988, 'factorRate': 2.1029306650162, 'delayTime': 0.016078899860382, 'decayRate3': 0.0265944480896, 'impulseRate3': 1.1397345066071, 'attackRate2': 7.565201818943, 'decayRate2': 4.7833253145218, fbGain: 0.025  );
)


(
~suPreset = ( 'bpf2MaxFreq': 696, 'loc3FbFactor': 1.6509548425674, 'attackRate': 1.3161389827728, 'del2': 0.039547092556953, 'verbMul2': 1.3720874977112, 'bpf3LfoRate': 1.895530911684, 'bpf1LfoRate': 0.74636548757553, 'loc2FbFactor': 17.469393777847, 'locFbFactor': 0.84098260641098, 'bpf1MaxFreq': 1380, 'bpf2LfoRate': 0.476882147789, 'factorRate2': 208, 'factorRate3': 64, 'bpf3MaxFreq': 1083, 'del3': 0.25314053396384, 'attackRate3': 0.028441579949856, 'dutyMaxLevel': 985.83959100246, 'impulseRate2': 3.493435561657, 'amp': 0.25, 'verbMul1': 3.580430431366, 'inputRate': 4.1179840167363, 'decayRate': 1.4259598433971, 'factorRate': 4.7426894307137, 'delayTime': 0.019613366127014, 'decayRate3': 0.083346786499023, 'impulseRate3': 5.5428426861763, 'attackRate2': 3.9091641008854, 'decayRate2': 3.185898900032, fbGain: 0.025  );
)

(
~suPreset = ( 'bpf2MaxFreq': 481, 'loc3FbFactor': 1.4611287927628, 'attackRate': 1.466067969799, 'del2': 0.010678151845932, 'verbMul2': 0.33572574615479, 'bpf3LfoRate': 1.4681209003925, 'bpf1LfoRate': 0.66019973754883, 'loc2FbFactor': 19.013302361965, 'locFbFactor': 0.57914703130722, 'bpf1MaxFreq': 855, 'bpf2LfoRate': 0.17061470150948, 'factorRate2': 185, 'factorRate3': 65, 'bpf3MaxFreq': 912, 'del3': 0.49730950097243, 'attackRate3': 0.0065992775559425, 'dutyMaxLevel': 39.61094776392, 'impulseRate2': 1.1239016056061, 'amp': 0.25, 'verbMul1': 3.5675489425659, 'inputRate': 9.2730837795469, 'decayRate': 9.1110772013664, 'factorRate': 2.5019798874855, 'delayTime': 0.010740507125854, 'decayRate3': 0.030207138061523, 'impulseRate3': 3.5485887527466, 'attackRate2': 7.8289487957954, 'decayRate2': 1.4796967208385, fbGain: 0.025  );
)

(
Post << ~suPreset = (verbMul1: rrand(0.08,6), delayTime: rrand(0.01,0.022), verbMul2: rrand(0.08,6), dutyMaxLevel: rrand(0.1,1000),  locFbFactor: rrand(0.49,0.99), loc2FbFactor: rrand(1.45,100), loc3FbFactor: rrand(0.99,1.75), amp: 0.25, inputRate: rrand(1/9, 10), attackRate: rrand(0.5, 10), decayRate: rrand(0.55,10), factorRate: rrand(0.5,10), del2: rrand(1/1000,1/25), del3: rrand(1/8, 2/3), impulseRate2: rrand(0.25,8), attackRate2: rrand(0.25,8), decayRate2: rrand(0.25,8), factorRate2: rrand(100,300), impulseRate3: rrand(0.5,6), attackRate3: rrand(1/10000, 1/20), decayRate3: rrand(1/50, 1/10), factorRate3: rrand(50, 75), bpf1LfoRate: rrand(1/10,1), bpf1MaxFreq: rrand(850, 2000), bpf2LfoRate: rrand(1/20, 1/2), bpf2MaxFreq: rrand(450, 750), bpf3LfoRate: rrand(0.01, 2), bpf3MaxFreq: rrand(750, 1200), fbGain: 0.025 /*rrand(0.081, 0.09)*/);
)


(
Ndef(\su, {

	var src, loc,
	src2, loc2,
	src3, loc3, sig, localIn, locFb, loc2Fb, loc3Fb;

	src = Decay2.ar(
		Dust.ar(~suPreset[\inputRate]), // in
		LFNoise2.kr(~suPreset[\attackRate]).range(0.001,0.0001), // attackTime
		LFNoise2.kr(~suPreset[\decayRate]).range(0.005, 0.05) // decayTime
	)!2 * Saw.ar(
		LFNoise2.kr(~suPreset[\factorRate]).exprange(40, 3000)
	);

	localIn = LocalIn.ar(6);

	loc = BPF.ar(
		localIn[0..1] + [src, 0],
		LFNoise0.kr(~suPreset[\bpf1LfoRate]).range(10, ~suPreset[\bpf1MaxFreq]).lag,
		3.2
	);

	loc = GVerb.ar(
		loc,
		100,
		4,
		mul:~suPreset[\verbMul1],
		add:loc
	);

	loc = Compander.ar(
		loc,
		loc,
		0.5,
		1,
		0.001
	);

	loc = (loc * 0.501).tanh;

	loc = Compander.ar(
		loc,
		loc,
		0.1,
		1,
		0.1
	);

	loc = DelayC.ar(
		loc,
		(~suPreset[\delayTime] * (3 + Ndef.kr(\suMod1, 1, 0))), // 1.25,
		~suPreset[\delayTime]
	);

	locFb = loc.reverse * ~suPreset[\locFbFactor];


	src2 = Decay2.ar(
		TDuty.ar(
			~suPreset[\impulseRate2] , // Impulse.kr(LFPulse.kr(~suPreset[\impulseRate2])), // 1/4,
			0,
			Dseq(
				[1, 0.5, 003, 0.1 + ~suPreset[\dutyMaxLevel] ],
				inf
			)
		),
		LFNoise2.kr(~suPreset[\attackRate2]).range(0.001, 0.0001),
		LFNoise2.kr(~suPreset[\decayRate2]).range(0.005, 0.05)
	)!2 * Saw.ar(
		LFNoise2.kr(~suPreset[\factorRate2]).exprange(40, 10000)
	);

	loc2 = BPF.ar(
		localIn[2..3] + [src2, 0],
		LFNoise2.kr(~suPreset[\bpf2LfoRate]).range(40, ~suPreset[\bpf2MaxFreq]),
		3.2
	);

	loc2 = GVerb.ar(
		Select.ar(
			LFPulse.kr(0.4),
			[loc2, Ndef.ar(\suMod2)]
		),
		100,
		2 + (2 + Ndef.kr(\suMod1, 1, 1)), // 4,
		mul: ~suPreset[\verbMul2],
		add:loc2
	);

	loc2 = AnalogPhaser.ar(
		loc2,
		SinOsc.kr(Ndef.kr(\suMod1, 1, 2)), // SinOsc.kr(0.1, 0.0, 0.5, 0.5),
		SinOsc.kr(0.2),
		0.5,
		SinOsc.kr(0.25).abs,
		8
	);

	loc2 = Compander.ar(
		loc2,
		loc2,
		0.9,
		1,
		0.001
	);

	loc2 = (loc2 * 0.51).tanh;

	loc2 = Compander.ar(
		loc2,
		loc2,
		0.1,
		1,
		0.1
	);

	loc2 = DelayC.ar(
		loc2,
		~suPreset[\del2] * 1.52,
		~suPreset[\del2]
	);

	loc2Fb = loc2.reverse * ~suPreset[\loc2FbFactor];

	src3 = Decay2.ar(
		Impulse.ar(~suPreset[\impulseRate3]),
		~suPreset[\attackRate3],
		~suPreset[\decayRate3]
	) * SinOsc.ar(~suPreset[\factorRate3]);

	loc3 = src3 + localIn[4..5];

	loc3 = BPF.ar(
		loc3,
		LFNoise2.kr(~suPreset[\bpf3LfoRate]).range(140, ~suPreset[\bpf3MaxFreq]), // ~suPreset[\bpf3MaxFreq],
		3.2
	).softclip;

	loc3 = DelayN.ar(
		loc3,
		~suPreset[\del3] * 1.66,
		[0, ~suPreset[\del3]]
	);

	loc3Fb = loc3.reverse * ~suPreset[\loc3FbFactor];

	LocalOut.ar(LPF.ar(locFb ++ loc2Fb ++ loc3Fb, 800) * ~suPreset[\fbGain] );

	sig = (loc * 0.25) + (Compander.ar(loc2, loc2, 0.1, 1, 0.05) * 0.35);

	sig = Mix.ar(Mix.ar(sig));

	sig = HPF.ar(sig, 140);

	sig = sig * ~suPreset[\amp] * 0.35 ;

	sig = Limiter.ar(sig, 0.5, 0.01);

	sig;
});
)

Ndef(\su).play(0);

Ndef(\su).clear(1);