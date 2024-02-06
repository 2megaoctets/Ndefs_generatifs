// 0602 changé le graphe, wip rajouter des modulateurs

Ndef(\dooMod1).fadeTime_(7);

(
~dooMod1Preset = ( 'modfreqslope': 52.5, 'pmindexslope': 19, 'modphasestart': 2.0783035340729, 'freqend': 1329, 'freqstart': 3578, 'modfreqstart': 239, 'modphaseend': 0.88910065755973, 'freqslope': 10, 'modphaseslope': 0.15707963267949, 'modfreqend': 804, 'pmindexend': 1046, 'pmindexstart': 147 );
)

(
~dooMod1Preset = (freqstart: 30.1, freqend: 128, freqslope: 43.2, modfreqstart: 20.3, modfreqend: 1, modfreqslope: 100, pmindexstart: 3, pmindexend: 0.1, pmindexslope: 10, modphasestart: 3, modphaseend: 2, modphaseslope: 50.25);
)

(
~dooMod1Preset = (freqstart: rrand(120,4200), freqend: rrand(320,3000), freqslope: 10, modfreqstart: rrand(10,1000), modfreqend: rrand(30,1000), modfreqslope: 52.5, pmindexstart: rrand(10,300), pmindexend: rrand(80,2200), pmindexslope: 19, modphasestart: rrand(0,2pi), modphaseend: rrand(0,3pi), modphaseslope: pi/20);
)


(
Ndef(\dooMod1, {
	PMOsc.kr(
		carfreq: Phasor.kr(0.0, ~dooMod1Preset[\freqslope], ~dooMod1Preset[\freqstart], ~dooMod1Preset[\freqend]),
		modfreq: Phasor.kr(0.0, ~dooMod1Preset[\modfreqslope], ~dooMod1Preset[\modfreqstart], ~dooMod1Preset[\modfreqend]),
		pmindex: Phasor.kr(0.0, ~dooMod1Preset[\pmindexslope], ~dooMod1Preset[\pmindexstart], ~dooMod1Preset[\pmindexend]),
		modphase: Phasor.kr(0.0, ~dooMod1Preset[\modphaseslope], ~dooMod1Preset[\modphasestart], ~dooMod1Preset[\modphaseend]),
	)
});
)

Ndef(\dooModTest1).clear;


Ndef(\doo).fadeTime_(7);

(
~dooPreset = (dstut: 1.3, sawFreq: 0.145, sawFreq2: 0.2, sinFreq: 10.1, verbmix: 0.3, panmul: 0.25, panpos: 0.0625, amp: 0.25);
)

(
~dooPreset = ( 'dstut': 7.9137629508972, 'sawFreq2': 0.66750446557999, 'sawFreq': 0.20591886043549, 'hz': 87.448172228336,  'panmul': 0.76088961362839, 'verbmix': 0.54155253410339, 'amp': 0.25, 'sinFreq': 0.44790935516357, 'panpos': 3.8 )
)

(
~dooPreset  = ( 'sawFreq': 0.48381963372231, 'hz': 66.297395129204, 'dstut': 6.9699527978897, 'panpos': 2.69376096278429,  'sinFreq': 0.28643102645874, 'sawFreq2': 0.2513769030571, 'verbmix': 0.14228870868683, 'amp': 0.25, 'panmul': 0.23834015130997 );
)

(
~dooPreset = ( 'sawFreq': 0.39830577969551, 'hz': 138.37979227424, 'dstut': 0.13672169923782, 'panpos': 1.300308406353, 'sinFreq': 0.28030223846436, 'sawFreq2': 0.74242349863052, 'verbmix': 0.36060573101044, 'amp': 0.25, 'panmul': 0.1138528585434 );
)

(
~dooPreset = ( 'sawFreq': 0.17719300985336, 'hz': 119.85336350203, 'dstut': 1.1979603612423, 'panpos': 3.1178485006094, 'sinFreq': 0.88957204818726, 'sawFreq2': 0.22812333106995, 'verbmix': 0.10372741580009, 'amp': 0.25, 'panmul': 0.84682688415051 );
)

(
~dooPreset = (dstut: rrand(0.1, 10.99), sawFreq: rrand(0.1, 0.95), sawFreq2: rrand(0.1, 1), sinFreq: rrand(0.1, 0.9), verbmix: rrand(0.1, 0.43), panmul: rrand(0.1, 0.925), panpos: rrand(0.1, 4), hz: rrand(65.41, 300), amp: 0.25);
)



(
Ndef(\doo, {
	var sig, mod, rndWform;
	rndWform = {
		var waves;
		waves = [SinOsc, LFTri, LFCub, LFSaw];
		waves.wchoose([0.6, 0.5, 0.4, 0.15].normalizeSum);
	};
	mod = { arg wform, factor = 1;
		wform.ar(
			0.03 + Ndef.kr(\dooMod1, 1),
			0.0,
			(~dooPreset[\sinFreq]) * factor // * Ndef.kr(\dooModTest1, 1).abs
		)
	};
	sig = SyncSaw.ar(
		(
			[ // syncFreq
				rrand(2.0, 4) + abs(~dooPreset[\sawFreq] * rrand(90, 195))
				+ mod.value(rndWform.(), 25),
				rrand(3.0,5) + LFPulse.kr(SinOsc.kr((~dooPreset[\sawFreq2]) * rrand(50,150)))
				+ mod.value(rndWform.(), rrand(55, 75) + Ndef.kr(\dooMod1, 1).tanh)
			]
		).max(20).min(16000),
		Duty.ar( // sawFreq
			dur: 1 / Ddup(rrand(55, 80) , Dwhite(55,159)) * ~dooPreset[\dstut] + Select.kr(
				Impulse.kr(mod.value(rndWform.())) > 0,
				[DC.kr(0), Ndef.kr(\dooMod1, 1).abs]
			)
			reset: 0,
			level: Dseries(0, Ddup(rrand(20,50), Dwhite(-330, 9) / 300)) % 1
		).linexp(0, 1, 20, 3000)
	).trunc(0.25);

	sig = FreeVerb2.ar(
		sig[0],
		sig[1],
		LFPulse.kr(~dooPreset[\verbmix]), // * Ndef.kr(\dooModTest1, 1).linlin(-1,1,0.25,0.95),
		LFPulse.kr(0.3, 0.0, 0.5, 0.75, 0.25), // 0.3 // room
		LFPulse.kr(0.15, 0.0, 0.5, 0.3, 0.15) // 1 // damp
	);
	sig = Balance2.ar(
		sig[0],
		sig[1],
		pos: SinOsc.ar(
			freq: LFPulse.kr(0.0125 + ~dooPreset[\panpos]),
			phase: 0.0,
			mul: 0.5 + LFPulse.kr(~dooPreset[\panmul]) ,
			add: 0.0
		)
	);
	sig= HPF.ar(sig, 120);
	sig = sig * ~dooPreset[\amp] * 0.35;
	sig = Limiter.ar(sig);
	sig;
});
)


Ndef(\doo).play(0);

Ndef(\doo).clear(10);