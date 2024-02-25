// on le garde 1102
// 0602 correc graphe, valeurs (défactorisation), args: noms et rajouts
// 0602 SinOscFB > moduler feedbacks et phases
// 0602 GVerb > modulateurs kr

Ndef(\jggMod1).fadeTime_(10);

(
~jggMod1Preset = ( 'addEnd': 2.3718769454956, 'freqStart': 6.2291535139084, 'freqEnd': 235.71421432495, 'feedbackSlope': 2.2054973840714, 'mulSlope': 3.4130862951279, 'mulEnd': 2.6127896010876, 'feedbackEnd': 9.1384343810214, 'addSlope': 9.0292476415634, 'addStart': 2.0075826263428, 'freqSlope': 11.226348519325, 'feedbackStart': 10.717210703575, 'mulStart': 1.5026814937592 );
)


(
~jggMod1Preset = ( 'addEnd': 2.6177252960205, 'freqStart': 370.85513246059, 'freqEnd': 87.461136579514, 'feedbackSlope': 15.801784873009, 'mulSlope': 16.540633201599, 'mulEnd': 0.79096135497093, 'feedbackEnd': 9.3061386282907, 'addSlope': 14.514628052711, 'addStart': 2.8835500717163, 'freqSlope': 17.761908769608, 'feedbackStart': 10.00070835113, 'mulStart': 2.5129414200783);
)


(
~jggMod1Preset = ( 'addEnd': 1.7129609298706, 'freqStart': 320.12693738937, 'freqEnd': 402.1498272419, 'feedbackSlope': 9.0335274934769, 'mulSlope': 16.925080060959, 'mulEnd': 2.1508405208588, 'feedbackEnd': 6.9575091800699, 'addSlope': 24.770491123199, 'addStart': 1.9101921463013, 'freqSlope': 10.559861063957, 'feedbackStart': 11.331535554477, 'mulStart': 2.7677668333054);
)


(
~jggMod1Preset = ( 'addEnd': 1.1714751052856, 'freqStart': 124.45498645306, 'freqEnd': 198.38977766037, 'feedbackSlope': 5.5277272462845, 'mulSlope': 26.464914917946, 'mulEnd': 2.7077156603336, 'feedbackEnd': 9.055407670877, 'addSlope': 18.641082882881, 'addStart': 2.893508644104, 'freqSlope': 15.378718614578, 'feedbackStart': 0.35066740889941, 'mulStart': 2.4426015615463);
)


(
~jggMod1Preset = (freqSlope: 10, freqStart: 0.1, freqEnd: 0.4, feedbackSlope: 30, feedbackStart: 0.0, feedbackEnd: 2pi, mulSlope: 10, mulStart: 0.75, mulEnd: 1.5, addSlope: 10, addStart: -0.25, addEnd: 0);
)

(
~jggMod1Preset = (freqSlope: rrand(10,2000), freqStart: rrand(1.0,440), freqEnd: rrand(1.0,440), feedbackSlope: rrand(1.0,30), feedbackStart: rrand(0.0,4pi), feedbackEnd: rrand(0.0,4pi), mulSlope: rrand(1.0,30), mulStart: rrand(0.75,3), mulEnd: rrand(0.75,3), addSlope: rrand(1.0,30), addStart: rrand(0.76,3), addEnd: rrand(0.76,3));
)

(
Ndef(\jggMod1, {
	SinOscFB.kr(
		Phasor.kr(0.0, ~jggMod1Preset[\freqSlope], ~jggMod1Preset[\freqStart], ~jggMod1Preset[\freqEnd], ~jggMod1Preset[\freqEnd]),
		Phasor.kr(0.0, ~jggMod1Preset[\feedbackSlope], ~jggMod1Preset[\feedbackStart], ~jggMod1Preset[\feedbackEnd], ~jggMod1Preset[\feedbackEnd]),
		Phasor.kr(0.0, ~jggMod1Preset[\mulSlope], ~jggMod1Preset[\mulStart], ~jggMod1Preset[\mulEnd], ~jggMod1Preset[\mulEnd]),
		Phasor.kr(0.0, ~jggMod1Preset[\addSlope], ~jggMod1Preset[\addStart], ~jggMod1Preset[\addEnd], ~jggMod1Preset[\addEnd])
	)
});
)


Ndef(\jgg).fadeTime_(7);

