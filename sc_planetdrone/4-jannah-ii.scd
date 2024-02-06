// 0202 freqShifter et pan2 décalés
// 0602 BPeakEQ dans les args
// 0402 fabien: randseed

Ndef(\modJii).fadeTime_(7);

(
~modJiiPreset = (freqSlope: , freqStart: , freqEnd: , iphaseSlope: , iphaseStart: , iphaseEnd: , widthSlope: , widthStart: , widthEnd: );
)

(
~modJiiPreset = (freqSlope: 0.15, freqStart: rrand(0.2, 10), freqEnd: rrand(0.5, 30), iphaseSlope: 0.051, iphaseStart: rrand(0.0,0.5), iphaseEnd: rrand(0.0,1), widthSlope: 0.05, widthStart: rrand(0.25, 0.85), widthEnd: rrand(0.35, 0.75));
)


(
Ndef(\modJii, {
	SinOsc.kr(
		LFPulse.kr(
			Phasor.kr(0.0, ~modJiiPreset[\freqSlope], ~modJiiPreset[\freqStart], ~modJiiPreset[\freqEnd]),
			Phasor.kr(0.0, ~modJiiPreset[\iphaseSlope], ~modJiiPreset[\iphaseStart], ~modJiiPreset[\iphaseEnd]),
			Phasor.kr(0.0, ~modJiiPreset[\widthSlope], ~modJiiPreset[\widthStart], ~modJiiPreset[\widthEnd])
		)
	)
});
)

Ndef(\modJii2).fadeTime_(7);

(
(~modJii2Preset = (freqSlope: , freqStart: , freqEnd: , iphaseSlope: , iphaseStart: , iphaseEnd: ));
)

(
(~modJii2Preset = (freqSlope: 0.15, freqStart: rrand(0.2, 10), freqEnd: rrand(0.5, 20), iphaseSlope: 0.051, iphaseStart: rrand(0.0,pi/2), iphaseEnd: rrand(0.0,pi/2)));
)


(
Ndef(\modJii2, {
	LFCub.kr(
		Phasor.kr(0.0, ~modJii2Preset[\freqSlope], ~modJii2Preset[\freqStart], ~modJii2Preset[\freqEnd]),
		Phasor.kr(0.0, ~modJii2Preset[\iphaseSlope], ~modJii2Preset[\iphaseStart], ~modJii2Preset[\iphaseEnd])
	)
});
)

Ndef(\modJii).release;


Ndef(\jii).fadeTime_(7);

(
~jiiPreset = ( 'select2': 0.97263513803482, 'panMod': 0.31818971633911, 'BPEQFreq': [ 105, 1862, 5565, 13777 ], 'hz': 201.4397143805, 'verbMod': 0.17171596765518, 'verbRoom': 0.52677083611488, 'BPEQDb': [ 1.0688570618629, 4.6506732702255, 0.49649937152863, 5.6204924941063 ], 'fshift': 0.90356091111898, 'select1': 0.81351760625839, 'verbMix': 0.25184020519257, 'BPEQRq': [ 0.090525282621384, 2.8480485343933, 2.8543651008606, 3.9894473385811 ], 'fshiftDivArray': [ 1.0924831306934, 2.0844394829869, 3.0763958352804, 4.0683521875739, 5.0603085398674, 6.0522648921609, 7.0442212444544, 8.0361775967479, 9.0281339490414, 10.020090301335, 11.012046653628, 12.004003005922, 12.995959358215, 13.987915710509, 14.979872062802, 15.971828415096, 16.963784767389 ], 'amp': 0.1 );
)

(
~jiiPreset = ( 'hz': 177.07698191881, 'verbMix': 0.61388869762421, 'verbMod': 0.20972373008728, 'select2': 0.69824129343033, 'select1': 0.74743874669075, 'panMod': 0.11909799575806, 'amp': 0.1, 'BPEQDb': [ 3.8580838680267, 1.689071059227, 3.5661113023758, 2.1827009677887 ], 'BPEQFreq': [ 190, 1311, 5820, 8534 ], 'verbRoom': 0.85076924860477, 'fshift': 0.86964001506567, 'BPEQRq': [ 3.8650637757778, 0.59152651071548, 2.099433619976, 2.7301608562469 ], 'fshiftDivArray': [ 1.0685763478279, 2.0594410984218, 3.0503058490157, 4.0411705996096, 5.0320353502035, 6.0229001007974, 7.0137648513913, 8.0046296019852, 8.9954943525791, 9.986359103173, 10.977223853767, 11.968088604361, 12.958953354955, 13.949818105549, 14.940682856143, 15.931547606736, 16.92241235733 ] );
)

