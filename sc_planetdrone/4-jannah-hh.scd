// 1002 encours

Ndef(\jhhMod1).fadeTime_(8);

(
~jhhMod1Preset = (freqLfoRate: rrand(0.05,11), freqLfoOffset: rrand(0.5, 210), fbLfoRate: rrand(0.05, 10), fbLfoIphaseRate: rrand(100, 44100), fbLfoIphaseStart: rrand(1,4), fbLfoIphaseEnd: rrand(1,4), fbLfoWidthRate: rrand(100, 44100), fbLfoWidthStart: rrand(0.25, 0.85), fbLfoWidthEnd: rrand(0.25, 0.85), fbMul: rrand(1.0, 14));
)

(Ndef(\jhhMod1, {
	SinOscFB.kr(
		LFNoise1.kr(~jhhMod1Preset[\freqLfoRate], ~jhhMod1Preset[\freqLfoOffset], ~jhhMod1Preset[\freqLfoOffset] / 2), // freq
		LFPulse.kr(
			~jhhMod1Preset[\fbLfoRate], // freq LFPulse
			Phasor.kr(0.0, ~jhhMod1Preset[\fbLfoIphaseRate], ~jhhMod1Preset[\fbLfoIphaseStart], ~jhhMod1Preset[\fbLfoIphaseEnd], ~jhhMod1Preset[\fbLfoIphaseEnd]), // iphase LFPulse
			Phasor.kr(0.0, ~jhhMod1Preset[\fbLfoWidthRate], ~jhhMod1Preset[\fbLfoWidthStart], ~jhhMod1Preset[\fbLfoWidthEnd], ~jhhMod1Preset[\fbLfoWidthEnd]), // width fb LFPulse
			~jhhMod1Preset[\fbMul], // mul fb LFPulse
			~jhhMod1Preset[\fbMul] / 2// add fb LFPulse
		).linlin(0, ~jhhMod1Preset[\fbMul], 0, 4pi) // , // feedback
		// , // mul
		// , // add
	) // SinOscFB
});
)


Ndef(\jhhMod2).fadeTime_(7);

(
~jhhMod2Preset = (freqLfoRate: rrand(0.05, 20), freqLfoMul: rrand(1.0,120), iphaseLfoRate: rrand(0.05, 20), iphaseLfoMul: rrand(1.0, 3), );
)

(
Ndef(\jhhMod2, {
	LeakDC.kr(
		LFPar.kr(
			LFClipNoise.kr(~jhhMod2Preset[\freqLfoRate], ~jhhMod2Preset[\freqLfoMul], ~jhhMod2Preset[\freqLfoMul] / 2), // freq
			LFNoise1.kr(~jhhMod2Preset[\iphaseLfoRate], ~jhhMod2Preset[\iphaseLfoMul] * pi, ~jhhMod2Preset[\iphaseLfoMul] * pi / 2).abs, // iphase
		)
	)
});
)

// Ndef(\jhhMod2).clear(1);

Ndef(\jhh).fadeTime_(7);


(
~jhhPreset =
)

(
~jhhPreset =
)

(
~jhhPreset =
)

(
~jhhPreset =
)

(
~jhhPreset =
)

(
~jhhPreset = ('m2Ratio': 3, 'selectLfoRate': 1178, 'freq2': 251.09943389893, 'freqShift1': 169.01000964642, 'nFreq': 40, 'pan': 0, 'f2Freq': 0.25777461528778, 'amp': 0.1, 'freqShiftLfo': 2.1079395294189, 'm3Ratio': 2, 'ampM': 0.79563381671906, 'freqDivArray': [ 5, 8, 7, 7, 9 ], 'freqShift2': 11.025327324867, 'selectLfoStart': 0.13085465431213,  'selectLfoEnd': 0.20152456760406, 'freq3': 0.64796483516693, 'f1Freq': 0.61785959601402, 'm1Ratio': 3, 'mulBase': 73.829217839241, 'f3Freq': 1.6352617740631, 'freq1': 205.58);
)

(
~jhhPreset = ( 'm2Ratio': 2, 'selectLfoRate': 8181, 'freq2': 87.476926827431, 'freqShift1': 245.78399467468, 'f2Freq': 1.1, 'nFreq': 40, 'pan': 0, 'amp': 0.1, 'freqShiftLfo': 1.0107231140137, 'm3Ratio': 3, 'ampM': 0.84, 'freqDivArray': [ 2, 3, 4, 5, 6, 7, 8 ], 'freqShift2': 0.25, 'selectLfoStart': 0.15202015042305, 'selectLfoEnd': 0.58074185848236, 'freq3': 239.26279662848, 'f1Freq': 0.1, 'm1Ratio': 1, 'mulBase': 43.466167938709, 'f3Freq': 2.2, 'freq1': 224.86058777571 );
)

