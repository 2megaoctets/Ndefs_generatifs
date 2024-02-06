// 0402 ON LE GARDE

// 0602 :  il semble que les modulateurs dans ce graphe soient SUPER BRUYANTS

// 0201: noms args, moins d'opérateurs, ajout freeverb
Ndef(\jzMod1).fadeTime_(10);

(
~jzMod1Preset = ();
)

(
~jzMod1Preset = ();
)

(
~jzMod1Preset = (freqSlope: 16.1, freqStart: 10.6719, freqEnd: 2.2253, iphaseSlope: 13.63, iphaseStart: 0.19, iphaseEnd: 0.549, widthSlope: 14.2 , widthStart: 0.25, widthEnd: 0.75, mulSlope: 16.34, mulStart: 1, mulEnd: 1, addSlope: 19.4, addStart: 0, addEnd: -0.1);
)
(
~jzMod1Preset = (freqSlope: rrand(10, 20.0), freqStart: rrand(0.02, 4.40), freqEnd: rrand(0.20, 4.40), iphaseSlope: rrand(10,30.0), iphaseStart: rrand(0.0,1), iphaseEnd: rrand(0.0,1), widthSlope: rrand(10.0,30), widthStart: rrand(0.25,0.85), widthEnd: rrand(0.25,0.85), mulSlope: rrand(10.0, 20), mulStart: rrand(0.75,1.5), mulEnd: rrand(0.75,1.6), addSlope: rrand(10.0, 20), addStart: rrand(-0.1,0.4), addEnd: rrand(-0.1,0.4));
)

(
Ndef(\jzMod1, {
	VarSaw.kr(
		Phasor.kr(0.0, ~jzMod1Preset[\freqSlope], ~jzMod1Preset[\freqStart], ~jzMod1Preset[\freqEnd], ~jzMod1Preset[\freqEnd]),
		Phasor.kr(0.0, ~jzMod1Preset[\iphaseSlope], ~jzMod1Preset[\iphaseStart], ~jzMod1Preset[\iphaseEnd], ~jzMod1Preset[\iphaseEnd]),
		Phasor.kr(0.0, ~jzMod1Preset[\widthSlope], ~jzMod1Preset[\widthStart], ~jzMod1Preset[\widthEnd], ~jzMod1Preset[\widthEnd]) // ,
		// Phasor.kr(0.0, ~jzMod1Preset[\mulSlope], ~jzMod1Preset[\mulStart], ~jzMod1Preset[\mulEnd], ~jzMod1Preset[\mulEnd]),
		// Phasor.kr(0.0, ~jzMod1Preset[\addSlope], ~jzMod1Preset[\addStart], ~jzMod1Preset[\addEnd], ~jzMod1Preset[\addEnd])
	)
}).scope;
)


Ndef(\jz).fadeTime_(7);

(
~jzPreset = (freq1: 6.5, freq2: 7.25, num: 1.2, delTime: 4.7,  fshiftFreq: 67.5, divFreqs: (2..8), fshiftGain: 0.7875, fshiftFreq2: 1.40625, amp: 0.1);
)

// ?? Server 'localhost' exited with exit code 0.
// server 'localhost' disconnected shared memory interface sur ce preset (à checker)
(
~jzPreset = ( 'freq1': 7.803, 'amp': 0.1, 'fshiftFreq': 133.881, divFreqs: Array.linrand(6,2.0,8.0),  'freq2': 27.59175, 'delTime': 15.72277365, 'num': 2.1022, 'fshiftGain': 0.68259253501892, 'fshiftFreq2': 2.173415 )
)

(
~jzPreset = ( 'freq2': 39.780776941776, 'fshiftGain': 0.72961859703064, 'amp': 0.1, 'fshiftFreq2': 1.7638877302408, 'delTime': 28.713978396654, 'fshiftFreq': 132.53770248592, 'num': 1.2154594016075, divFreqs: Array.interpolation(6, rrand(1.2,2.4), rrand(7.2,8.2)),  'freq1': 7.8461987376213 );
)

(
~jzPreset = ( 'delTime': 46.331986256838, 'num': 1.7952592420578, 'freq1': 0.51803302764893, 'fshiftFreq': 31.041433936357, 'fshiftGain': 0.64495027065277, 'fshiftFreq2': 2.248902118206, 'amp': 0.1, 'divFreqs': [ 1.0300903320312, 4.0789093371495, 16.151497459332, 63.956035453616, 253.25047917342, 1002.8108332025 ], 'freq2': 13.812552845478);
)

(
~jzPreset = (freq1: rrand(0.5,50), freq2: rrand(0.1,50), num: rrand(0.06,6), delTime: rrand(0.41,47),  fshiftFreq: rrand(0.225,225), fshiftGain: rrand(0.5,0.75), fshiftFreq2: rrand(0.225,2.25), divFreqs: Array.geom(6,rrand(0.8,1.2),rrand(1.1,4.4)) ,   amp: 0.1);
)

(
Ndef(\jz,{

	var sig, num;

	sig = Saw.ar([50 + ~jzPreset[\freq1], 50.1 + ~jzPreset[\freq2]]);
	8.do{
		|iter| num = 2 ** (8 - iter + ~jzPreset[\num]);
		sig = BRF.ar(
			AllpassN.ar(sig, 1, 0.1 / (12 - iter + ~jzPreset[\delTime]), 2),
			80 ** TRand.ar(0, 1, Impulse.ar(num/32, 1/2)).lag(1 / num) * 80, 2)
	};

	sig = GVerb.ar(
		sig,
		roomsize:  Phasor.kr(0.0, 2.5, 100.0, 30.0), // 400,
		revtime:  Phasor.kr(0.0, 25, 2.0, 4), // 4,
		damping: 0.765,
		inputbw: 0.62, // 0.46,
		spread: 16,
		drylevel: -3,
		earlyreflevel: -4.47,
		taillevel:  0.65,
		maxroomsize: 401
	);

	sig = FreqShift.ar(
		sig,
		0 + ~jzPreset[\fshiftFreq] ) / (~jzPreset[\divFreqs]
		+ SinOsc.ar(
			freq: 0.025 + ~jzPreset[\fshiftFreq2] ,
			phase: 0.0,  //  (abs(Ndef.kr(\jzMod1)) % 1).scope, // 0.0,
			mul: ~jzPreset[\fshiftGain]
		)
	);

	sig = FreeVerb.ar(
		sig,
		(Ndef.kr(\jzMod1).linlin(-1,1,0.3,0.65)), // Phasor.kr(0.0, 50, 0.5, 0.81), // mix
		LFPulse.kr(Phasor.kr(0.0,100,0.1,0.5), 0.0, 0.5, 0.35, 0.25), // room
		Phasor.kr(0.0,500,0.75,0.15) // damp
	);

	sig = HPF.ar(sig, 150);

	sig = Mix.ar(sig) * ~jzPreset[\amp] * 0.15;
	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\jz).play(0);

Ndef(\jz).clear(1);