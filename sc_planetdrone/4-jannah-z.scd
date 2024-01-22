// pour fabien

Ndef(\jz).fadeTime_(7);

(
~jzPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
~jzPreset = ( 'planetDrone_1a': 0.15607433319092, 'amp': 0.1, 'planetDrone_effect_1': 0.59502639770508, 'planetDrone_2a': 0.55183510780334, 'planetDrone_4a': 0.33452709913254, 'planetDrone_3a': 0.35036662578583, 'planetDrone_effect_2': 0.58259253501892, 'planetDrone_effect_3': 0.019659623503685 )
)

(
~jzPreset = (planetDrone_1a: rrand(0.1,0.7), planetDrone_2a: rrand(0.1,0.8), planetDrone_3a: rrand(0,0.82), planetDrone_4a: rrand(0.1,1),  planetDrone_effect_1: rrand(0,0.6), planetDrone_effect_2: rrand(0,0.6), planetDrone_effect_3: rrand(0,0.625), amp: 0.1);
)

(
s.options.numWireBufs = (8192*12000);
Ndef(\jz,{

	var sig;
	sig = FreqShift.ar(
		GVerb.ar(
			x=Saw.ar([50 + (~jzPreset[\planetDrone_1a] * 50), 50.1 + (~jzPreset[\planetDrone_2a] * 50)]);8.do{|i|f=2**(8 - i + (~jzPreset[\planetDrone_3a] * 6));x=BRF.ar(AllpassN.ar(x, 1, 0.1 / (12-i + abs(~jzPreset[\planetDrone_4a] * 47)),2), 80**TRand.ar(0,1,Impulse.ar(f/32,1/2)).lag(1/f)*80,2)};x,
       roomsize: 400, revtime: 4, damping: 0.65, inputbw: 0.46, spread: 16, drylevel: -3, earlyreflevel: -4.47, taillevel: 0.65, maxroomsize: 401, mul: 1.0, add: 0),
		0 + ~jzPreset[\planetDrone_effect_1] * 225) / ((2..8)+   SinOsc.ar(freq: 0.025+(~jzPreset[\planetDrone_effect_3] * 2.25), phase: 0.0, mul: ~jzPreset[\planetDrone_effect_2] * 0.75, add: 0.0) );
	sig = Mix.ar(sig) * ~jzPreset[\amp] * 0.2;
	sig = Limiter.ar(sig, 0.5);

   });
)


Ndef(\jz).play(0);

Ndef(\jz).clear(1);