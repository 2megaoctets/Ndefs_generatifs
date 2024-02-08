// 0802 grosses réfections

Ndef(\soMod1).fadeTime_(7);

(
~soMod1Preset =
)

(
~soMod1Preset =
)

(
~soMod1Preset = (freqSlope: , freqStart: , freqEnd: , numharmSlope: , numharmStart: , numharmEnd: , mulSlope: , mulStart: , mulEnd: , addSlope: , addStart: , addEnd: );
)

(
~soMod1Preset = (freqSlope: rrand(0.1,100), freqStart: rrand(0.1,20), freqEnd: rrand(0.1,40), numharmSlope: rrand(1,100), numharmStart: rrand(1,200), numharmEnd: rrand(1,200), mulSlope: rrand(0.1,100), mulStart: rrand(1.0,1.5), mulEnd: rrand(0.75,1.5), addSlope: rrand(0.1,10), addStart: rrand(1.0,10), addEnd: rrand(1.0,10));
)


(
Ndef(\soMod1, {
	LeakDC.ar(
		Blip.ar(
			Phasor.kr(0.0, ~soMod1Preset[\freqSlope], ~soMod1Preset[\freqStart], ~soMod1Preset[\freqEnd], ~soMod1Preset[\freqEnd]),
			Phasor.kr(0.0, ~soMod1Preset[\numharmSlope], ~soMod1Preset[\numharmStart], ~soMod1Preset[\numharmEnd], ~soMod1Preset[\numharmEnd]),
			Phasor.kr(0.0, ~soMod1Preset[\mulSlope], ~soMod1Preset[\mulStart], ~soMod1Preset[\mulEnd], ~soMod1Preset[\mulEnd]),
			1 + Phasor.kr(0.0, ~soMod1Preset[\addSlope], ~soMod1Preset[\addStart], ~soMod1Preset[\addEnd], ~soMod1Preset[\addEnd])
		)
	)
});
)

(
Ndef(\so).fadeTime_(8);
)

(
~soPreset = ( 'ringzFreq3': 6.2040175676346, 'freqShift': [1.0463554382324, 2.4057776711204, 3.7651999040083, 5.1246221368963, 6.4840443697843, 7.8434666026722, 9.2028888355602, 10.562311068448, 11.921733301336, 13.281155534224, 14.640577767112, 16.0], 'amp': 0.1, 'decTime2': 20.005044460297, 'decTime4': 20.927260196209, 'verbMix': 0.70221376419067, 'verbRoom': 0.91988340616226, 'impulseFreq3': 1.3906883478165, 'decTime3': 20.872667014599,  'impulseFreq2': 2.1057690262794, 'lpfFreq': 2950, 'impulseFreq4': 0.73921285867691, 'ringzFreq1': 2.5892039299011, 'ringzFreq4': 1686.6701041937,  'decTime1': 15.799389612675, 'verbMixLfo': 1.25, 'verbRoomLfo': 1.125, 'impulseFreq1': 2.9455904948711, 'coinProbArray': [2,2,2,2], 'coinLineDur': 12.5, 'ringzFreq2': 2964.2417677641, 'ringzMul': [3,2,8,4] );
)

(
~soPreset = ( 'ringzFreq3': 9.7110120773315, 'freqShift': [4.1584684848785, 5.2349713498896, 6.3114742149006, 7.3879770799117, 8.4644799449227, 9.5409828099337, 10.617485674945, 11.693988539956, 12.770491404967, 13.846994269978, 14.923497134989, 16.0], 'amp': 0.15, 'decTime2': 0.76502343416214, 'decTime4': 1.3099163413048, 'verbMix': 0.69394955635071, 'verbRoom': 0.66354058980942, 'impulseFreq3': 0.41789809465408, 'decTime3': 16.032494068146,  'impulseFreq2': 3.4629608511925, 'lpfFreq': 3420, 'impulseFreq4': 3.4473466396332, 'ringzFreq1': 4.0677775382996, 'ringzFreq4': 3321.7034950733, 'decTime1': 17.402307403088, 'verbMixLfo': 0.75, 'verbRoomLfo': 1.35, 'impulseFreq1': 3.850760653019, 'coinProbArray': [5,3,2,4], 'coinLineDur': 25.65, 'ringzFreq2': 3770.4411435127, 'ringzMul': [2,3,4,8] );
)

