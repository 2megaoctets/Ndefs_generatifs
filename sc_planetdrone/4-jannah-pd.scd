(
~jpdPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.051, hz: 65.41, amp: 0.5, amplag: 0.02, hzlag:0.02);
)

(
Ndef(\jpd, {


	var amp_,hz_,sig;

	amp_ = Lag.ar(K2A.ar(~jpdPreset[\amp]), ~jpdPreset[\amplag]);
	hz_ = Lag.ar(K2A.ar(~jpdPreset[\hz]), ~jpdPreset[\hzlag]);

	sig = VarSaw.ar(
			freq: hz_ * Array.fill(3, {arg freqI;
				2 ** freqI * LinLin.kr(SinOsc.kr(LFNoise0.kr(1)), -1 + abs(~jpdPreset[\planetDrone_1a] * 1.125), 1 - abs(~jpdPreset[\planetDrone_2a] * 1.75), 0.99+(~jpdPreset[\planetDrone_3a] * 0.0125) , 1.01 + (~jpdPreset[\planetDrone_4a] * 0.0125))
			}),
			mul: amp_ * Array.fill(3, {arg freqI; (1/2) ** freqI}),
		);
	sig = Mix.ar(sig);


	sig = Greyhole.ar(sig, delayTime:0.25 + abs(~jpdPreset[\planetDrone_effect_1]));

	sig = DFM1.ar(sig, 600 + (~jpdPreset[\planetDrone_effect_2] * 450), 0.1 + abs(~jpdPreset[\planetDrone_effect_3] * 0.5));


	//sig = ComplexRes.ar(sig, freq: 100.0, decay: 0.2);

	sig = HPF.ar(sig, 110);
	sig = Splay.ar(sig, 1) * ~jpdPreset[\amp] * 0.15;
	sig = Limiter.ar(sig, 0.35);

});
)


Ndef(\jpd).play(0);

Ndef(\jpd).clear(1);