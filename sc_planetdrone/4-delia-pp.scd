// validé, rajoute des mods
// 1002 graphe, args, range

Ndef(\dpp).fadeTime_(10);

( 'freqDivArray': [ 8.7825179637642, 5.6256910516348, 7.5006136901464, 7.5258217798461, 8.1533582531631 ], 'filterDiv': [ 8.693758641449, 6.9190159976883, 6.7898436465359 ], 'verbMix': 0.17910302877426, 'filterFreq1': 0.75773429870605,
  'freqArray': [ 6.0327419206458, 6.8320706833241, 7.1143039379899, 7.4010472108453, 5.7438517030996 ], 'amp': 0.25, 'freqShift1': 283, 'filterFreq3': 0.11974945187569, 'decayTime': 5.2199939489365,
  'verbRoom': 0.34900010824203, 'filterFreq2': 24.843945264816, 'freqShiftLfo': 0.055149202346802, 'freqShift2': 0.31861877441406 )

(
~dppPreset = ( 'freqDivArray': [ 4.4749206224682, 4.7794763345813, 6.1969742817072, 4.656883172788, 7.5378502406348, 3.7080457222534 ], 'filterDiv': [ 8.1898486895714 ], 'verbMix': 0.60674115419388, 'filterFreq1': 0.016161677837372, 'freqArray': [ 4.0608569537844, 6.6641133595435, 2.548936683098, 4.5630779756183 ], 'amp': 0.25, 'freqShift1': 263, 'filterFreq3': 1.7298840975761, 'decayTime': 3.7049140930176, 'verbRoom': 0.47707213163376, 'filterFreq2': 27.742013931274, 'freqShiftLfo': 2.3634232473373, 'freqShift2': 5.6978397369385 );
)

(
~dppPreset = ( 'freqDivArray': [ 5.9184138142506, 3.3936378068786, 3.3112209641515, 3.007798296852, 3.4065304806991, 3.8002960596875, 2.5910823476137, 4.2542476443493, 2.7745238918426 ], 'filterDiv': [ 6.7513216444908, 8.4517676911554 ], 'verbMix': 0.21527725458145, 'filterFreq1': 0.29263737797737, 'freqArray': [ 5.8233305095959, 5.0020883653019 ], 'amp': 0.25, 'freqShift1': 22, 'filterFreq3': 2.2581126081944, 'decayTime': 12.28006196022, 'verbRoom': 0.58604066371918, 'filterFreq2': 30.968594789505, 'freqShiftLfo': 0.90126663804054, 'freqShift2': 7.8353214263916 );
)

(
~dppPreset = ( 'freqDivArray': [ 5.159002615399, 4.9744054380461, 4.0869878241147, 4.7509872205191, 5.4752087445202, 5.9756690556798, 5.4241627370145 ], 'filterDiv': [ 8.140913733261, 10.123351384178 ], 'verbMix': 0.14972410202026, 'filterFreq1': 0.7850957596302, 'freqArray': [ 5.297789927541, 4.212414865972, 6.3336749253635 ], 'amp': 0.25, 'freqShift1': 31, 'filterFreq3': 0.24542597174644, 'decayTime': 7.2907735109329, 'verbRoom': 0.73424540758133, 'filterFreq2': 92.192507743835, 'freqShiftLfo': 0.95303933024406, 'freqShift2': 1.3186931610107 );
)

(
~dppPreset = ( 'freqDivArray': [ 3.6302051122754, 6.1470895027859, 6.3492406334529, 3.1593567512027, 3.0058722467307 ], 'filterDiv': [ 8.3826489753459, 8.8630836543838 ], 'verbMix': 0.60417634248734, 'filterFreq1': 0.40796319246292, 'freqArray': [ 4.7083842054425, 3.6294683655345, 6.2311351695123, 5.7085082038451 ], 'amp': 0.25, 'freqShift1': 107, 'filterFreq3': 2.346172015667, 'decayTime': 4.2137583494186, 'verbRoom': 0.1025664806366, 'filterFreq2': 1.9133269786835, 'freqShiftLfo': 0.20844437479973, 'freqShift2': 6.8919010162354 );
)

(
~dppPreset = ( 'freqDivArray': [ 5.0279458254154, 3.7630193568439, 4.7549211543042, 4.5524609575486, 4.0170930566865, 3.7708469283048, 4.5356620301704, 3.7012529933645 ], 'filterDiv': [ 9.4400297923485, 7.9771385378437, 8.1036934514408 ], 'verbMix': 0.29120572805405, 'filterFreq1': 0.41111413359642, 'freqArray': [ 8.590148537212, 8.0222728976182, 6.8247345071293, 5.9607654478754 ], 'amp': 0.25, 'freqShift1': 480, 'filterFreq3': 0.56741235375404, 'decayTime': 11.819364786148, 'verbRoom': 0.72569998502731, 'filterFreq2': 97.151791810989, 'freqShiftLfo': 1.5977966189384, 'freqShift2': 4.8496742248535 );
)

(
Post << ~dppPreset = (filterFreq1: rrand(0.01,1), filterFreq2: rrand(1.0,99), decayTime: rrand(3.0,14), freqShift2: rrand(0.0,8),  verbMix: rrand(0.1,0.8), verbRoom: rrand(0.1,0.8), freqShift1: rrand(0,500), freqArray: Array.rand(rrand(2,5),rrand(2.0,5),rrand(6.0,10)), freqDivArray: Array.rand(rrand(5,9), rrand(2.0,4), rrand(5.0,10)), freqShiftLfo: rrand(0.01,2.5), amp: 0.25, filterDiv: Array.rand(rrand(1,3), rrand(5.0,8), rrand(10.0,13)), filterFreq3: rrand(0.01,2.5));
)

(
Ndef(\dpp,{
	var sig ;
	sig = Formlet.ar(
		LFTri.ar(~dppPreset[\freqArray] * 99 + 99), // in
		(LFTri.ar(~dppPreset[\freqArray]
			+ SinOsc.ar(
				freq: ~dppPreset[\filterFreq3] ,
				phase: 0.0,
				mul: abs(~dppPreset[\freqShift2] * 4),
				add: 0.0)
		)
		+ (LFTri.ar(
			0.05 + ~dppPreset[\filterFreq1] ,
			0.0,
			9,
			20 ) // 175 )
		)
		+ (~dppPreset[\filterFreq2])
		).max(20).min(16000), // freq
		1 , // attacktime
		LFTri.ar(~dppPreset[\freqArray] / 6.011 + ~dppPreset[\decayTime] ) % 1 // decaytime
	) / ~dppPreset[\filterDiv];

	// sig = Mix.ar(sig);

/*	sig = FreqShift.ar(
		Splay.ar(sig, 1),
		~dppPreset[\freqShift1]  + SinOsc.ar(
			freq: ~dppPreset[\freqShiftLfo],
			phase: 0.0,
			mul: ~dppPreset[\freqShift2],
			add: ~dppPreset[\freqShift2] / 2 // 0.0
		) / ~dppPreset[\freqDivArray]
	); // freqshift*/

	sig =	FreeVerb.ar(
		Mix.ar(sig),
		0.1 + ~dppPreset[\verbMix],  // mix
		0.1 + ~dppPreset[\verbRoom] // room
	); // freeverb


	sig = Splay.ar(sig, 1);
	sig = sig * ~dppPreset[\amp] * 0.25;
});
)

Ndef(\dpp).play(0);

Ndef(\dpp).clear(1);