(
~jhhPreset = ( 'm3Ratio': 3, 'm2Ratio': 2, 'ampM': 0.84, 'freqShift2': 0.25, 'f1Freq': 0.1, 'freqShiftLfo': 2.1681439399719, 'amp': 0.1, 'm1Ratio': 1, 'mulBase': 14.507520401478, 'freqShift1': 469.23752343655, 'f3Freq': 2.2, 'freq1': 138.74888308048, 'nFreq': 40, 'pan': 0, 'freq2': 189.9374063611, 'freq3': 105.71104279757, 'freqDivArray': [ 2, 3, 4, 5, 6, 7, 8 ], 'f2Freq': 1.1, selectLfoStart: rrand(0.05,2.5), selectLfoRate: rrand(100,44100), selectLfoEnd: rrand(0.05,2.65) );
)

(
~jhhPreset = ( 'm3Ratio': 4, 'm2Ratio': 1, 'ampM': 0.88682844638824, 'freqShift2': 3.5274397134781,'f1Freq': 0.45523629784584, 'freqShiftLfo': 1.3497036933899, 'amp': 0.1, 'm1Ratio': 3, 'mulBase': 33.554689979553,'freqShift1': 237.40975403786, 'f3Freq': 0.82163798809052, 'freq1': 45.778853833675, 'nFreq': 50, 'pan': 0,'freq2': 4.5695507526398, 'freq3': 112.29855012894, 'freqDivArray': [ 7, 7, 3, 6, 5, 5, 4, 6 ], 'f2Freq': 0.44539256095886, selectLfoStart: rrand(0.05,2.5), selectLfoRate: rrand(100,44100), selectLfoEnd: rrand(0.05,2.65) );
)

(
~jhhPreset = ( 'm3Ratio': 2, 'm2Ratio': 3, 'ampM': 0.66806688308716, 'freqShift2': 17.341608405113, 'f1Freq': 0.10953975200653, 'freqShiftLfo': 0.13606057167053, 'amp': 0.1, 'm1Ratio': 1, 'mulBase': 8.332985162735,'freqShift1': 153.46301519871, 'f3Freq': 0.7083624601364, 'freq1': 47.722559869289, 'nFreq': 48, 'pan': 0, 'freq2': 98.316177785397, 'freq3': 7.6408414244652, 'freqDivArray': [ 5, 4, 7, 9, 5, 4, 4 ], 'f2Freq': 0.17092581987381, selectLfoStart: rrand(0.05,2.5), selectLfoRate: rrand(100,44100), selectLfoEnd: rrand(0.05,2.65) );
)

(
~jhhPreset = ( 'm3Ratio': 1, 'm2Ratio': 4, 'ampM': 0.42721357345581, 'freqShift2': 8.0218099355698, 'f1Freq': 0.8168498301506, 'freqShiftLfo': 0.81952493190765, 'amp': 0.1, 'm1Ratio': 1, 'mulBase': 78.589802575111, 'freqShift1': 240.38337147236, 'f3Freq': 0.3849713802338, 'freq1': 27.55929005146, 'nFreq': 44, 'pan': 0, 'freq2': 8.4778874516487, 'freq3': 35.793907761574, 'freqDivArray': [ 4, 6, 4, 8, 7, 9 ], 'f2Freq': 0.90983035564423, selectLfoStart: rrand(0.05,2.5), selectLfoRate: rrand(100,44100), selectLfoEnd: rrand(0.05,2.65) )
)

(
~jhhPreset = ( 'm3Ratio': 1, 'm2Ratio': 2, 'ampM': 0.40484269857407, 'freqShift2': 3.3521645069122, 'f1Freq': 0.14236243605614, 'freqShiftLfo': 3.4245929956436, 'amp': 0.1, 'm1Ratio': 1, 'mulBase': 66.335150074959, 'freqShift1': 473.16766667366, 'f3Freq': 1.7057373523712, 'freq1': 74.937063753605, 'nFreq': 34, 'pan': 0, 'freq2': 59.230100035667, 'freq3': 160.9641174078, 'freqDivArray': [ 7, 4, 6, 6, 5, 7 ], 'f2Freq': 0.64836958646774, selectLfoStart: rrand(0.05,2.5), selectLfoRate: rrand(100,44100), selectLfoEnd: rrand(0.05,2.65) );
)

