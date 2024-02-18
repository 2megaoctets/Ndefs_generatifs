// 0202 correc niveaux
// edit du graphe, ajout mod

Ndef(\skkMod).fadeTime_(7);

(
~skkModPreset = (carfreqSlope: 20.1, carfreqStart: 1, carfreqEnd: 3, modfreqSlope: 30.2, modfreqStart: 4, modfreqEnd: 1, pmindexSlope: 10.5, pmindexStart: 20, pmindexEnd: 40, modphaseSlope: 20.1, modphaseStart: 0.0, modphaseEnd: 1);
)

(
~skkModPreset = (carfreqSlope: rrand(0.051, 10.1), carfreqStart: rrand(0.1,2), carfreqEnd: rrand(0.1,2), modfreqSlope: rrand(0.05,10.2), modfreqStart: rrand(0.2,30), modfreqEnd: rrand(0.4,50), pmindexSlope: 1, pmindexStart: rrand(1,127), pmindexEnd: rrand(1,127), modphaseSlope: 10.1, modphaseStart: rrand(0.0,1), modphaseEnd: rrand(0.0,1));
)


(
Ndef(\skkMod, {
	PMOsc.kr(
		Phasor.kr(0.0, ~skkModPreset[\carfreqSlope], ~skkModPreset[\carfreqStart], ~skkModPreset[\carfreqEnd]),
		Phasor.kr(0.0, ~skkModPreset[\modfreqSlope], ~skkModPreset[\modfreqStart], ~skkModPreset[\modfreqEnd]),
		Phasor.kr(0.0, ~skkModPreset[\pmindexSlope], ~skkModPreset[\pmindexStart], ~skkModPreset[\pmindexEnd]),
		Phasor.kr(0.0, ~skkModPreset[\modphaseSlope], ~skkModPreset[\modphaseStart], ~skkModPreset[\modphaseEnd])
	)
});
)

Ndef(\skk).fadeTime_(7);

(
~skkPreset = ( 'earlyRef': 0.78317119777203, 'hz': 225.03538643003, 'revTime': 0.91426666378975, 'amp': 0.051,  'randSeed': 4506856, 'impulseFreq2': 0.55979113578796, 'impulseFreq4': 0.46136404275894, 'dryLev': 0.7639681905508, 'impulseFreq1': 0.59683083772659, 'impulseFreq3': 0.44538822174072 );
)

(
~skkPreset = (impulseFreq1: 0.13, impulseFreq2: 0.145, impulseFreq4: 0.2, impulseFreq3: 0.1,  revTime: 0.3, dryLev: 0.25, earlyRef: 0.0625, amp: 0.051);
)

(
~skkPreset = ('impulseFreq2': 0.24010162353516, 'impulseFreq3': 0.59688158035278, 'hz': 207.11387521863, 'impulseFreq1': 0.90060613155365, 'impulseFreq4': 0.46581425666809, 'dryLev': 0.75231163203716, 'earlyRef': 0.6411688297987, 'amp': 0.051, 'revTime': 0.34243049383163 );
)

(
~skkPreset = (impulseFreq1: rrand(0.01, 0.99), impulseFreq2: rrand(0.1, 0.95), impulseFreq4: rrand(0.1, 1), impulseFreq3: rrand(0.1, 0.9), revTime: rrand(0.1, 0.93), dryLev: rrand(0.1, 0.925), earlyRef: rrand(0.1, 0.9625), hz: rrand(45.41, 800), amp: 0.051, randSeed: 10000000.rand);
)

(
Ndef(\skk, {
	var sig;
	thisThread.randSeed = ~skkPreset[\randSeed] ?? ({  10000000.rand.debug("randSeed") });

	sig = tanh(Impulse.kr(rrand(6.0,12) + (~skkPreset[\impulseFreq1] * rrand(6.0,12))).lag * Crackle.ar(LFSaw.kr(rrand(3.0, 7) + (~skkPreset[\impulseFreq2] * rrand(10.0, 20))).abs.lag * 1.8)
		+
		GVerb.ar([
			Impulse.kr(rrand(0.5,3) + (~skkPreset[\impulseFreq3] * rrand(60,90))) + Impulse.kr(rrand(1.0,6) + ~skkPreset[\impulseFreq4] * (~skkPreset[\impulseFreq3] * rrand(1.0,10)), 0.5)
	].lag * Blip.ar(5.9 + (~skkPreset[\impulseFreq4] * rrand(30.0, 50)), 7, 0.4)!2, 1, 1) * 5);

	sig = GVerb.ar(
		Mix.ar(sig),
		roomsize: 2, // 26, foutre un dseq dessus
		revtime: SinOsc.kr(LFPulse.kr(~skkPreset[\revTime]), 0.0, 0.5, 0.65),
		damping: 0.165,
		inputbw: 0.46,
		spread:  17, // 25,
		drylevel:  Ndef.kr([\skkMod]).cos +  SinOsc.kr(~skkPreset[\dryLev]) , // -6 + (~skkPreset[\dryLev] * rrand(30, 70)).debug("drylevel"),
		earlyreflevel: LFPulse.kr(~skkPreset[\earlyRef], 0.0, Phasor.kr(0.0, 10.05, 0.25, 0.75)), // -10.47 + (~skkPreset[\planetDrone_effect_3] * rrand(50,80)),
		taillevel: -10.15, // + LFPulse.kr(Ndef.kr(\skkMod, 1), 0, 0.5, 5, 0), // -10.076,
		maxroomsize: 3, // 100,
		mul: 0.25, // .0,
		add: 0
	);
	sig = HPF.ar(sig, 300);
	sig = Mix.ar(Mix.ar(sig)) * ~skkPreset[\amp] * 0.25;
	sig = Limiter.ar(sig, 0.25);

});
)

Ndef(\skk).play(0);

Ndef(\skk).clear(1);