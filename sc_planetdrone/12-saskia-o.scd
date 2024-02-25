// 2102 refait
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
~soMod1Preset = (freqSlope: rrand(10000,441900), freqStart: rrand(0.1,20), freqEnd: rrand(0.1,40), numharmSlope: rrand(10000,441100), numharmStart: rrand(1,200), numharmEnd: rrand(1,200), mulSlope: rrand(10000,441100), mulStart: rrand(1.0,1.5), mulEnd: rrand(0.75,1.5), addSlope: rrand(1000,441110), addStart: rrand(1.0,10), addEnd: rrand(1.0,10));
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
~soPreset = ( 'amp': 0.1, 'verbMixLfo': 1.6423566073179, 'decTime4': 4.121671974659, 'decTime1': 22.999062466621, 'lpfFreq': 4247, 'ringzFreq4': 8880.7957517624, 'ringzFreq1': [ 5.6920595332406, 30.565202306686, 44.059827364816, 4.451746231618, 26.226069281051, 11.217813811282, 41.652829185981, 25.632597139678, 9.3477118178413, 1.7760468214992, 39.087819146882, 26.349729016601, 1.4451484898359, 0.95377291316195, 1.2736707137529, 2.2649766850007 ], 'ringzFreq2': 5304.3171705008, 'impulseFreq2': 8.593653678894, 'freqShift': [ 2.5204460859299, 3.7458600781181, 4.9712740703063, 6.1966880624945, 7.4221020546826, 8.6475160468708, 9.872930039059, 11.098344031247, 12.323758023435, 13.549172015624, 14.774586007812, 16.0 ], 'impulseFreq3': 2.910839676857, 'coinLineDur': 32.757802009583, 'ringzFreq3': 8552.6391752958, 'decTime3': 30.71303716898, 'impulseFreq1': 4.4617722511292, 'verbRoomLfo': 0.4940611243248, 'verbRoom': 0.47554087638855, 'coinProbArray': [ 6, 7, 3, 8 ], 'ringzMul': [ 5, 3, 4, 2 ], 'impulseFreq4': 4.0070617198944, 'decTime2': 18.727619481087, 'verbMix': 0.30981616973877, 'decTimeDiv': 8 );
)

(
~soPreset = ( 'amp': 0.1, 'verbMixLfo': 1.4904607951641, 'decTime4': 15.94241669178, 'decTime1': 18.781378912926, 'lpfFreq': 4049, 'ringzFreq4': 8152.3037135601, 'ringzFreq1': [ 32.91426693483, 19.173539946282, 17.541377285032, 25.274772328324, 33.659299053462, 33.468817246833, 19.751086699026, 26.611979841194, 34.614156082187, 25.864194156865 ], 'ringzFreq2': 161.934891224, 'impulseFreq2': 8.3138175964355, 'freqShift': [ 2.1545033454895, 3.4131848595359, 4.6718663735823, 5.9305478876287, 7.1892294016751, 8.4479109157215, 9.706592429768, 10.965273943814, 12.223955457861, 13.482636971907, 14.741318485954, 16.0 ], 'impulseFreq3': 2.8200503587723, 'coinLineDur': 24.915385246277, 'ringzFreq3': 9028.3760378957, 'decTime3': 17.51179022789, 'impulseFreq1': 4.8029194831848, 'verbRoomLfo': 2.7209664285183, 'verbRoom': 0.73627806901932, 'coinProbArray': [ 7, 5, 8, 7 ], 'ringzMul': [ 7, 5, 8, 2 ], 'impulseFreq4': 4.1238126754761, 'decTime2': 6.7699910879135, 'verbMix': 0.438126039505, 'decTimeDiv': 6 )
)

(
Post << ~soPreset = ( 'amp': 0.1, 'verbMixLfo': 0.70107585787773, 'decTime4': 13.907386982441, 'decTime1': 6.9938727498055, 'lpfFreq': 3976, 'ringzFreq4': 7890.3197827339, 'ringzFreq1': [ 43.246298016335, 18.637579381307, 42.661010907511, 13.727827299612, 37.268096037731, 32.349164400691, 16.855165015204, 25.226023009756, 39.318104617681, 10.919205891766 ], 'ringzFreq2': 96.466201484, 'impulseFreq2': 9.1778157711029, 'freqShift': [ 0.75674195289612, 2.142492684451, 3.5282434160059, 4.9139941475608, 6.2997448791157, 7.6854956106706, 9.0712463422255, 10.45699707378, 11.842747805335, 13.22849853689, 14.614249268445, 16.0 ], 'impulseFreq3': 2.2059736251831, 'coinLineDur': 20.921092033386, 'ringzFreq3': 9004.5744515777, 'decTime3': 25.021273517609, 'impulseFreq1': 4.871427822113, 'verbRoomLfo': 2.9249746382236, 'verbRoom': 0.55860961675644, 'coinProbArray': [ 5, 7, 2, 3 ], 'ringzMul': [ 4, 8, 2, 7 ], 'impulseFreq4': 4.137788772583, 'decTime2': 20.645671010017, 'verbMix': 0.33222706317902, 'decTimeDiv': 7 )
) // drum and bass

