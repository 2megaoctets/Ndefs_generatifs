// 0201: noms args, moins d'opérateurs, ajout freeverb

// pour fabien

Ndef(\jz).fadeTime_(7);

(
~jzPreset = (freq1: 6.5, freq2: 7.25, num: 1.2, delTime: 4.7,  fshiftFreq: 67.5, fshiftGain: 0.7875, fshiftFreq2: 1.40625, amp: 0.1);
)

(
~jzPreset = ( 'freq1': 7.803, 'amp': 0.1, 'fshiftFreq': 133.881, 'freq2': 27.59175, 'delTime': 15.72277365, 'num': 2.1022, 'fshiftGain': 0.68259253501892, 'fshiftFreq2': 2.173415 )
)

(
~jzPreset = ( 'freq2': 39.780776941776, 'fshiftGain': 0.72961859703064, 'amp': 0.1, 'fshiftFreq2': 1.7638877302408, 'delTime': 28.713978396654, 'fshiftFreq': 132.53770248592, 'num': 1.2154594016075, 'freq1': 7.8461987376213 );
)

(
~jzPreset = (freq1: rrand(0.5,50), freq2: rrand(0.1,50), num: rrand(0.06,6), delTime: rrand(0.41,47),  fshiftFreq: rrand(0.225,225), fshiftGain: rrand(0.5,0.75), fshiftFreq2: rrand(0.225,2.25), amp: 0.1);
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
		roomsize: Phasor.kr(0.0, 2.5, 100.0, 30.0), // 400,
		revtime:  Phasor.kr(0.0, 25, 2.0, 4), // 4,
		damping: 0.765,
		inputbw: 0.62, // 0.46,
		spread: 16,
		drylevel: -3,
		earlyreflevel: -4.47,
		taillevel: 0.65,
		maxroomsize: 401);

	sig = FreqShift.ar(
		sig,
		0 + ~jzPreset[\fshiftFreq] ) / ((2..8) + SinOsc.ar(freq: 0.025 + ~jzPreset[\fshiftFreq2] , phase: 0.0, mul: ~jzPreset[\fshiftGain], add: 0.0) );

	sig = FreeVerb.ar(
		sig,
		Phasor.kr(0.0, 15, 0.5, 0.81),
		LFPulse.kr(Phasor.kr(0.0,100,0.1,0.5), 0.0, 0.5, 0.35, 0.25),
		Phasor.kr(0.0,500,0.85,0.15)
	);

	sig = Mix.ar(sig) * ~jzPreset[\amp] * 0.15;
	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\jz).play(0);

Ndef(\jz).clear(1);