// 1002 refonte, pas ouf

Ndef(\jh).fadeTime_(10);

(
~jhPreset = ( 'freq2_2': 248.1715965271, 'freqFactor1': 30.970663397312, 'freqFactor2': 43.801362544298, 'freq1_1': 245.29930114746, 'freq1_2': 310.42667961121, 'freq2_1': 160.68777751923, 'modFreq': 0.07014747440815, 'fbLfo1': 0.95554893016815, 'fbLfo2': 0.73493455648422, 'panLfo': 2.4287336349487, 'amp': 0.1 );
)

(
~jhPreset = (freq1_1: rrand(60.0, 260), freq1_2: rrand(51.0, 362), freq2_1: rrand(121.0, 242), freq2_2: rrand(160.0,320),  freqFactor1: rrand(0.03, 120), freqFactor2: rrand(0.25, 80), modFreq: rrand(0.045, 0.09), fbLfo1: rrand(0.1,1), fbLfo2: rrand(0.1,1), panLfo: rrand(0.1,2.5), amp: 0.1);
)

(
Ndef(\jh,{
	var sig1, sig2, sig;

	sig1 = SinOscFB.ar(
		[
			~jhPreset[\freq1_1]
			+
			(SinOsc.ar(~jhPreset[\modFreq] )
			* (~jhPreset[\freqFactor1] * 1.5)
			) ,
			~jhPreset[\freq1_2]
			-
			(SinOsc.ar(~jhPreset[\modFreq] )
			* (~jhPreset[\freqFactor1] + 1)
			)
		], // freq
		LFNoise2.kr(~jhPreset[\fbLfo1], 0.5, 0.5) //+ 1/2 // feedback
	);

	sig2 = SinOscFB.ar(
		[
			~jhPreset[\freq2_1]
			+
			(SinOsc.ar(~jhPreset[\modFreq])
			* (~jhPreset[\freqFactor2] + 1)
			) ,
			~jhPreset[\freq2_2]
			-
			(SinOsc.ar(~jhPreset[\modFreq])
			* ~jhPreset[\freqFactor2]
			)
		], // freq
		LFNoise2.kr(~jhPreset[\fbLfo2], 0.5, 0.5) // + 1/2 // feedback
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