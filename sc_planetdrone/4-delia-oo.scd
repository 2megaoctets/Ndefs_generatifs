Ndef(\dooModTest1).fadeTime_(3);

(
~dooModTest1Preset = (freqstart: , freqend: , freqslope: , modfreqstart: , modfreqend: , modfreqslope: , pmstart: , pmend: , pmslope: , modphasestart: , modphaseend: , modphaseslope: );
)

(
~dooModTest1Preset = (freqstart: 30.1, freqend: 128, freqslope: 3.2, modfreqstart: 20.3, modfreqend: 1, modfreqslope: 1, pmindexstart: 3, pmindexend: 0.1, pmindexslope: pi/10, modphasestart: 3, modphaseend: 2, modphaseslope: 0.25);
)

(
~dooModTest1Preset = (freqstart: rrand(120,4200), freqend: rrand(320,3000), freqslope: 10, modfreqstart: rrand(10,100), modfreqend: rrand(30,100), modfreqslope: 2.5, pmindexstart: rrand(10,100), pmindexend: rrand(8,20), pmindexslope: 1, modphasestart: pi, modphaseend: pi/10, modphaseslope: pi/20);
)


(
Ndef(\dooModTest1, {
	PMOsc.kr(
		carfreq: Phasor.kr(0.0, ~dooModTest1Preset[\freqslope], ~dooModTest1Preset[\freqstart], ~dooModTest1Preset[\freqend]),
		modfreq: Phasor.kr(0.0, ~dooModTest1Preset[\modfreqslope], ~dooModTest1Preset[\modfreqstart], ~dooModTest1Preset[\modfreqend]),
		pmindex: Phasor.kr(0.0, ~dooModTest1Preset[\pmindexslope], ~dooModTest1Preset[\pmindexstart], ~dooModTest1Preset[\pmindexend]),
		modphase: Phasor.kr(0.0, ~dooModTest1Preset[\modphaseslope], ~dooModTest1Preset[\modphasestart], ~dooModTest1Preset[\modphaseend])
	)
});
)

Ndef(\dooModTest1).clear;


Ndef(\doo).fadeTime_(3);

(
~dooPreset = (dstut: 0.13, sawFreq: 0.145, planetDrone_3a: 0.2, sinFreq: 10.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  verbmix: 0.3, panmul: 0.25, panpos: 0.0625, amp: 0.25);
)

(
~dooPreset = ( 'dstut': 0.79137629508972, 'planetDrone_3a': 0.66750446557999, 'sawFreq': 0.20591886043549, 'hz': 87.448172228336,  'panmul': 0.76088961362839, 'planetDrone_2b': 0.19206835031509, 'planetDrone_3b': 0.3755943608284, 'verbmix': 0.54155253410339, 'amp': 0.25, 'planetDrone_4b': 0.77396516799927, 'sinFreq': 0.44790935516357, 'planetDrone_1b': 0.50151456594467, 'panpos': 0.95014333128929 )
)

(
~dooPreset = (dstut: rrand(0.01, 0.99), sawFreq: rrand(0.1, 0.95), planetDrone_3a: rrand(0.1, 1), sinFreq: rrand(0.1, 0.9), planetDrone_1b: rrand(0.1, 1), planetDrone_2b: rrand(0.1, 0.95), planetDrone_3b: rrand(0.1, 0.92), planetDrone_4b: rrand(0.1, 0.9),  verbmix: rrand(0.1, 0.43), panmul: rrand(0.1, 0.925), panpos: rrand(0.1, 0.9625), hz: rrand(65.41, 300), amp: 0.25);
)



(
Ndef(\doo, {
	var sig, mod, rndWform;
	rndWform = {
		var waves;
		waves = [SinOsc, LFTri, LFCub, LFSaw];
		waves.wchoose([0.2, 0.3, 0.4, 0.1].normalizeSum);
	};
	mod = { arg wform, factor = 1;
		wform.ar(
			0.03 + Ndef.kr(\dooModTest1, 1),
			0.0,
			(~dooPreset[\sinFreq]) * factor /** Ndef.kr(\dooModTest1, 1).abs*/
		)
	};
	sig = SyncSaw.ar(
		(
			[ // syncFreq
				rrand(2.0, 4) + abs(~dooPreset[\sawFreq] * rrand(90, 195))
				+ mod.value(rndWform.(), 25),
				rrand(3.0,5) + abs(~dooPreset[\planetDrone_3a] * rrand(50,150))
				+ mod.value(rndWform.(), rrand(55, 75) % Ndef.kr(\dooModTest1, 1).cos)
			]
		).max(20).min(16000),
		Duty.ar( // sawFreq
			dur: 1 / Ddup(rrand(55, 80) , Dwhite(55,159)) * (10 * ~dooPreset[\dstut]) + Select.kr(
				Impulse.kr(mod.value(rndWform.())) > 0,
				[DC.kr(0), Ndef.kr(\dooModTest1, 1).abs]
			)
			reset: 0,
			level: Dseries(0, Ddup(rrand(20,50), Dwhite(-330, 9) / 300)) % 1
		).linexp(0, 1, 20, 3000)
	).trunc(0.25);
	sig = FreeVerb2.ar(
		sig[0],
		sig[1],
		0.25 + ~dooPreset[\verbmix] ,
		0.3, // room
		1 // damp
	);
	sig = Balance2.ar(
		sig[0],
		sig[1],
		pos: SinOsc.ar(
			freq: 0.0125 + abs(~dooPreset[\panpos] * 4),
			phase: 0.0,
			mul: (~dooPreset[\panmul] * 0.75),
			add: 0.0
		)
	);
	sig = sig * ~dooPreset[\amp] * 0.35;
	sig = Limiter.ar(sig);
	sig;
});
)


Ndef(\doo).play(0);

Ndef(\doo).clear(0);