(
~jggPreset = ( 'roomSize': 12.887491464615, 'sine1Div1': [ 9.3023982048035, 10.538230681419, 11.774063158035, 13.009895634651, 14.245728111267, 15.481560587883 ], 'revTimeLfoFreq': 0.39778846502304, 'srcADiv': [ 3.1953446865082, 3.5194255481591, 3.8763756039636, 4.2695285402086 ], 'freqShift2': [ 87.193410038948, 1463.7574148283, 24572.794761756 ], 'sine2Freq2': 744.55554592133, 'sine1Div2': [ 6.9214919567108, 8.9979395437241 ], 'freqShift2Mul': 0.12266545295715, 'sine2Mul': 500.39725260735, 'sine2Freq1': [ 0.16950579452515, 0.34307445232023, 0.69437201344385 ], 'sine2Fb2': 1.7574855685234, 'sine1Freq': [ 0.17889412045479, 0.2099814898439, 0.24647107442643, 0.28930164546447, 0.33957510942498 ], 'sine2FreqMod': [ 0.45058279037476, 2.1895914745331, 3.9286001586914, 5.6676088428497, 7.4066175270081, 9.1456262111664 ], 'roomLfoFreq': 0.61453648090363, 'revTime': 7.9368002533913, 'freqShift1': 231.57720909119, 'amp': 0.1, 'sine1FreqMod': [ 1.4643619775772, 4.6217786043882, 7.7791952311993, 10.93661185801, 14.094028484821 ], 'sine1Mul': 7.0451245903969, 'freqDiv': [ 2.5133474349976, 3.4889765779177, 4.4646057208379, 5.4402348637581, 6.4158640066783, 7.3914931495984, 8.3671222925186 ] );
)


(
~jggPreset = ( 'roomSize': 20.920423567295, 'sine1Div1': [ 11.09615945816, 11.698974514008, 12.301789569855, 12.904604625702, 13.507419681549, 14.110234737396 ], 'revTimeLfoFreq': 0.70299495458603, 'srcADiv': [ 2.9062769412994, 4.9734788924824, 8.5110582348385 ], 'freqShift2': [ 84.125792479515, 596.01548803368 ], 'sine2Freq2': 105.66026796579, 'sine1Div2': [ 6.1752312421799 ], 'freqShift2Mul': 0.28002824783325, 'sine2Mul': 680.77971769571, 'sine2Freq1': [ 0.088453085899353, 0.34094335240147, 1.3141697473282, 5.0654811499567, 19.524950511708, 75.259127652245 ], 'sine2Fb2': 0.49960436820984, 'sine1Freq': [ 0.22696331143379, 0.29432882381109, 0.38168925179472, 0.49497933314586, 0.64189530904916, 0.83241776007223 ], 'sine2FreqMod': [ 12.914543032646, 11.407228713036, 9.899914393425, 8.3926000738144, 6.8852857542038, 5.3779714345932 ], 'roomLfoFreq': 0.87445944309235, 'revTime': 7.0599042654037, 'freqShift1': 129.32789433002, 'amp': 0.1, 'sine1FreqMod': [ 5.6419432997704, 4.8957754055659, 4.1496075113614, 3.403439617157, 2.6572717229525, 1.9111038287481, 1.1649359345436 ], 'sine1Mul': 1.2922339677811, 'freqDiv': [ 1.562114238739, 2.5672311385473, 3.5723480383555, 4.5774649381638, 5.582581837972, 6.5876987377803, 7.5928156375885 ] );
)

(
~jggPreset = ( 'roomSize': 15.432903110981, 'sine1Div1': [ 9.9704992771149, 11.062086701393, 12.153674125671, 13.24526154995, 14.336848974228, 15.428436398506 ], 'revTimeLfoFreq': 0.38777681589127, 'srcADiv': [ 2.7151719093323, 3.7538221761375 ], 'freqShift2': [ 17.352496564388 ], 'sine2Freq2': 390.02767357349, 'sine1Div2': [ 7.8808024644852 ], 'freqShift2Mul': 0.43753352165222, 'sine2Mul': 732.93070226908, 'sine2Freq1': [ 0.61775263941288, 1.2167399575118, 2.3965193019861, 4.7202401214282, 9.2970946595236, 18.311773741288 ], 'sine2Fb2': 1.4612841725349, 'sine1Freq': [ 0.2438708126545, 0.65992805516629, 1.7858022173919 ], 'sine2FreqMod': [ 17.986158263683, 16.585504293442, 15.1848503232, 13.784196352959, 12.383542382717, 10.982888412476, 9.582234442234 ], 'roomLfoFreq': 0.35470155954361, 'revTime': 10.383343732357, 'freqShift1': 263.95649844408, 'amp': 0.1, 'sine1FreqMod': [ 2.5767723560333, 2.7640841841698, 2.9513960123062, 3.1387078404427, 3.3260196685791, 3.5133314967155, 3.700643324852 ], 'sine1Mul': 10.578674983978, 'freqDiv': [ 2.2357226371765, 3.1568940877914, 4.0780655384064, 4.9992369890213, 5.9204084396362, 6.8415798902512, 7.7627513408661 ] );
)