(
~jhhPreset = ( 'm3Ratio': 1, 'm2Ratio': 4, 'ampM': 0.68100442886353, 'freqShift2': 6.5549749135971, 'f1Freq': 0.11506874680519, 'freqShiftLfo': 2.8514682292938, 'amp': 0.1, 'm1Ratio': 1, 'mulBase': 24.241373550892, 'freqShift1': 479.60732197762, 'f3Freq': 0.77444005012512, 'freq1': 114.37980437279, 'nFreq': 44, 'pan': 0, 'freq2': 30.824445724487, 'freq3': 112.08994346857, 'freqDivArray': [ 6, 4, 4, 4, 4, 5, 4, 7 ], 'f2Freq': 0.9617817401886, selectLfoStart: rrand(0.05,2.5), selectLfoRate: rrand(100,44100), selectLfoEnd: rrand(0.05,2.65) )
)


(
~jhhPreset = ( 'm3Ratio': 3, 'm2Ratio': 2, 'ampM': 0.84, 'freqShift2': 0.25, 'f1Freq': 0.1, 'freqShiftLfo': 2.2963443756104, 'amp': 0.1, 'm1Ratio': 1, 'mulBase': 46.234755086899, 'freqShift1': 305.01697397232, 'f3Freq': 2.2, 'freq1': 85.209166777134, 'nFreq': 40, 'pan': 0, 'freq2': 223.59039322138, 'freq3': 107.77597073317, 'freqDivArray': [ 2, 3, 4, 5, 6, 7, 8 ], 'f2Freq': 1.1,  selectLfoStart: rrand(0.05,2.5), selectLfoRate: rrand(100,44100), selectLfoEnd: rrand(0.05,2.65))
)


(
~jhhPreset = (   freq1: rrand(0.1, 256), freq2: rrand(0.1, 256), freq3: rrand(0.1, 256), mulBase: rrand(0.1, 95), freqShift1: rrand(1.0, 500), freqShift2: 0.25, freqShiftLfo: rrand(0.1, 2.5), f1Freq: 0.1, f2Freq: 1.1, f3Freq: 2.2, nFreq: 40, m1Ratio: 1, m2Ratio: 2, m3Ratio: 3, amp: 0.1, ampM: 0.84 , pan: 0, freqDivArray: (2..8), selectLfoStart: rrand(0.05,2.5), selectLfoRate: rrand(100,44100), selectLfoEnd: rrand(0.05,2.65));
)

(
Post << ~jhhPreset = ( 'm3Ratio': rrand(1,4), 'm2Ratio': rrand(1,4), 'ampM': rrand(0.4,0.9), 'freqShift2': rrand(1.0,20), 'f1Freq': rrand(0.1,0.99), 'freqShiftLfo': rrand(0.1,3.5), 'amp': 0.1, 'm1Ratio': rrand(1,3), 'mulBase': rrand(0.1,95), 'freqShift1': rrand(1.0,500), 'f3Freq': rrand(0.5,3.5), 'freq1': rrand(0.5,256), 'nFreq': rrand(25,50), 'pan': 0, 'freq2': rrand(0.5,256), 'freq3': rrand(0.5,256), 'freqDivArray': Array.rand(rrand(5,8), rrand(2,4), rrand(5,9)), 'f2Freq': rrand(0.1,1), selectLfoStart: rrand(0.05,2.5), selectLfoRate: rrand(100,44100), selectLfoEnd: rrand(0.05,2.65) );
)

