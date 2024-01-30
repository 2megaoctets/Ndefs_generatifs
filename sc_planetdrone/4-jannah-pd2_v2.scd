Ndef(\jpd2Mod).fadeTime_(5);

(
~jpd2ModPreset = (freqSlope: 0.5, freqStart: 32, freqEnd: 52, iphaseSlope: 0.01, iphaseStart: 0.0, iphaseEnd: 0.33);
)

(
~jpd2ModPreset = (freqSlope: , freqStart: , freqEnd: , iphaseSlope: , iphaseStart: , iphaseEnd: );
)

(
~jpd2ModPreset = (freqSlope: rrand(0.01, 0.4), freqStart: rrand(40.0, 440), freqEnd: rrand(10.0, 440), iphaseSlope: 0.01, iphaseStart: rrand(0.0, pi/2), iphaseEnd: rrand(0.0, pi/2));
)

(
Ndef(\jpd2Mod, {
	LFPar.kr(
		Phasor.kr(0.0, ~jpd2ModPreset[\freqSlope], ~jpd2ModPreset[\freqStart], ~jpd2ModPreset[\freqEnd]),
		Phasor.kr(0.0, ~jpd2ModPreset[\iphaseSlope], ~jpd2ModPreset[\iphaseStart], ~jpd2ModPreset[\iphaseEnd]),
		0.5
	)
});
)


Ndef(\jpd2).fadeTime_(7);

(
~jpd2Preset = (bohlen: [1, 27/25, 25/21, 9/7, 7/5, 75/49, 5/3, 9/5, 49/25, 15/7, 7/3, 63/25, 25/9, 3], serie1: 13, serie2: 145, serie3: 3000.2, serie4: 30,  verbmix: 0.3, panpos: 0.5, panmul: 0.625, amp: 0.5);
)


(
~jpd2Preset = (bohlen: Array.interpolation(rrand(10,15), 1, 3), serie1: rrand(0.1, 16.99), serie2: rrand(0.3, 280.95), serie3: rrand(1, 4500), serie4: rrand(1.0, 125), verbmix: rrand(0.1, 0.83), panmul: rrand(0.1, 0.925), panpos: rrand(0.1, 2.9625), amp: 0.5);
)


(
Ndef(\jpd2, {

	var sig, snd;
	sig = {{snd = LFTri.ar(~jpd2Preset[\bohlen].choose/3);
		4.do{
			snd = BAllPass.ar(snd, PinkNoise.kr(11, 30 * [1, 3, 9/7, 9/5, 7/3, 25/9].choose + (~jpd2Preset[\serie1] )), 0.01);
			snd =BAllPass.ar(snd, PinkNoise.kr(23, 270 * [1, 3, 9].choose * ~jpd2Preset[\bohlen].choose) + (~jpd2Preset[\serie2]), 0.003);
			snd =BAllPass.ar(snd , PinkNoise.kr(30, 120 * [3, 9, 3].choose * ~jpd2Preset[\bohlen].choose) + ~jpd2Preset[\serie4] , 0.073);
			// snd =((snd * LFNoise0.ar(~jpd2Preset[\bohlen].choose/7, 7, 3)) + WhiteNoise.ar(Lag.ar(Dust2.ar(LFNoise1.kr(1, 25, 3), 1, PinkNoise.kr(0.001)), 0.02), 0)).tanh;
			snd =(
				(snd * LFNoise0.ar(~jpd2Preset[\bohlen].choose/7, 7, 3))
				+
				WhiteNoise.ar(
					Lag.ar(
						Dust2.ar(
							(Ndef.ar(\jpd2Mod, 1) * LFNoise1.kr(1, 25, 3)),
							1, PinkNoise.kr(0.001)), 0.02), 0)
			).tanh;
			snd =LPF.ar(LeakDC.ar(snd, 0.996), 10000 + ~jpd2Preset[\serie3]   )};
		snd = (snd / 2)}!8};
	sig = FreeVerb.ar(
		sig,
		0.15 + LFPulse.kr(~jpd2Preset[\verbmix], 0.0, 0.35, 0.5, 0.0),
		0.5, // 1, // room
		0.65 // 1 // damp
	);
	sig = Mix.ar(sig);
	sig = Pan2.ar(
		sig,
		pos:SinOsc.ar(
			freq: 0.005 + (SinOsc.kr(abs(~jpd2Preset[\panpos]), 0, 20 * Ndef.kr(\jpd2Mod, 1), 50)),
			phase: 0.125,
			mul: ~jpd2Preset[\panmul] * 0.75,
			add: 0.15)
	);
	sig = sig * ~jpd2Preset[\amp] * 0.55;
	sig = Limiter.ar(sig, 0.5);
	sig = HPF.ar(sig, SinOsc.kr(1, 0, 0.5, 80));

});
)

Ndef(\jpd2).play(0);

Ndef(\jpd2).clear(1);