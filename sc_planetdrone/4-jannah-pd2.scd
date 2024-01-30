Ndef(\jpd2).fadeTime_(3);

(
~jpd2Preset = (serie1: 0.13, serie2: 0.145, serie3: 0.2, serie4: 0.1,  verbmix: 0.3, panpos: 0.5, panmul: 0.625, amp: 0.5);
)


(
~jpd2Preset = (serie1: rrand(0.01, 0.99), serie2: rrand(0.1, 0.95), serie3: rrand(0.1, 1), serie4: rrand(0.1, 0.9), verbmix: rrand(0.1, 0.93), panmul: rrand(0.1, 0.925), panpos: rrand(0.1, 0.9625), amp: 0.5);
)


(
Ndef(\jpd2, {

	var sig, snd;
	~bohlen=[1, 27/25, 25/21, 9/7, 7/5, 75/49, 5/3, 9/5, 49/25, 15/7, 7/3, 63/25, 25/9, 3];
	sig = {{snd = LFTri.ar(~bohlen.choose/3);
		4.do{
			snd = BAllPass.ar(snd, PinkNoise.kr(11, 30 * [1, 3, 9/7, 9/5, 7/3, 25/9].choose + (~jpd2Preset[\serie1] * 15)), 0.01);
			snd =BAllPass.ar(snd, PinkNoise.kr(23, 270 * [1, 3, 9].choose * ~bohlen.choose) + (~jpd2Preset[\serie2] * 275), 0.003);
			snd =BAllPass.ar(snd, PinkNoise.kr(30, 120 * [3, 9, 3].choose * ~bohlen.choose) + (~jpd2Preset[\serie4] * 125), 0.073);
			snd =((snd * LFNoise0.ar(~bohlen.choose/7, 7, 3)) + WhiteNoise.ar(Lag.ar(Dust2.ar(LFNoise1.kr(1, 25, 3), 1, PinkNoise.kr(0.001)), 0.02), 0)).tanh;
			snd =LPF.ar(LeakDC.ar(snd, 0.996), 10000 + (~jpd2Preset[\serie3] * 4500)  )};
		snd = (snd / 2)}!8};
	sig = FreeVerb.ar(sig, 0.15 + ~jpd2Preset[\verbmix], 1, 1);
	sig = Mix.ar(sig);
	sig = Pan2.ar(
		sig,
		pos:SinOsc.ar(
			freq: 0.005 + (SinOsc.kr(abs(~jpd2Preset[\panpos] * 3), 0, 20, 50)),
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