(
~soPreset = ( 'amp': 0.1, 'verbMixLfo': 1.5295840680599, 'decTime4': 25.527067196369, 'decTime1': 12.332154476643, 'lpfFreq': 2411, 'ringzFreq4': 9558.5417954922, 'ringzFreq1': [ 10.397223116229, 11.181881109279, 9.6636902064914, 21.633382906303, 24.907856110012, 23.209463304445, 7.7475562477717, 14.492349904867, 5.4787081999337, 19.895183999854, 18.484598931604, 6.2513141430982, 3.8675665304262, 22.75508757869 ], 'ringzFreq2': 1631.4908416271, 'impulseFreq2': 8.7770864486694, 'freqShift': [ 3.3960031032562, 4.5418210029602, 5.6876389026642, 6.8334568023682, 7.9792747020721, 9.1250926017761, 10.27091050148, 11.416728401184, 12.562546300888, 13.708364200592, 14.854182100296, 16.0 ], 'impulseFreq3': 2.1230124235153, 'coinLineDur': 45.509524345398, 'ringzFreq3': 8103.2672632694, 'decTime3': 30.205740892887, 'impulseFreq1': 4.1526807785034, 'verbRoomLfo': 1.7741918504238, 'verbRoom': 0.36719068288803, 'coinProbArray': [ 6, 2, 7, 7 ], 'ringzMul': [ 7, 8, 3, 7 ], 'impulseFreq4': 4.8472623825073, 'decTime2': 3.8461717963219, 'verbMix': 0.36033511161804, 'decTimeDiv': 5 );
)

(
~soPreset = ( 'amp': 0.1, 'verbMixLfo': 1.8462592333555, 'decTime4': 16.226501893997, 'decTime1': 7.326843547821, 'lpfFreq': 3785, 'ringzFreq4': 6483.9877920628, 'ringzFreq1': [ 24.251014321381, 20.629510807121, 23.440123120643, 27.597076882215, 20.29823807214, 18.034126808637, 18.002967889984, 22.921890257624, 18.647686218679, 16.678706899633, 16.554243328106, 19.817590063903, 17.647579915645, 25.496148817836 ], 'ringzFreq2': 4912.7388609052, 'impulseFreq2': 8.288926410675, 'freqShift': [ 3.8856149196625, 4.9869226542386, 6.0882303888148, 7.1895381233909, 8.290845857967, 9.3921535925432, 10.493461327119, 11.594769061695, 12.696076796272, 13.797384530848, 14.898692265424, 16.0 ], 'impulseFreq3': 2.6194267272949, 'coinLineDur': 29.555926322937, 'ringzFreq3': 8994.5975010395, 'decTime3': 11.732583093643, 'impulseFreq1': 4.2208875656128, 'verbRoomLfo': 2.2992608189583, 'verbRoom': 0.51698157787323, 'coinProbArray': [ 6, 3, 6, 5 ], 'ringzMul': [ 5, 6, 8, 6 ], 'impulseFreq4': 4.6486982107162, 'decTime2': 22.055185508728, 'verbMix': 0.72439076900482, 'decTimeDiv': 9 );
)

(
~soPreset = ( 'amp': 0.1, 'verbMixLfo': 2.307151889801, 'decTime4': 17.721319723129, 'decTime1': 15.309808409214, 'lpfFreq': 5601, 'ringzFreq4': 8939.2556102753, 'ringzFreq1': [ 21.171826575708, 24.210634410561, 22.154062543712, 12.823593649307, 20.400594059611, 22.861666391177, 10.405030490841, 38.223516586323, 32.722603756545, 22.382959878986, 19.48902896164, 6.8477495889833, 8.7265271964876, 22.013887433291, 28.750338276126, 37.331219356496, 6.0722143703933 ], 'ringzFreq2': 1659.8773124814, 'impulseFreq2': 8.2465366363525, 'freqShift': [ 3.8019652605057, 4.9108775095506, 6.0197897585956, 7.1287020076405, 8.2376142566854, 9.3465265057304, 10.455438754775, 11.56435100382, 12.673263252865, 13.78217550191, 14.891087750955, 16.0 ], 'impulseFreq3': 2.2842127084732, 'coinLineDur': 18.194093704224, 'ringzFreq3': 9189.002440381, 'decTime3': 23.180130934715, 'impulseFreq1': 4.7487515926361, 'verbRoomLfo': 2.0761399745941, 'verbRoom': 0.80034478902817, 'coinProbArray': [ 7, 3, 8, 8 ], 'ringzMul': [ 5, 3, 6, 8 ], 'impulseFreq4': 4.3664180040359, 'decTime2': 14.96082649231, 'verbMix': 0.60682146549225, 'decTimeDiv': 9 ); // cowbellz
)

