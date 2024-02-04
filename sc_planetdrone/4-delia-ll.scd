// fabien edit en cours

Ndef(\dll).fadeTime_(7);

(
~dllPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.35);
)

(
~dllPreset = (planetDrone_1a: rrand(0.01, 0.99), planetDrone_2a: rrand(0.1, 0.95), planetDrone_3a: rrand(0.1, 1), planetDrone_4a: rrand(0.1, 0.9), planetDrone_1b: rrand(0.1, 1), planetDrone_2b: rrand(0.1, 0.95), planetDrone_3b: rrand(0.1, 0.92), planetDrone_4b: rrand(0.1, 0.9),  planetDrone_effect_1: rrand(0.1, 0.93), planetDrone_effect_2: rrand(0.1, 0.925), planetDrone_effect_3: rrand(0.1, 0.9625), hz: rrand(65.41, 300), amp: 0.35);
)

(
Ndef(\dll, {

	var output, filtFreq, noise, noiseAmp, chain, env, segments;
	var tardRate = 0.36 + (~dllPreset[\planetDrone_1a] * 4), combs, sig;
	segments = 4;
	/*env = EnvGen.kr(
		Env(
			levels: { rrand(0.3, 1) } ! segments,
			times: { 0.5.rand } ! segments - 1,
			curve: ({ 4.0.rand2 } ! segments - 1) * ~dllPreset[\planetDrone_1a],
			releaseNode: segments - 2,
			loopNode: 0
		),
		1,
		~dllPreset[\planetDrone_3a],
		0.0,
		~dllPreset[\planetDrone_4a] * 0.01
	);*/

	env = Env(
		levels: { rrand(0.3, 1) } ! segments * ~dllPreset[\planetDrone_3a],
		times: ({ 0.5.rand } ! (segments - 1)) * ~dllPreset[\planetDrone_4a] * 0.01,
		curve: ({ 4.0.rand2 } ! segments - 1) * ~dllPreset[\planetDrone_1a],
		releaseNode: segments - 2,
		loopNode: 0
	).kr(0, 1); // <- raccourcis EnvGen ndef
	noiseAmp = LFNoise1.kr(env * 100).abs;

	noise = BrownNoise.ar(LinXFade2.kr(noiseAmp, env, env));

	filtFreq = SinOsc.kr(tardRate + (~dllPreset[\planetDrone_4a] * 10)).range(400, 1800 + (~dllPreset[\planetDrone_3a] * 2500));
	noise = RLPF.ar(noise, filtFreq, 0.7);

	chain = FFT(LocalBuf(256), noise);
	chain = PV_BinShift(chain, SinOsc.kr(tardRate * 0.986, 0.7).range(0.96, 1.052), SinOsc.kr(tardRate * 1.003, 0.61).range(-3, 2.1));
	chain = PV_BinScramble(chain, 0.05, 0.1, 1.0 );
	noise = IFFT(chain);
	noise = noise.fold(-0.5, 0.5);
	combs = Mix.ar(
		[
			CombL.ar(noise, 0.1, SinOsc.kr(tardRate * 0.9966, 0.1).range(0.00032, 0.00028) * 3.4 * abs(1 + ~dllPreset[\planetDrone_2a]), 0.4, 0.06),
			CombL.ar(noise, 0.1, SinOsc.kr(tardRate * 0.99684, 0.1 ).range(0.000318, 0.000266) * 3.397, 0.4, 0.06)
		]
	) * 1.2;
	output = (noise + combs) * ~dllPreset[\amp];
	output = HPF.ar(output, 80);
	sig = FreeVerb.ar(
		output ! 2,
		0.1 + ~dllPreset[\planetDrone_effect_1],
		0.1 + ~dllPreset[\planetDrone_effect_2]
	);
	sig = FreqShift.ar(
		sig ,
		(0 + (~dllPreset[\planetDrone_effect_3] * 0.75)) / (2..8)
	);
	sig = Splay.ar(sig) * ~dllPreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);
});
)

Ndef(\dll).play(0);

Ndef(\dll).clear(1);