// 0402 : noms et valeurs args, défactorisation, bricolage du graphe, presets

(
Ndef(\so).fadeTime_(8);
)

(
~soPreset = ( 'ringzFreq3': 6.2040175676346, 'freqShift': 4.0343942046165, 'amp': 0.1, 'decTime2': 20.005044460297, 'decTime4': 20.927260196209, 'verbMix': 0.70221376419067, 'verbRoom': 0.91988340616226, 'impulseFreq3': 1.3906883478165, 'decTime3': 20.872667014599,  'impulseFreq2': 2.1057690262794, 'lpfFreq': 2950, 'impulseFreq4': 0.73921285867691, 'ringzFreq1': 2.5892039299011, 'ringzFreq4': 1686.6701041937,  'decTime1': 15.799389612675, 'impulseFreq1': 2.9455904948711, 'ringzFreq2': 2964.2417677641 );

)

(
~soPreset = ( 'ringzFreq3': 5.2508779644966, 'freqShift': 6.6301471829414, 'amp': 0.1, 'decTime2': 7.0314254403114,  'decTime4': 1.2212558507919, 'verbMix': 0.54674935340881, 'verbRoom': 0.44258635044098, 'impulseFreq3': 3.0099483370781, 'decTime3': 24.348577368259, 'impulseFreq2': 1.8354434847832, 'lpfFreq': 7214, 'impulseFreq4': 0.99219098091125, 'ringzFreq1'19.058267307281, 'ringzFreq4': 2037.6204398632,  'decTime1': 13.104228246212, 'impulseFreq1': 3.3875318264961, 'ringzFreq2': 1208.2647934556 );
)

(
~soPreset = ( 'impulseFreq3': 1.6314856648445, 'decTime4': 4.7802492380142, 'amp': 0.1, 'ringzFreq4': 2021.4903221846,   'ringzFreq2': 167.37881863117, 'verbMix': 0.56481478214264, 'impulseFreq1': 0.52543658018112, 'ringzFreq1': 13.430479621887, 'decTime1': 3.6744107961655,   'ringzFreq3': 18.954051506519, 'decTime3': 14.509682095051, 'verbRoom': 0.7553838133812, 'impulseFreq2': 1.7603520750999, 'freqShift': 6.2172504782677, 'lpfFreq': 4000,  'impulseFreq4': 2.9696991443634, 'decTime2': 8.1985654473305 );
)

(
~soPreset = ( 'impulseFreq1': 2.093001947403,'impulseFreq2': 1.8356354951859,  'impulseFreq3': 0.19212594032288, 'impulseFreq4': 0.87129695415497, 'decTime4': 19.048883116245, 'amp': 0.1, 'ringzFreq4': 3741.6549161911,  'ringzFreq2': 59.166047632694, 'verbMix': 0.81814384460449, 'ringzFreq1': 9.533673286438, 'decTime1': 10.212671530247, 'ringzFreq3': 20.550584459305, 'decTime3': 2.3211903214455, 'verbRoom': 0.88140196800232, 'freqShift': 5.7593709230423, 'lpfFreq': 2500, 'decTime2': 12.866828644276 );
)

(
~soPreset = ( 'impulseFreq3': 0.7340164899826, 'decTime4': 5.8875451207161, 'amp': 0.1, 'ringzFreq4': 568.96771802902,  'ringzFreq2': 1361.1444695592, 'verbMix': 0.66200258731842, 'impulseFreq1': 1.2195501804352, 'ringzFreq1': 17.413083362579, 'decTime1': 22.292819941044, 'ringzFreq3': 19.792308557034, 'decTime3': 11.636413145065, 'verbRoom': 0.36161170005798, 'impulseFreq2': 0.11912944316864, 'freqShift': 2.3738852143288, 'impulseFreq4': 1.8583229422569, 'lpfFreq': 4000, 'decTime2': 20.149031305313 );
)


(
~soPreset = (impulseFreq1: rrand(0.01,4), impulseFreq2: rrand(0.1,4), impulseFreq3: rrand(0.1,4), impulseFreq4: rrand(0.1,4), ringzFreq1: rrand(0.2,25), ringzFreq2: rrand(0.5,4000), ringzFreq3: rrand(0.1,25), ringzFreq4: rrand(0.2,4000), decTime1: rrand(0.1,25), decTime2: rrand(0.1,25), decTime3: rrand(0.1,25), decTime4: rrand(0.1,25), verbMix: rrand(0.3,0.9), verbRoom: rrand(0.25,0.95), freqShift: rrand(0.1,8), lpfFreq: rrand(2000, 8000), amp: 0.1);
)


(
Ndef(\so, {
	var sig;
	sig = CoinGate.ar(
			[8,4,8,2]/10 * Line.kr(0,1,30),
			T2A.ar(
				Impulse.kr(
				[4 + floor(~soPreset[\impulseFreq1] ),
					8 + floor(~soPreset[\impulseFreq2]),
					2 + floor(~soPreset[\impulseFreq3]),
					4 + floor(~soPreset[\impulseFreq4])]
				) // impulse
			) // t2a
		); // coingate

	sig = Ringz.ar(
		sig,
		[
			45 + ~soPreset[\ringzFreq1],
			9e3 + ~soPreset[\ringzFreq2],
			50 + ~soPreset[\ringzFreq3],
			8e3 + ~soPreset[\ringzFreq4]
		], // freq
		[
			6 + ~soPreset[\decTime1],
			1 + ~soPreset[\decTime2],
			10 + ~soPreset[\decTime3],
			3 + ~soPreset[\decTime4]
		] / 7, // dec time
		[4,2,8,4] // mul
	).sin.sum.tanh!2;

	sig = LPF.ar(
		sig ,
		~soPreset[\lpfFreq]
	);

	sig = FreqShift.ar(
		sig,
		~soPreset[\freqShift]/(4..16)
	);

	sig = FreeVerb.ar(
		sig,
		mix: abs(~soPreset[\verbMix]),
		room: abs(~soPreset[\verbRoom]),
		damp:  0.33,
		mul: 1.0,
		add: 0.0
	);

	sig = Splay.ar(sig, 1);
	sig = sig * ~soPreset[\amp] * 0.35;


	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\so).play(0);

Ndef(\so).clear(1);