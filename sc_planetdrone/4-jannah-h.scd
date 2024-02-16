// 1602 wip ajout d'un mod, refonte graphe
// 1002 refonte, pas ouf pour l'instant

Ndef(\jhMod1).fadeTime_(7);

(
~jhMod1Preset = (freqLfoSlope: rrand(10000, 441000), freqLfoStart: rrand(0.05,20), freqLfoEnd: rrand(0.5,20), freqLfoMul: rrand(2.0,33), iphaseLfoSlope: rrand(10000, 480000), iphaseLfoStart: rrand(0.0,2), iphaseLfoEnd: rrand(0.0,2), mulLfoFreq: rrand(1.0,20), mulLfoSlope: rrand(10000,4800000), mulLfoStart: rrand(1.0,2), mulLfoEnd: rrand(1.0,2));
)


(
Ndef(\jhMod1, {
	LeakDC.kr(
		LFCub.kr(
			Phasor.kr(0.0, ~jhMod1Preset[\freqLfoSlope], ~jhMod1Preset[\freqLfoStart], ~jhMod1Preset[\freqLfoEnd], ~jhMod1Preset[\freqLfoEnd]) , // freq
			Phasor.kr(0.0, ~jhMod1Preset[\iphaseLfoSlope], ~jhMod1Preset[\iphaseLfoStart], ~jhMod1Preset[\iphaseLfoEnd], ~jhMod1Preset[\iphaseLfoEnd]), // iphase
			LFPulse.kr(~jhMod1Preset[\mulLfoFreq], 0.0, 0.5, Phasor.kr(0.0, ~jhMod1Preset[\mulLfoSlope], ~jhMod1Preset[\mulLfoStart], ~jhMod1Preset[\mulLfoEnd], ~jhMod1Preset[\mulLfoEnd])), // mul
			Phasor.kr(0.0, ~jhMod1Preset[\mulLfoSlope], ~jhMod1Preset[\mulLfoStart], ~jhMod1Preset[\mulLfoEnd], ~jhMod1Preset[\mulLfoEnd] )// add
		)
	)
});
)


Ndef(\jh).fadeTime_(10);

(
~jhPreset = ( 'freq2_2': 248.1715965271, 'freqFactor1': 30.970663397312, 'freqFactor2': 43.801362544298, 'freq1_1': 245.29930114746, 'freq1_2': 310.42667961121, 'freq2_1': 160.68777751923, 'modFreq': 0.07014747440815, 'fbLfo1': 0.95554893016815, 'fbLfo2': 0.73493455648422, 'panLfo': 2.4287336349487, 'amp': 0.1, 'freqFactor1_1': 1.5 );
)

(
~jhPreset = (freq1_1: rrand(60.0, 260), freq1_2: rrand(51.0, 362), freq2_1: rrand(121.0, 242), freq2_2: rrand(160.0,320),  freqFactor1: rrand(0.03, 120), freqFactor1_1: rrand(1.1,2.5), freqFactor2: rrand(0.25, 80), freqAdd2_1: rrand(0.8,2.5), freqFactor2_1: rrand(0.9,2.5), modFreq: rrand(0.045, 0.09), fbLfo1: rrand(0.1,1), fbLfo1Slope: rrand(44100,96000000), fbLfo2: rrand(0.1,1), panLfo: rrand(0.1,2.5), amp: 0.1);
)

(
Ndef(\jh,{
	var sig1, sig2, sig;

	sig1 = SinOscFB.ar(
		[
			~jhPreset[\freq1_1]
			+
			(SinOsc.ar(
				~jhPreset[\modFreq],
				LFNoise1.kr(~jhPreset[\freqFactor1_1]).mod(2pi)
			)
				* (~jhPreset[\freqFactor1] * ~jhPreset[\freqFactor1_1] )
			) ,
			~jhPreset[\freq1_2]
			-
			(SinOsc.ar(
				~jhPreset[\modFreq],
				LFNoise0.kr(~jhPreset[\freqFactor1_1] ).mod(pi)
			)
				* (~jhPreset[\freqFactor1] * Ndef.kr(\jhMod1, 1))
			)
		], // freq
		LFNoise2.kr(
			Phasor.kr(0.0, ~jhPreset[\fbLfo1Slope], ~jhPreset[\fbLfo1], ~jhPreset[\fbLfo1] * 4, ~jhPreset[\fbLfo1] * 4 ),
			0.5,
			1
		).mod(2pi) //+ 1/2 // feedback
	);

	sig2 = SinOscFB.ar(
		[
			~jhPreset[\freq2_1]
			+
			(SinOsc.ar(
				~jhPreset[\modFreq] * ~jhPreset[\freqFactor2_1],
				LFNoise0.kr(~jhPreset[\freqFactor2_1])
			)
				* (~jhPreset[\freqFactor2] + ~jhPreset[\freqAdd2_1] )
			) ,
			~jhPreset[\freq2_2]
			-
			(SinOsc.ar(~jhPreset[\modFreq])
				* ~jhPreset[\freqFactor2]
			)
		], // freq
		LFNoise2.kr(
			~jhPreset[\fbLfo2],
			0.5, // ~jhPreset[\fbLfo2] * 2,
			1 // ~jhPreset[\fbLfo2] * 4
		).mod(4pi) // + 1/2 // feedback
	);

	sig = FreeVerb2.ar(
		* XFade2.ar(
			sig1,
			sig2,
			LFNoise2.kr(~jhPreset[\panLfo]) // pan
		)
	);

	// Ndef('jh'): wrapped channels from 2 to 1 channels
	sig= Splay.ar(sig, 1);
	// sig = Splay.ar(sig, 2, 1, 0.5);

	sig = sig * ~jhPreset[\amp] * 0.5;
});
)

Ndef(\jh).play(0);

Ndef(\jh).clear(2);