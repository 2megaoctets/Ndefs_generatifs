(
~jhhPreset = (   planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, f1Freq: 0.1, f2Freq: 1.1, f3Freq: 2.2, nFreq: 40, m1Ratio: 1, m2Ratio: 2, m3Ratio: 3, amp: 0.1, ampM: 0.84 , pan: 0;)
)

(
Ndef(\jhh, {
	var pd_1a = ~jhhPreset[\planetDrone_1a]*256,
	pd_2a = ~jhhPreset[\planetDrone_2a]*256,
	pd_3a = ~jhhPreset[\planetDrone_3a]*256,
	pd_4a = ~jhhPreset[\planetDrone_4a]*95,
	sig, car1, mod1, car2, mod2, car3, mod3, index;

	index = LFNoise1.kr(0.2).range(2, 12);
	mod1 = SinOsc.ar([~jhhPreset[\nFreq] * ~jhhPreset[\m1Ratio], pd_1a + ~jhhPreset[\nFreq]+ 0.7 * ~jhhPreset[\m1Ratio]], mul:pd_4a + ~jhhPreset[\nFreq] * ~jhhPreset[\m1Ratio] * index) * ~jhhPreset[\ampM];
	car1 = SinOsc.ar(~jhhPreset[\f1Freq] + mod1);
	mod2 = SinOsc.ar([~jhhPreset[\nFreq] * ~jhhPreset[\m2Ratio], pd_2a + ~jhhPreset[\nFreq] + 1.4 * ~jhhPreset[\m2Ratio]], mul:pd_4a + ~jhhPreset[\nFreq] * ~jhhPreset[\m2Ratio] * index) * ~jhhPreset[\ampM];
	car2 = SinOsc.ar(~jhhPreset[\f2Freq] + mod2);
	mod3 = SinOsc.ar([~jhhPreset[\nFreq] * ~jhhPreset[\m3Ratio], pd_3a + ~jhhPreset[\nFreq] + 0.35 * ~jhhPreset[\m3Ratio]], mul:pd_4a + ~jhhPreset[\nFreq] * ~jhhPreset[\m3Ratio] * index) * ~jhhPreset[\ampM];
	car3 = SinOsc.ar(~jhhPreset[\f3Freq] + mod3) * 0.4;
	sig = car1 + car2 + car3;

	sig = GVerb.ar(sig * 0.045, roomsize: 270, revtime: 3, damping: 0.47, inputbw: 0.7, spread: 40, drylevel: 30, earlyreflevel: -6, taillevel: -11, mul: 0.75);

	sig = FreqShift.ar(
		sig * 0.75, // in
		~jhhPreset[\planetDrone_effect_1] * 500 // freq
	) / (
		(2..8) + SinOsc.ar(
			freq: 0.00125 + (~jhhPreset[\planetDrone_effect_3]),
			phase: 0.25,
			mul: ~jhhPreset[\planetDrone_effect_2] * 0.35,
			add: 0.0
		)
	);
	sig = Mix.ar(sig);
	sig = sig * ~jhhPreset[\amp] * 0.0751;
	sig = Limiter.ar(LeakDC.ar(sig), 0.25, 0.3).clip2(0.03);
});
)

Ndef(\jhh).play(0);

Ndef(\jhh).clear(1);