(
~jggPreset = ( 'roomSize': 1.931193351746, 'sine1Div1': [ 11.243766784668, 11.844276070595, 12.444785356522, 13.045294642448, 13.645803928375, 14.246313214302 ], 'revTimeLfoFreq': 0.1067066311836, 'srcADiv': [ 2.3475643634796, 2.506357206087 ], 'freqShift2': [ 27.951549434662, 210.87863875 ], 'sine2Freq2': 530.90909185767, 'sine1Div2': [ 7.0709416389465 ], 'freqShift2Mul': 0.17301092147827, 'sine2Mul': 505.99108134508, 'sine2Freq1': [ 0.53046342146397, 0.95039567526708, 1.7027600830112, 3.0507208479052, 5.4657715932505, 9.792655768586 ], 'sine2Fb2': 0.62918910980225, 'sine1Freq': [ 0.19678239822388, 0.47906198700618, 1.1662648156834, 2.8392434741092 ], 'sine2FreqMod': [ 8.0419110059738, 6.8097299486399, 5.5775488913059, 4.345367833972, 3.113186776638 ], 'roomLfoFreq': 0.191530318856239, 'revTime': 5.008795773983, 'freqShift1': 181.91454000473, 'amp': 0.1, 'sine1FreqMod': [ 7.3933463215828, 6.9292555660009, 6.4651648104191, 6.0010740548372, 5.5369832992554 ], 'sine1Mul': 5.9229959607124, 'freqDiv': [ 1.8788593769073, 2.8311202526093, 3.7833811283112, 4.7356420040131, 5.687902879715, 6.6401637554169, 7.5924246311188 ] );
)

(
~jggPreset = ( 'roomSize': 15.663612246513, 'sine1Div1': [ 11.021904468536, 12.051196551323, 13.080488634109, 14.109780716896, 15.139072799683, 16.168364882469 ], 'revTimeLfoFreq': 1.6621443271637, 'srcADiv': [ 3.1000294208527, 9.2891416983033 ], 'freqShift2': [ 67.211892831326, 1196.1244461949, 21286.615069384 ], 'sine2Freq2': 102.25989812255, 'sine1Div2': [ 6.6674477100372, 8.6676820230484 ], 'freqShift2Mul': 0.25390748977661, 'sine2Mul': 458.79680823088, 'sine2Freq1': [ 0.39846314287186, 0.79684929692007, 1.5935446310682 ], 'sine2Fb2': 1.9023437261581, 'sine1Freq': [ 0.1841375887394, 0.42661230743756, 0.98838081949021, 2.2898932527378 ], 'sine2FreqMod': [ 17.413986957073, 15.880323654413, 14.346660351753, 12.812997049093, 11.279333746433, 9.7456704437733, 8.2120071411133 ], 'roomLfoFreq': 0.86564662694931, 'revTime': 16.106231057644, 'freqShift1': 391.43260506392, 'amp': 0.1, 'sine1FreqMod': [ 6.8669802308083, 8.1952688598633, 9.5235574889183, 10.851846117973, 12.180134747028, 13.508423376083 ], 'sine1Mul': 7.8680473923683, 'freqDiv': [ 2.5132746219635, 3.4630087018013, 4.4127427816391, 5.3624768614769, 6.3122109413147, 7.2619450211525, 8.2116791009903 ] );
)