(
Ndef(\jhh, {
	var sig, sig2, car1, mod1, car2, mod2, car3, mod3, index;

	index = LFNoise1.kr(0.2).range(2, 12);
	mod1 = SinOsc.ar(
		[
			~jhhPreset[\nFreq] * ~jhhPreset[\m1Ratio],
			~jhhPreset[\freq1] + ~jhhPreset[\nFreq]+ 0.7 * ~jhhPreset[\m1Ratio]
		],
		mul: ~jhhPreset[\mulBase] + ~jhhPreset[\nFreq] * ~jhhPreset[\m1Ratio] * index) * ~jhhPreset[\ampM];

	car1 = SinOsc.ar(~jhhPreset[\f1Freq] + mod1);

	mod2 = SinOsc.ar(
		[
			~jhhPreset[\nFreq] * ~jhhPreset[\m2Ratio],
			~jhhPreset[\freq2] + ~jhhPreset[\nFreq] + 1.4 * ~jhhPreset[\m2Ratio]
		],
		Ndef.kr(\jhhMod1).abs, // ajout 1602
		mul: ~jhhPreset[\mulBase] + ~jhhPreset[\nFreq] * ~jhhPreset[\m2Ratio] * index) * ~jhhPreset[\ampM];

	car2 = SinOsc.ar(~jhhPreset[\f2Freq] + mod2);

	mod3 = SinOsc.ar(
		[
			~jhhPreset[\nFreq] * ~jhhPreset[\m3Ratio],
			~jhhPreset[\freq3] + ~jhhPreset[\nFreq] + 0.35 * ~jhhPreset[\m3Ratio]
		],
		Ndef.kr(\jhhMod2).abs, // ajout 1602
		mul: ~jhhPreset[\mulBase] + ~jhhPreset[\nFreq] * ~jhhPreset[\m3Ratio] * index) * ~jhhPreset[\ampM];

	car3 = SinOsc.ar(~jhhPreset[\f3Freq] + mod3) * 0.4;

	sig = car1 + car2 + car3;

	/*	sig2 = SmoothDecimator.ar(
	sig,
	44100  / LFPulse.kr(0.2, 0.0, 0.5, ~jhhPreset[\freqShift1], 0.01 + ~jhhPreset[\freqShift1] / 2), // rate
	0.5, // smoothing
	0.25 // mul
	);*/

	sig2 = LPF.ar(
		Mix.ar(sig), // in
		Limiter.ar(
			LFTri.ar(
				~jhhPreset[\selectLfoEnd] * 2,
				Ndef.kr(\jhhMod2).abs , // 0.0,
				~jhhPreset[\freqShift1] * 8,
				~jhhPreset[\freqShift1] * 4
			),
			0.5
		), // freq
		0.5 // mul
	);

	/*	sig = LinSelectX.ar(
	LFPulse.kr(~jhhPreset[\selectLfoStart]),
	[sig, sig2]
	).scope;*/

	sig2 = FreqShift.ar( // og
		Mix.ar(sig2) , // in
		~jhhPreset[\freqShift1] * 1.26,  // freq
		1 // LFPulse.kr(0.1)
	) / (
		~jhhPreset[\freqDivArray] + SinOsc.ar(
			freq: ~jhhPreset[\freqShiftLfo],
			phase: Ndef.kr(\jhhMod1).abs , // LFPulse.kr(0.25),
			mul: ~jhhPreset[\freqShift2],
			add: ~jhhPreset[\freqShift2] / 2
		)
	);

	sig2 = LPF.ar(
		Mix.ar(sig2), // in
		Limiter.ar(
			LFTri.ar(
				~jhhPreset[\selectLfoEnd] * 0.625,
				Ndef.kr(\jhhMod2).abs, // LFPulse.kr(0.25),
				~jhhPreset[\freqShift1],
				~jhhPreset[\freqShift1] / 2
			),
			0.5
		), // freq
		0.5 // mul
	);

	sig= LinSelectX.ar(
		LFTri.kr(
			Phasor.kr(0.0, ~jhhPreset[\selectLfoRate], ~jhhPreset[\selectLfoStart], ~jhhPreset[\selectLfoEnd], ~jhhPreset[\selectLfoEnd]), // 0.5,
			LFPulse.kr(Ndef.kr(\jhhMod1) + 1, 1), // 0.0,
			0.5,
			0.5
		),
		[sig, sig2]
	);

	sig = GVerb.ar(
		Mix.ar(sig) * 0.15,
		roomsize: 270,
		revtime: 3,
		damping: 0.87, // 0.47,
		inputbw: 0.7,
		spread: 15, // 40,
		drylevel: 30,
		earlyreflevel: -6,
		taillevel: 0.5, // -11,
		mul: 0.75
	);


	// sig = Mix.ar(sig);
	sig = HPF.ar(sig, 140);
	sig = sig * ~jhhPreset[\amp] * 0.1;
	sig = Limiter.ar(LeakDC.ar(sig), 0.5, 0.3); // .clip2(0.03);
});
)

Ndef(\jhh).play(0);

Ndef(\jhh).clear(1);