// 0202: correc graphe

Ndef(\jpd2Mod).fadeTime_(5);

(
~jpd2ModPreset = (freqSlope: 0.5, freqStart: 32, freqEnd: 52, iphaseSlope: 0.01, iphaseStart: 0.0, iphaseEnd: 0.33);
)

(
~jpd2ModPreset = (freqSlope: , freqStart: , freqEnd: , iphaseSlope: , iphaseStart: , iphaseEnd: );
)

(
~jpd2ModPreset = (freqSlope: rrand(0.1, 0.4), freqStart: rrand(40.0, 440), freqEnd: rrand(10.0, 240), iphaseSlope: 0.01, iphaseStart: rrand(0.0, pi/2), iphaseEnd: rrand(0.0, pi/2));
)

(
Ndef(\jpd2Mod, {
	LFPar.kr(
		Phasor.kr(0.0, ~jpd2ModPreset[\freqSlope], ~jpd2ModPreset[\freqStart], ~jpd2ModPreset[\freqEnd]),
		Phasor.kr(0.0, ~jpd2ModPreset[\iphaseSlope], ~jpd2ModPreset[\iphaseStart], ~jpd2ModPreset[\iphaseEnd]),
		0.75
	)
});
)


(
~jpd2Mod2Preset = (syncFreqSlope: 1, syncFreqStart: 120, syncFreqEnd: 90, sawFreqSlope: 0.5, sawFreqStart: 440, sawFreqEnd: 500);
)

(
~jpd2Mod2Preset = (syncFreqSlope: 0.5, syncFreqStart: 50, syncFreqEnd: 120, sawFreqSlope: 0.75, sawFreqStart: 175, sawFreqEnd: 150);
)

(
~jpd2Mod2Preset = (syncFreqSlope: rrand(0.15,0.75), syncFreqStart: rrand(5.0,60), syncFreqEnd: rrand(5.0,60), sawFreqSlope: rrand(0.15,0.75), sawFreqStart: rrand(65.0,440), sawFreqEnd: rrand(65.0,440));
)

(
Ndef(\jpd2Mod2, {
	SyncSaw.kr(
		Phasor.kr(0.0, ~jpd2Mod2Preset[\syncFreqSlope], ~jpd2Mod2Preset[\syncFreqStart], ~jpd2Mod2Preset[\syncFreqEnd]),
		Phasor.kr(0.0, ~jpd2Mod2Preset[\sawFreqSlope], ~jpd2Mod2Preset[\sawFreqStart], ~jpd2Mod2Preset[\sawFreqEnd])
	)
});
)

Ndef(\jpd2).fadeTime_(7);

(
~jpd2Preset = (bohlen: [1, 27/25, 25/21, 9/7, 7/5, 75/49, 5/3, 9/5, 49/25, 15/7, 7/3, 63/25, 25/9, 3], noiseMul1: [ 30, 90, 38.571428571429, 54.0, 70.0, 83.333333333333 ] , noiseMul2: [ 270, 810, 2430 ] , noiseMul3: [ 360, 1080, 360 ] , serie1: 13, serie2: 145, serie3: 3000.2, serie4: 30,  verbmix: 0.3, panpos: 0.5, panmul: 0.625, amp: 0.5);
)


(
~jpd2Preset = (bohlen: Array.interpolation(rrand(10,15), rrand(0.99,1.01), rrand(2.99,3.01)), noiseMul1: Array.interpolation(rrand(4,7), 30.0, 83.333), noiseMul2: Array.interpolation(rrand(3, 5), 270, 2430), noiseMul3: Array.interpolation(rrand(3, 5), 360, 1080), serie1: rrand(0.1, 16.99), serie2: rrand(0.3, 280.95), serie3: rrand(1, 4500), serie4: rrand(1.0, 125), verbmix: rrand(0.1, 0.83), panmul: rrand(0.05, 1), panpos: rrand(0.1, 2.9625), amp: 0.5);
)



(
Ndef(\jpd2, {

	var sig, snd;
	sig = {{snd = LFTri.ar(~jpd2Preset[\bohlen].choose/3);
		4.do{
			snd = BAllPass.ar(snd, PinkNoise.kr(11, ~jpd2Preset[\noiseMul1].choose + (~jpd2Preset[\serie1] )), 0.01);
			snd =BAllPass.ar(snd, PinkNoise.kr(23, ~jpd2Preset[\noiseMul2].choose * ~jpd2Preset[\bohlen].choose) + (~jpd2Preset[\serie2]), 0.003);
			snd =BAllPass.ar(snd , PinkNoise.kr(30, ~jpd2Preset[\noiseMul3].choose * ~jpd2Preset[\bohlen].choose) + ~jpd2Preset[\serie4] , 0.073);
			// snd =((snd * LFNoise0.ar(~jpd2Preset[\bohlen].choose/7, 7, 3)) + WhiteNoise.ar(Lag.ar(Dust2.ar(LFNoise1.kr(1, 25, 3), 1, PinkNoise.kr(0.001)), 0.02), 0)).tanh;
			snd =(
				(snd * LFNoise0.ar(~jpd2Preset[\bohlen].choose/7, 7, 3))
				+
				WhiteNoise.ar(
					Lag.ar(
						Dust2.ar(
							LFNoise1.kr(1, 25, 3), //(Ndef.ar(\jpd2Mod2, 1) + LFNoise1.kr(1, 25, 3)),
							1,
							PinkNoise.kr(0.001)
						), // Dust
						0.02
					), // Lag
					0) // WhiteNoise
			).tanh;
			snd =LPF.ar(LeakDC.ar(snd, 0.996), 10000 + ~jpd2Preset[\serie3]   )
		}; // fin 4.do
		snd = (snd / 2)}!8};

	// sig = sig + (GlitchBRF.ar(sig, LFPulse.kr(Ndef.kr(\jpd2Mod), 0.0, 0.95, 0.25), ~jpd2Preset[\bohlen]) );
	/*sig = sig * 0.5; */
	// sig = Splay.ar(sig, 1);

	sig = FreeVerb.ar(
		sig,
		0.15 + LFPulse.kr(~jpd2Preset[\verbmix], 0.0, LFPulse.kr(0.35), 0.5, 0.0),
		0.5, // 1, // room
		0.65 // 1 // damp
	);
	sig = Mix.ar(sig);
	sig = Pan2.ar(
		sig,
		SinOsc.ar(
			freq: 0.005 + (SinOsc.kr(abs(~jpd2Preset[\panpos]), 0, 20 * Ndef.kr(\jpd2Mod, 1), 40.5)),
			phase: 0.125,
			mul: LFPulse.kr(~jpd2Preset[\panmul], 0.0, Phasor.kr(0.0, 0.05, 0.25, 0.85), 0.75, 0.25), // ~jpd2Preset[\panmul] * 0.75,
			add: 0.15)
	);
	sig = sig * ~jpd2Preset[\amp] * 0.55;
	sig = Limiter.ar(sig, 0.5);
	sig = HPF.ar(sig, LFPulse.kr(1, 0, 80, 80));

});
)

Ndef(\jpd2).play(0);

Ndef(\jpd2).clear(1);