(
~jiiPreset = ( 'hz': 83.101049114466, 'verbMix': 0.33861166238785, 'verbMod': 0.26486097335815, 'select2': 0.33851983547211, 'select1': 0.86257763504982, 'panMod': 0.28460540771484, 'amp': 0.1, 'BPEQDb': [ 0.65803779363632, 2.6864680409431, 2.3868790626526, 1.9489462375641 ], 'BPEQFreq': [ 133, 1822, 6699, 13556 ], 'verbRoom': 0.77386855483055, 'fshift': 0.44697747826576, 'BPEQRq': [ 0.8696642434597, 1.6869309127331, 2.1598124802113, 3.8689773833752 ], 'fshiftDivArray': [ 1.0430575680733, 2.0400808133185, 3.0371040585637, 4.0341273038089, 5.0311505490541, 6.0281737942994, 7.0251970395446, 8.0222202847898, 9.019243530035, 10.01626677528, 11.013290020525, 12.010313265771, 13.007336511016, 14.004359756261, 15.001383001506, 15.998406246752, 16.995429491997 ] );
)

(
~jiiPreset = ( 'hz': 128.47020175934, 'verbMix': 0.31554254055023, 'verbMod': 0.062970604896545, 'select2': 0.44766632318497, 'select1': 0.32848893404007, 'panMod': 0.48487186431885, 'amp': 0.1, 'BPEQDb': [ 5.4810669183731, 3.2703097820282, 4.2788370370865, 2.4843106269836 ], 'BPEQFreq': [ 191, 1700, 5469, 12148 ], 'verbRoom': 0.47836382091045, 'fshift': 0.39260165840387, 'BPEQRq': [ 2.2499186813831, 1.9095256686211, 1.3186674773693, 0.80067906141281 ], 'fshiftDivArray': [ 1.0075280058384, 2.0054813495278, 3.0034346932173, 4.0013880369067, 4.9993413805962, 5.9972947242856, 6.995248067975, 7.9932014116645, 8.9911547553539, 9.9891080990434, 10.987061442733, 11.985014786422, 12.982968130112, 13.980921473801, 14.978874817491, 15.97682816118, 16.974781504869 ] );
)

(
~jiiPreset = ( 'hz': 406.36076949477, 'verbMix': 0.17909510731697, 'verbMod': 0.045994164943695, 'select2': 0.31584572792053, 'select1': 0.31979692578316, 'panMod': 0.37190895080566, 'amp': 0.1, 'BPEQDb': [ 5.2225273728371, 0.97371907234192, 1.4251277923584, 3.6801275014877 ], 'BPEQFreq': [ 177, 1908, 5201, 7917 ], 'verbRoom': 0.59750739336014, 'fshift': 0.30387362092733, 'BPEQRq': [ 2.5961435782909, 0.18070378184319, 3.1636937344074, 0.3819401717186 ], 'fshiftDivArray': [ 1.049005202055, 2.0452961915731, 3.0415871810913, 4.0378781706095, 5.0341691601276, 6.0304601496458, 7.026751139164, 8.0230421286821, 9.0193331182003, 10.015624107718, 11.011915097237, 12.008206086755, 13.004497076273, 14.000788065791, 14.997079055309, 15.993370044827, 16.989661034346 ] );
)

(
~jiiPreset = ( 'hz': 245.90925105691, 'verbMix': 0.15178654432297, 'verbMod': 0.84343694925308, 'select2': 0.41921538114548, 'select1': 0.6796868622303, 'panMod': 0.57591238021851, 'amp': 0.1, 'BPEQDb': [ 0.54998798370361, 2.1362112402916, 0.99065467119217, 1.0058256030083 ], 'BPEQFreq': [ 115, 1781, 5785, 8680 ], 'verbRoom': 0.59111735224724, 'fshift': 0.82253579348326, 'BPEQRq': [ 0.23687841534615, 0.3486802148819, 2.2135684585571, 0.33620452046394 ], 'fshiftDivArray': [ 1.0168845927715, 2.0115852940083, 3.006285995245, 4.0009866964817, 4.9956873977184, 5.9903880989552, 6.9850888001919, 7.9797895014286, 8.9744902026653, 9.9691909039021, 10.963891605139, 11.958592306376, 12.953293007612, 13.947993708849, 14.942694410086, 15.937395111322, 16.932095812559 ] );
)

(
~jiiPreset = ( 'hz': 158.02466554403, 'verbMix': 0.77921522736549, 'verbMod': 0.53000092029572, 'select2': 0.56869864463806, 'select1': 0.19313989281654, 'panMod': 0.33927879333496, 'amp': 0.1, 'BPEQDb': [ 2.5944887280464, 3.8807692289352, 2.5227049708366, 3.5499676585197 ], 'BPEQFreq': [ 198, 1040, 6630, 11180 ], 'verbRoom': 0.7941189289093, 'fshift': 0.86832003742456, 'BPEQRq': [ 2.1002683770657, 3.9349707579613, 0.90090033054352, 0.751803201437 ], 'fshiftDivArray': [ 1.0613622188568, 2.0520499223471, 3.0427376258373, 4.0334253293276, 5.0241130328178, 6.0148007363081, 7.0054884397984, 7.9961761432886, 8.9868638467789, 9.9775515502691, 10.968239253759, 11.95892695725, 12.94961466074, 13.94030236423, 14.93099006772, 15.921677771211, 16.912365474701 ] );
)

