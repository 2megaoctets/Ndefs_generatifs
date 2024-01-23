(
~jpd3Preset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, hz: 65.41, amp: 0.5, amplag: 0.02, hzlag: 0.02, amp: 0.35);
)

(
Ndef(\jpd3, {



	var amp_,hz_,sig;

	amp_ = Lag.ar(K2A.ar(~jpd3Preset[\amp]), ~jpd3Preset[\amplag]);
	hz_ = Lag.ar(K2A.ar(~jpd3Preset[\hz]),~jpd3Preset[\hzlag]);

	sig = VarSaw.ar(
		freq: hz_ * Array.fill(3, {arg i;
			2 ** i * LinLin.kr(SinOsc.kr(LFNoise0.kr(1)), -1 + abs(~jpd3Preset[\planetDrone_1a] * 1.125), 1 - abs(~jpd3Preset[\planetDrone_2a] * 1.75), 0.99 + (~jpd3Preset[\planetDrone_3a] * 0.0125) , 1.01 +(~jpd3Preset[\planetDrone_4a] * 0.0125))
		}),
		mul:amp_ * Array.fill(3, {arg i; (1/2) ** i}),
	);

	sig = Mix.ar(
		sig
	);

	sig = Greyhole.ar(sig, delayTime:0.25 + abs(~jpd3Preset[\planetDrone_effect_1]));

	sig = DFM1.ar(sig, 600 + (~jpd3Preset[\planetDrone_effect_2] * 450), 0.1 + abs(~jpd3Preset[\planetDrone_effect_3] * 0.5));


	sig = ComplexRes.ar(sig, freq: 100.0, decay: 0.2);


	sig = Splay.ar(sig) * ~jpd3Preset[\amp] ;
	// sig = Limiter.ar(sig, 0.5);

});

)

Ndef(\jpd3).play(0);

Ndef(\jpd3).clear(1);