(
Post << ~jggPreset = (sine2Freq2: rrand(0.01, 750), sine2Freq1: Array.geom(rrand(3,6), rrand(0.001,1), rrand(1.3, 4)), sine2FreqMod: Array.interpolation(rrand(5,7), rrand(0.1, 20), rrand(0.1, 20)), sine2Mul: rrand(0.1, 825), sine2Fb2: rrand(0.1,2), sine1Div1: Array.interpolation(6, rrand(8.5,11.5), rrand(13.5,16.5)), sine1Div2: Array.geom(rrand(1,3), rrand(6.1,7.9), 1.3), sine1Mul: rrand(0.1, 17), sine1Freq: Array.geom(rrand(3,7), rrand(0.1, 0.25), rrand(1.1, 4)), sine1FreqMod: Array.interpolation(rrand(5,7), rrand(0.3,10), rrand(0.3,20)), srcADiv: Array.geom(rrand(1, 4), rrand(2, 3.2), rrand(1.01, 3)), freqShift1: rrand(0.1, 500), freqDiv: Array.interpolation(7, rrand(1.5,2.7), rrand(7.5,8.5)), freqShift2Mul: rrand(0.1, 0.5), freqShift2: Array.geom(rrand(1,4), rrand(0.1, 100), rrand(1.4,20)), roomLfoFreq: rrand(0.01, 1), roomSize: rrand(0.5, 25), revTimeLfoFreq: rrand(0.1, 2), revTime: rrand(1.1, 20),  amp: 0.1);
)


(
Ndef(\jgg, {

	var
	sig, srcA, srcB;


	srcA = Splay.ar(
		SinOscFB.ar(
			SinOscFB.ar(
				~jggPreset[\sine1Div1] , // (10..15),
				Phasor.kr(0.0, 10.0, 0.0, 8.0, 8.0) //LFPulse.kr(Ndef.kr(\jggMod1))   // 2
			) < ~jggPreset[\sine1Div2] /*1*/ * 450 + 90
			+ SinOsc.ar (
				freq: ~jggPreset[\sine1Freq] % ~jggPreset[\sine1FreqMod] , // 0.0173 + ~jggPreset[\sine1Freq],
				phase: 0.0,
				mul: ~jggPreset[\sine1Mul],
				add: 0.0
			)
		) / ~jggPreset[\sine1Div2] // 7
		+ SinOscFB.ar(
			SinOsc.ar(
				freq: ~jggPreset[\sine2Freq1] % ~jggPreset[\sine2FreqMod], // 0.0073,
				phase: 0.0,
				mul: ~jggPreset[\sine2Mul],
				add: 0.0
			)
			+ ~jggPreset[\sine2Freq2] + 600 ,
			SinOscFB.ar(
				SinOscFB.ar(1, 1) > ~jggPreset[\sine2Fb2] , // 0.1 + 1,
				abs(VarSaw.kr(~jggPreset[\sine2Fb2]))
			) /*% 1*/,
			SinOscFB.ar(
				(0.1 - 1) * Ndef.kr(\jggMod1, 1),
				LFPulse.kr(~jggPreset[\sine2Fb2])
			).min(~jggPreset[\sine2Fb2]) // (0.01)
		)
	) / ~jggPreset[\srcADiv]; // 2;

	srcB = FreqShift.ar(
		srcA,
		0.1 + ~jggPreset[\freqShift1]) / (~jggPreset[\freqDiv] +   SinOsc.ar(
		freq: 0.00025 + (~jggPreset[\freqShift2]),
		phase: 0.0,
		mul: ~jggPreset[\freqShift2Mul],
		add: ~jggPreset[\freqShift2Mul] / 2 // 0.0
	));

	sig = SelectX.ar(
		LFTri.kr(0.15).abs, // which // arg sur lfo freq?
		[srcA * 0.2, srcB]
	);

	sig = GVerb.ar(
		Mix.ar(sig * 0.5),
		roomsize: LFPulse.kr(
			~jggPreset[\roomLfoFreq],
			0.0,
			0.5,
			~jggPreset[\roomSize],
			~jggPreset[\roomSize] * 1.5
		), // 180,
		revtime: LFPulse.kr(
			~jggPreset[\revTimeLfoFreq],
			0.0,
			0.5,
			~jggPreset[\revTime],
			~jggPreset[\revTime] * 2
		), // 30,
		damping: 0.47,
		inputbw: 0.7,
		spread: 40,
		drylevel: 40,
		earlyreflevel: 0,
		taillevel: -11,
		mul: 0.3
	);

	sig = HPF.ar(sig, 200);

	sig = Splay.ar(sig, 1) * ~jggPreset[\amp] * 0.15;
	sig = Limiter.ar(sig, 0.5);
});

)

Ndef(\jgg).play(0);

Ndef(\jgg).clear(1);