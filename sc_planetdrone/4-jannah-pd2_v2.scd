// 0202: correc graphe

Ndef(\jpd2Mod).fadeTime_(5);

(
~jpd2ModPreset = (freqSlope: 0.5, freqStart: 32, freqEnd: 52, iphaseSlope: 0.01, iphaseStart: 0.0, iphaseEnd: 0.33);
)

(
~jpd2ModPreset = (freqSlope: , freqStart: , freqEnd: , iphaseSlope: , iphaseStart: , iphaseEnd: );
)

(
~jpd2ModPreset = (freqSlope: rrand(0.1, 10.4), freqStart: rrand(40.0, 440), freqEnd: rrand(10.0, 240), iphaseSlope: 10.01, iphaseStart: rrand(0.0, pi/2), iphaseEnd: rrand(0.0, pi/2));
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


Ndef(\jpd2Mod2).fadeTime_(7);

(
~jpd2Mod2Preset = (syncFreqSlope: 1, syncFreqStart: 120, syncFreqEnd: 90, sawFreqSlope: 0.5, sawFreqStart: 440, sawFreqEnd: 500);
)

(
~jpd2Mod2Preset = (syncFreqSlope: 0.5, syncFreqStart: 50, syncFreqEnd: 120, sawFreqSlope: 0.75, sawFreqStart: 175, sawFreqEnd: 150);
)

(
~jpd2Mod2Preset = (syncFreqSlope: rrand(0.15,20.75), syncFreqStart: rrand(5.0,60), syncFreqEnd: rrand(5.0,60), sawFreqSlope: rrand(0.15,20.75), sawFreqStart: rrand(65.0,440), sawFreqEnd: rrand(65.0,440));
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
~jpd2Preset = (bohlen: [1, 27/25, 25/21, 9/7, 7/5, 75/49, 5/3, 9/5, 49/25, 15/7, 7/3, 63/25, 25/9, 3], noiseMul1: [ 30, 90, 38.571428571429, 54.0, 70.0, 83.333333333333 ] , noiseMul2: [ 270, 810, 2430 ] , noiseMul3: [ 360, 1080, 360 ] , serie1: 13, serie2: 145, serie3: 3000.2, serie4: 30,  verbmix: 0.3, panpos: 0.5, panmul: 0.625, randSeed: 123456789, amp: 0.5);
)


(
~jpd2Preset = ( 'panmul': 0.15021105408669, 'verbmix': 0.6359036052227, 'serie3': 2825, 'noiseMul1': [ 30.0, 47.777666666667, 65.555333333333, 83.333 ],  'bohlen': [ 1.0080707716942, 1.1747459493081, 1.341421126922, 1.5080963045359, 1.6747714821498, 1.8414466597637, 2.0081218373775, 2.1747970149914, 2.3414721926053, 2.5081473702192, 2.6748225478331, 2.841497725447, 3.0081729030609 ], 'serie1': 12.596355170012, 'amp': 0.5, 'serie2': 184.88164880276, 'randSeed': 4105346, 'noiseMul2': [ 270.0, 810.0, 1350.0, 1890.0, 2430.0 ], 'noiseMul3': [ 360.0, 720.0, 1080.0 ], 'serie4': 37.304858207703, 'panpos': 2.4453327417374 );
)

(
~jpd2Preset = ( 'panmul': 0.11084915995598, 'verbmix': 0.68069431781769, 'serie3': 288, 'noiseMul1': [ 30.0, 40.6666, 51.3332, 61.9998, 72.6664, 83.333 ], 'bohlen': [ 1.0035975384712, 1.1465997188432, 1.2896018992152, 1.4326040795871, 1.5756062599591, 1.7186084403311, 1.861610620703, 2.004612801075, 2.1476149814469, 2.2906171618189, 2.4336193421909, 2.5766215225628, 2.7196237029348, 2.8626258833068, 3.0056280636787 ], 'serie1': 11.44887681365, 'amp': 0.5, 'serie2': 129.52460485697, 'randSeed': 2281694, 'noiseMul2': [ 270.0, 1350.0, 2430.0 ], 'noiseMul3': [ 360.0, 600.0, 840.0, 1080.0 ], 'serie4': 27.542945861816, 'panpos': 0.36219834834337 );
)

(
~jpd2Preset = ( 'panmul': 0.73134490847588, 'verbmix': 0.87171522021294, 'serie3': 3455, 'noiseMul1': [ 30.0, 43.33325, 56.6665, 69.99975, 83.333 ],  'bohlen': [ 1.005417175293, 1.1716482601563, 1.3378793450197, 1.504110429883, 1.6703415147463, 1.8365725996097, 2.002803684473, 2.1690347693364, 2.3352658541997, 2.5014969390631, 2.6677280239264, 2.8339591087898, 3.0001901936531 ], 'serie1': 1.3965417361259, 'amp': 0.5, 'serie2': 135.34884123802, 'randSeed': 4417557, 'noiseMul2': [ 270.0, 990.0, 1710.0, 2430.0 ], 'noiseMul3': [ 360.0, 720.0, 1080.0 ], 'serie4': 11.836456775665, 'panpos': 1.8254655539989 );
)

(
~jpd2Preset = ( 'panmul': 0.35813193321228, 'verbmix': 0.14940318107605, 'serie3': 4003, 'noiseMul1': [ 30.0, 40.6666, 51.3332, 61.9998, 72.6664, 83.333 ], 'bohlen': [ 0.99346774101257, 1.160831695199, 1.3281956493855, 1.4955596035719, 1.6629235577583, 1.8302875119448, 1.9976514661312, 2.1650154203176, 2.3323793745041, 2.4997433286905, 2.667107282877, 2.8344712370634, 3.0018351912498 ], 'serie1': 12.542870019674, 'amp': 0.5, 'serie2': 42.397995150089, 'randSeed': 6302495, 'noiseMul2': [ 270.0, 810.0, 1350.0, 1890.0, 2430.0 ], 'noiseMul3': [ 360.0, 540.0, 720.0, 900.0, 1080.0 ], 'serie4': 91.907023429871, 'panpos': 0.64081461280584 );
)

(
Post << ~jpd2Preset = (bohlen: Array.interpolation(rrand(10,15), rrand(0.99,1.01), rrand(2.99,3.01)), noiseMul1: Array.interpolation(rrand(4,7), 30.0, 83.333), noiseMul2: Array.interpolation(rrand(3, 5), 270, 2430), noiseMul3: Array.interpolation(rrand(3, 5), 360, 1080), serie1: rrand(0.1, 16.99), serie2: rrand(0.3, 280.95), serie3: rrand(1, 4500), serie4: rrand(1.0, 125), verbmix: rrand(0.1, 0.83), panmul: rrand(0.05, 1), panpos: rrand(0.1, 2.9625), randSeed: 10000000.rand, amp: 0.5);
)



(
Ndef(\jpd2, {

	var sig, snd;

	~jpd2Preset[\randSeed] ?? ({ ~jpd2Preset[\randSeed] = 10000000; });
	thisThread.randSeed = ~jpd2Preset[\randSeed].debug("randSeed");

	sig = {snd = LFTri.ar(~jpd2Preset[\bohlen].choose/3);
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
		snd = (snd / 2)}!8;

	// sig = sig + (GlitchBRF.ar(sig, LFPulse.kr(Ndef.kr(\jpd2Mod), 0.0, 0.95, 0.25), ~jpd2Preset[\bohlen]) );
	/*sig = sig * 0.5; */
	// sig = Splay.ar(sig, 1);

	sig = FreeVerb.ar(
		sig,
		0.15 + LFPulse.kr(~jpd2Preset[\verbmix], 0.0, LFPulse.kr(0.35), 0.5, 0.25),
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
	sig = HPF.ar(sig, LFPulse.kr(0.25, 0, 100, 160));

});
)

Ndef(\jpd2).play(0);

Ndef(\jpd2).clear(1);