(
~soPreset = ( 'ringzFreq3': 6.9114730119705, 'freqShift': [0.8395735502243, 1.5439880132675, 0.54398801326752, 3.3961952447891], 'amp': 0.15, 'decTime2': 15.132611906528, 'decTime4': 13.766912651062, 'verbMix': 0.40537347793579, 'verbRoom': 0.72955687046051, 'impulseFreq3': 2.8628251314163, 'decTime3': 1.9299045562744,  'impulseFreq2': 1.9344278693199, 'lpfFreq': 3202, 'impulseFreq4': 2.7757254004478, 'ringzFreq1': 16.900631523132, 'ringzFreq4': 674.53752396107,  'decTime1': 19.847937679291, 'impulseFreq1': 2.8049270284176, 'verbMixLfo': 0.125, 'verbRoomLfo': 0.0625, 'coinProbArray': [2,3,3,2], 'coinLineDur': 45.9, 'ringzFreq2': 1228.2455871701, 'ringzMul':[8,2,4,2]  );
) // drum and bass

(
~soPreset = ( 'ringzFreq3': 5.2508779644966, 'freqShift': [0.84388465881348, 2.2217133261941, 3.5995419935747, 4.9773706609553, 6.3551993283358, 7.7330279957164, 9.110856663097, 10.488685330478, 11.866513997858, 13.244342665239, 14.622171332619, 16.0], 'amp': 0.1, 'decTime2': 7.0314254403114,  'decTime4': 1.2212558507919, 'verbMix': 0.54674935340881, 'verbRoom': 0.44258635044098, 'impulseFreq3': 3.0099483370781, 'decTime3': 24.348577368259, 'impulseFreq2': 1.8354434847832, 'lpfFreq': 7214, 'impulseFreq4': 0.99219098091125, 'ringzFreq1' : 19.058267307281, 'ringzFreq4': 2037.6204398632,  'decTime1': 13.104228246212, 'verbMixLfo': 1.25, 'verbRoomLfo': 2.25, 'impulseFreq1': 3.3875318264961, 'coinProbArray': [2,3,4,2], 'coinLineDur': 10.5, 'ringzFreq2': 1208.2647934556, 'ringzMul':  [5,3,5,3]);
)

(
~soPreset = ( 'impulseFreq3': 1.6314856648445, 'decTime4': 4.7802492380142, 'amp': 0.1, 'ringzFreq4': 2021.4903221846,   'ringzFreq2': 167.37881863117, 'verbMix': 0.56481478214264, 'impulseFreq1': 0.52543658018112, 'ringzFreq1': 13.430479621887, 'decTime1': 3.6744107961655,   'ringzFreq3': 18.954051506519, 'decTime3': 14.509682095051, 'verbRoom': 0.7553838133812, 'impulseFreq2': 1.7603520750999, 'freqShift': [1.0135338783264, 2.3759398893877, 3.7383459004489, 5.1007519115101, 6.4631579225714, 7.8255639336326, 9.1879699446938, 10.550375955755, 11.912781966816, 13.275187977878, 14.637593988939, 16.0], 'verbMixLfo': 0.33, 'verbRoomLfo': 0.0625, 'lpfFreq': 4000,  'impulseFreq4': 2.9696991443634, 'coinProbArray': [4,2,5,3], 'coinLineDur': 38.54,  'decTime2': 8.1985654473305, 'ringzMul': [8,4,8,3] );
)

(
~soPreset = ( 'impulseFreq1': 2.093001947403,'impulseFreq2': 1.8356354951859,  'impulseFreq3': 0.19212594032288, 'impulseFreq4': 0.87129695415497, 'decTime4': 19.048883116245, 'amp': 0.1, 'ringzFreq4': 3741.6549161911,  'ringzFreq2': 59.166047632694, 'verbMix': 0.81814384460449, 'ringzFreq1': 9.533673286438, 'decTime1': 10.212671530247, 'ringzFreq3': 20.550584459305, 'decTime3': 2.3211903214455, 'verbRoom': 0.88140196800232, 'freqShift': [2.8372465372086, 4.0338604883714, 5.2304744395343, 6.4270883906971, 7.62370234186, 8.8203162930228, 10.016930244186, 11.213544195349, 12.410158146511, 13.606772097674, 14.803386048837, 16.0], 'verbMixLfo': 0.1, 'verbRoomLfo': 0.25, 'lpfFreq': 2500, 'coinProbArray': [8,5,6,2], 'coinLineDur': 18, 'decTime2': 12.866828644276, 'ringzMul':  [8,5,5,3]);
)