(
~soPreset = ( 'amp': 0.1, 'verbMixLfo': 1.2344987422228, 'decTime4': 14.159740936756, 'decTime1': 21.054126274586, 'lpfFreq': 2028, 'ringzFreq4': 9700.0150725842, 'ringzFreq1': [ 24.555319462461, 26.176188684905, 25.215587148841, 19.224088037598, 22.277679749348, 26.472029294569, 21.109457707133, 23.866102442065, 25.244788614047, 22.554171214749 ], 'ringzFreq2': 5504.4861255884, 'impulseFreq2': 9.0396702766418, 'freqShift': [ 3.3381048679352, 4.4891862435774, 5.6402676192197, 6.7913489948619, 7.9424303705042, 9.0935117461465, 10.244593121789, 11.395674497431, 12.546755873073, 13.697837248715, 14.848918624358, 16.0 ], 'impulseFreq3': 2.4476811885834, 'coinLineDur': 47.906031608582, 'ringzFreq3': 9075.5184428811, 'decTime3': 17.195944094658, 'impulseFreq1': 5.0627336978912, 'verbRoomLfo': 1.608315962553, 'verbRoom': 0.39758348464966, 'coinProbArray': [ 3, 7, 4, 4 ], 'ringzMul': [ 6, 6, 3, 5 ], 'impulseFreq4': 4.2069886922836, 'decTime2': 21.211811089516, 'verbMix': 0.84832370281219, 'decTimeDiv': 6 );
)


(
Post << ~soPreset = (impulseFreq1: rrand(4.0,5.2), impulseFreq2: rrand(8.0,9.2), impulseFreq3: rrand(2.0,3), impulseFreq4: rrand(4.0,5), ringzFreq1: Array.linrand(rrand(10,25),rrand(0.2,25), rrand(31.0,49)), ringzFreq2: rrand(70.5,9000), ringzFreq3: rrand(8050.1,9975), ringzFreq4: rrand(6000.2,9999), decTime1: rrand(6.1,33), decTime2: rrand(1.1,26), decTime3: rrand(10.1,35), decTime4: rrand(3.1,28), verbMix: rrand(0.3,0.9), verbMixLfo: rrand(0.075,2.5), verbRoomLfo: rrand(0.05,3.5), verbRoom: rrand(0.25,0.95), freqShift: Array.interpolation(12, rrand(0.4,4.2),16)  /*rrand(0.1,8)*/, lpfFreq: rrand(2000, 8000), coinProbArray: Array.rand(4,2,8), coinLineDur: rrand(10.0,50.0), ringzMul: Array.rand(4,2,8), decTimeDiv: rrand(5,9),  amp: 0.1);
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
					~soPreset[\impulseFreq1] ,
					~soPreset[\impulseFreq2],
					~soPreset[\impulseFreq3],
					~soPreset[\impulseFreq4]
				]
			) // impulse
		) // t2a
	); // coingate

	sig = Ringz.ar(
		Mix.ar(sig),
		[
			~soPreset[\ringzFreq1],
			[~soPreset[\ringzFreq2], ~soPreset[\ringzFreq3] ],
			~soPreset[\ringzFreq3],
			[ ~soPreset[\ringzFreq4], 8e3 + ~soPreset[\ringzFreq1]]
		], // freq
		[
			~soPreset[\decTime1],
			~soPreset[\decTime2],
			~soPreset[\decTime3],
			~soPreset[\decTime4] - Ndef.ar(\soMod1)
		] / ~soPreset[\decTimeDiv], // dec time
		~soPreset[\ringzMul] // [4,2,8,2] // mul
	).sin.sum.tanh!2;

	sig = LPF.ar(
		Mix.ar(sig) ,
		~soPreset[\lpfFreq]
	);

/*	sig = FreqShift.ar(
		Mix.ar(sig),
		// (~soPreset[\freqShift]%(4..16)).debug('freqShift') + Ndef.kr(\soMod1)
		(1 + (~soPreset[\freqShift] * Ndef.ar(\soMod1,1))) //   * Ndef.kr(\soMod1, 1).cos ).scope
	);*/

	sig = FreeVerb.ar(
		Mix.ar(sig),
		mix:   LFTri.kr(
			~soPreset[\verbMixLfo], 0.0, ~soPreset[\verbMix], ~soPreset[\verbMix]/2).linlin(0, 1 + ~soPreset[\verbMix], 0, 1),
		room:  LFPulse.kr(~soPreset[\verbRoomLfo], 0.0, 0.5, ~soPreset[\verbRoom], ~soPreset[\verbRoom]/2),
		damp:  0.15, // abs(SinOsc.kr(0.133)).linlin(0,1,0.15,0.75),
		// mul: 1.15,
		// add: 0.0
	);

	sig = Splay.ar(sig, 1);
	sig = HPF.ar(sig, 140);
	sig = sig * ~soPreset[\amp] * 0.01651;


	sig = Limiter.ar(sig, 0.5);

	sig;

});
)


Ndef(\so).play(0);

Ndef(\so).clear(10);