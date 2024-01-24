// pour fabien

Ndef(\jz).fadeTime_(7);

(
~jzPreset = (freq1: 0.13, freq2: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  fshiftFreq: 0.3, fshiftGain: 0.25, fshiftFreq2: 0.625, amp: 0.1);
)

(
~jzPreset = ( 'freq1': 0.15607433319092, 'amp': 0.1, 'fshiftFreq': 0.59502639770508, 'freq2': 0.55183510780334, 'planetDrone_4a': 0.33452709913254, 'planetDrone_3a': 0.35036662578583, 'fshiftGain': 0.58259253501892, 'fshiftFreq2': 0.9659623503685 )
)

(
~jzPreset = (freq1: rrand(0.1,0.7), freq2: rrand(0.1,0.8), planetDrone_3a: rrand(0,0.82), planetDrone_4a: rrand(0.1,1),  fshiftFreq: rrand(0,0.6), fshiftGain: rrand(0.15,1), fshiftFreq2: rrand(0,0.625), amp: 0.1);
)

// se débarrasser de i et f

(
s.options.numWireBufs = (8192*12000);
Ndef(\jz,{

	var sig;

	sig = Saw.ar([50 + (~jzPreset[\freq1] * 50), 50.1 + (~jzPreset[\freq2] * 50)]);
	8.do{
		|i| f = 2 ** (8 - i + (~jzPreset[\planetDrone_3a] * 6));
		sig = BRF.ar(
			AllpassN.ar(sig, 1, 0.1 / (12 - i + abs(~jzPreset[\planetDrone_4a] * 47)), 2),
			80 ** TRand.ar(0, 1, Impulse.ar(f/32, 1/2)).lag(1 / f) * 80, 2)
	};

	sig = GVerb.ar(
		sig,
		roomsize: Phasor.kr(1.0, 1.0, 400.0, 40.0, 40.0), // 400,
		revtime:  Phasor.kr(1.0, 0.25, 2.0, 4, 4), // 4,
		damping: 0.165,
		inputbw: 0.46,
		spread: 16,
		drylevel: -3,
		earlyreflevel: -4.47,
		taillevel: 0.65,
		maxroomsize: 401);

	sig = FreqShift.ar(
		sig,
		0 + ~jzPreset[\fshiftFreq] * 225) / ((2..8) + SinOsc.ar(freq: 0.025+(~jzPreset[\fshiftFreq2] * 2.25), phase: 0.0, mul: ~jzPreset[\fshiftGain] * 0.75, add: 0.0) );

	sig = Mix.ar(sig) * ~jzPreset[\amp] * 0.2;
	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\jz).play(0);

Ndef(\jz).clear(1);