(
~jiiPreset = ( 'hz': 83.042685518265, 'verbMix': 0.85198189496994, 'verbMod': 0.56606868505478, 'select2': 0.37084699869156, 'select1': 0.65724962353706, 'panMod': 0.79146671295166, 'amp': 0.1, 'BPEQDb': [ 4.5620158076286, 0.3659576177597, 3.7717656970024, 0.83726156949997 ], 'BPEQFreq': [ 191, 1813, 6309, 14828 ], 'verbRoom': 0.33249417245388, 'fshift': 0.78068639487028, 'BPEQRq': [ 2.3763137471676, 1.2223051166534, 1.9328665232658, 2.8684922349453 ], 'fshiftDivArray': [ 0.99325327515602, 1.9895963995904, 2.9859395240247, 3.9822826484591, 4.9786257728934, 5.9749688973278, 6.9713120217621, 7.9676551461965, 8.9639982706308, 9.9603413950652, 10.9566845195, 11.953027643934, 12.949370768368, 13.945713892803, 14.942057017237, 15.938400141671, 16.934743266106 ] );
)

(
Post << ~jiiPreset = (verbMod: rrand(0.01, 0.99), select1: rrand(0.1, 0.95), select2: rrand(0.1, 1), panMod: rrand(0.1, 0.9), verbMix: rrand(0.1, 0.93), verbRoom: rrand(0.1, 0.925), fshift: rrand(0.1, 0.9625), hz: rrand(65.41, 300), BPEQFreq: [100.rrand(200), 1000.rrand(2000), 5000.rrand(7000), 7100.rrand(15000)], BPEQRq: Array.rand(4, 0.01, 4), BPEQDb: Array.rand(4, 0.1, 6), fshiftDivArray: Array.interpolation(17, rrand(0.99, 1.1), rrand(16.9, 17.01)),  amp: 0.1);
)

(
Ndef(\jii, {
var gamma, pd_1a = ~jiiPreset[\verbMod],
	pd_2a = ~jiiPreset[\select1] * 0.5,
	pd_3a = ~jiiPreset[\select2] * 0.5,
	pd_4a = ~jiiPreset[\panMod],
	sig, select;
	thisThread.randSeed = 100000000; // anciennement stocké dans une var, dont on n'a pas besoin

	gamma= {[rrand(30, 50), rrand(50, 70), rrand(50, 70), rrand(70, 100)].choose.midicps * LFNoise2.kr(1, 0.01, 1)} ! 24;


	select = SelectX.kr(
		[SinOsc,LFTri].choose.kr(2.rrand(25).reciprocal).range(0,2) - pd_2a,
		[
			0.7.rrand(1),
			LFGauss.kr(
				Latch.kr(
					LFNoise2.kr(1).range(1/5, 5.rrand(20)).reciprocal - pd_3a,
					Impulse.kr(LFNoise2.kr(3.rrand(10).reciprocal).range(0.5, 3.rrand(6)))
				),
				SinOsc.kr(3.rrand(15).reciprocal).range(0.07.rrand(0.16), 0.25.rrand(0.4))
			),
			0.1.rrand(0.5)
		]
	);

	sig = RLPF.ar(
		LFSaw.ar(gamma)/4,
		gamma * LFCub.kr(rrand(0.01, 0.1), 0, 2, 3),
		LFNoise2.kr(1/8, 0.6, 0.7)
	);

	sig =FreeVerb.ar(
		sig,
		0.12 + (SinOsc.kr(pd_1a).linexp(-1,1,0.01,0.5)),
		0.32 ,
		0.32 - (Ndef.kr(\modJii2).linexp(-1,1,0.01,0.28))
	);

	sig = BPeakEQ.ar(
		sig,
		~jiiPreset[\BPEQFreq],
		~jiiPreset[\BPEQRq],
		~jiiPreset[\BPEQDb]
	).mean;

	sig = LeakDC.ar(
		Normalizer.ar(
			sig,
			0.8,
			0.1
		)
	);
	sig = FreqShift.ar(
		sig,
		(0.01 + (~jiiPreset[\fshift] * Ndef.kr(\modJii2).abs))
		/ ~jiiPreset[\fshiftDivArray] // Array.interpolation(17, rrand(0.99, 1.1), rrand(16.9, 17.01))
	);

	sig = Pan2.ar(
		sig,
		LFNoise2.kr(0.1.exprand(10)).range(-0.25, 0.25) + (LFNoise1.kr(pd_4a) * Ndef.kr(\modJii))
	);

	sig = FreeVerb.ar(
		sig,
		~jiiPreset[\verbMix],
		~jiiPreset[\verbRoom],
		LFPar.kr(Ndef.kr(\modJii, 1), 0.0, 0.35, 0.5),
		0.5 // 1
	);

	sig = Mix.ar(sig) * ~jiiPreset[\amp] * 0.25;
	sig = Limiter.ar(sig, 0.5);


});
)

Ndef(\jii).play(0);

Ndef(\jii).clear(1);