(
~soPreset = ( 'impulseFreq3': 0.7340164899826, 'decTime4': 5.8875451207161, 'amp': 0.1, 'ringzFreq4': 568.96771802902,  'ringzFreq2': 1361.1444695592, 'verbMix': 0.66200258731842, 'impulseFreq1': 1.2195501804352, 'ringzFreq1': 17.413083362579, 'decTime1': 22.292819941044, 'ringzFreq3': 19.792308557034, 'decTime3': 11.636413145065, 'verbRoom': 0.36161170005798, 'impulseFreq2': 0.11912944316864, 'freqShift': 2.3738852143288, 'verbMixLfo': 0.05, 'verbRoomLfo': 0.15, 'impulseFreq4': 1.8583229422569, 'lpfFreq': 4000, 'coinProbArray': [4,2,4,8], 'coinLineDur': 15, 'decTime2': 20.149031305313, 'ringzMul': [8,5,8,4] );
)


(
~soPreset = (impulseFreq1: rrand(0.01,4), impulseFreq2: rrand(0.1,4), impulseFreq3: rrand(0.1,4), impulseFreq4: rrand(0.1,4), ringzFreq1: Array.linrand(rrand(1,4),rrand(0.2,25), rrand(10.0,25)), ringzFreq2: rrand(0.5,4000), ringzFreq3: rrand(0.1,25), ringzFreq4: rrand(0.2,4000), decTime1: rrand(0.1,25), decTime2: rrand(0.1,25), decTime3: rrand(0.1,25), decTime4: rrand(0.1,25), verbMix: rrand(0.3,0.9), verbMixLfo: rrand(0.075,2.5), verbRoomLfo: rrand(0.05,3.5), verbRoom: rrand(0.25,0.95), freqShift: Array.interpolation(12, rrand(0.4,4.2),16)  /*rrand(0.1,8)*/, lpfFreq: rrand(2000, 8000), coinProbArray: Array.rand(4,2,8), coinLineDur: rrand(10.0,50.0), ringzMul: Array.rand(4,2,8),  amp: 0.1);
)

(
Ndef(\so, {
	var sig;
	sig = CoinGate.ar(
		~soPreset[\coinProbArray]/10 * Line.kr(0,1,~soPreset[\coinLineDur]),
		// [8,4,8,2]/10 * Line.kr(0,1,30),
		T2A.ar(
			Impulse.kr(
				[
					4 + ~soPreset[\impulseFreq1] ,
					8 + ~soPreset[\impulseFreq2],
					2 + ~soPreset[\impulseFreq3],
					4 + ~soPreset[\impulseFreq4]
				]
			) // impulse
		) // t2a
	); // coingate

	sig = Ringz.ar(
		Mix.ar(sig),
		[
			45 + ~soPreset[\ringzFreq1],
			9e3 + [~soPreset[\ringzFreq2], ~soPreset[\ringzFreq3] ],
			50 + ~soPreset[\ringzFreq3],
			8e3 + [ ~soPreset[\ringzFreq4], ~soPreset[\ringzFreq1]]
		], // freq
		[
			6 + ~soPreset[\decTime1],
			1 + ~soPreset[\decTime2],
			10 + ~soPreset[\decTime3],
			3 + ~soPreset[\decTime4]
		] / 7, // dec time
		~soPreset[\ringzMul] // [4,2,8,2] // mul
	).sin.sum.tanh!2;

	sig = LPF.ar(
		Mix.ar(sig) ,
		~soPreset[\lpfFreq]
	);

	sig = FreqShift.ar(
		Mix.ar(sig),
		// (~soPreset[\freqShift]%(4..16)).debug('freqShift') + Ndef.kr(\soMod1)
		(1 + ~soPreset[\freqShift]) //   * Ndef.kr(\soMod1, 1).cos ).scope
	);

	sig = FreeVerb.ar(
		Mix.ar(sig),
		mix:   LFTri.kr(~soPreset[\verbMixLfo], 0.0, ~soPreset[\verbMix], 1 + ~soPreset[\verbMix]/2).linlin(0, 1 + ~soPreset[\verbMix], 0, 1),
		room:  LFPulse.kr(~soPreset[\verbRoomLfo], 0.0, 0.5, ~soPreset[\verbRoom], ~soPreset[\verbRoom]/2),
		damp:  0.15, // abs(SinOsc.kr(0.133)).linlin(0,1,0.15,0.75),
		// mul: 1.15,
		// add: 0.0
	);

	sig = Splay.ar(sig, 1);
	sig = sig * ~soPreset[\amp] * 0.1;


	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\so).play(0);

Ndef(\so).clear(1);