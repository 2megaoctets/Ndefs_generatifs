Ndef(\dooModTest1).fadeTime_(3);

(
~dooModTest1Preset = (freqstart: , freqend: , freqslope: , modfreqstart: , modfreqend: , modfreqslope: , pmstart: , pmend: , pmslope: , modphasestart: , modphaseend: , modphaseslope: );
)

(
~dooModTest1Preset = (freqstart: 30.1, freqend: 128, freqslope: 3.2, modfreqstart: 20.3, modfreqend: 1, modfreqslope: 1, pmindexstart: 3, pmindexend: 0.1, pmindexslope: pi/10, modphasestart: 3, modphaseend: 2, modphaseslope: 0.25);
)

(
~dooModTest1Preset = (freqstart: rrand(120,4200), freqend: rrand(320,3000), freqslope: 10, modfreqstart: rrand(10,1000), modfreqend: rrand(30,1000), modfreqslope: 2.5, pmindexstart: rrand(10,300), pmindexend: rrand(80,2200), pmindexslope: 1, modphasestart: rrand(0,pi), modphaseend: rrand(0,pi), modphaseslope: pi/20);
)


(
Ndef(\dooModTest1, {
	PMOsc.kr(
		carfreq: Phasor.kr(0.0, ~dooModTest1Preset[\freqslope], ~dooModTest1Preset[\freqstart], ~dooModTest1Preset[\freqend]),
		modfreq: Phasor.kr(0.0, ~dooModTest1Preset[\modfreqslope], ~dooModTest1Preset[\modfreqstart], ~dooModTest1Preset[\modfreqend]),
		pmindex: Phasor.kr(0.0, ~dooModTest1Preset[\pmindexslope], ~dooModTest1Preset[\pmindexstart], ~dooModTest1Preset[\pmindexend]),
		modphase: Phasor.kr(0.0, ~dooModTest1Preset[\modphaseslope], ~dooModTest1Preset[\modphasestart], ~dooModTest1Preset[\modphaseend])
	).scope
});
)

Ndef(\dooModTest1).clear;


Ndef(\doo).fadeTime_(3);

(
~dooPreset = (dstut: 0.13, sawFreq: 0.145, sawFreq2: 0.2, sinFreq: 10.1, verbmix: 0.3, panmul: 0.25, panpos: 0.0625, amp: 0.25);
)

(
~dooPreset = ( 'dstut': 0.79137629508972, 'sawFreq2': 0.66750446557999, 'sawFreq': 0.20591886043549, 'hz': 87.448172228336,  'panmul': 0.76088961362839, 'verbmix': 0.54155253410339, 'amp': 0.25, 'sinFreq': 0.44790935516357, 'panpos': 0.95014333128929 )
)

(
~dooPreset = (dstut: rrand(0.01, 0.99), sawFreq: rrand(0.1, 0.95), sawFreq2: rrand(0.1, 1), sinFreq: rrand(0.1, 0.9), verbmix: rrand(0.1, 0.43), panmul: rrand(0.1, 0.925), panpos: rrand(0.1, 0.9625), hz: rrand(65.41, 300), amp: 0.25);
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
				rrand(3.0,5) + LFPulse.kr(SinOsc.kr((~dooPreset[\sawFreq2]) * rrand(50,150)))
				+ mod.value(rndWform.(), rrand(55, 75) + Ndef.kr(\dooModTest1, 1).sinh)
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
		lcm((0.25 + ~dooPreset[\verbmix] ), Ndef.kr(\dooModTest1, 1)),
		gcd(0.5, Ndef.kr(\dooModTest1, 1)),  // 0.3 // room
		0.5 // 1 // damp
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