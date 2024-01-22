// 3105 pas fini  : graphe, mod1

(
Ndef(\floatingPointErrorsMod1).fadeTime_(22);
)

(~mod1Preset = ( 'iphaseTo': 0.76112425327301, 'mulTo': 0.753338098526, 'freqTo': 7.3651354007721, 'width': 0.99752256274223,
  'widthTo': 0.92437267303467, 'freq': 2.337879610062, 'mulSlope': 0.05043039560318, 'iphase': 0.99693048000336, 'iphaseSlope': 0.024494314193726,
  'widthSlope': 0.023717739582062, 'mul': 0.7987938451767, 'freqSlope': 1.7061628580093 )
;)

(~mod1Preset = (freq: 2, freqTo: 15, freqSlope: 0.6, iphase: 0, iphaseTo: pi, iphaseSlope: 0.1, width: 0.87, widthTo: 1, widthSlope: 0.03, mul: 1, mulTo: 0.99, mulSlope: 0.01);)

(~mod1Preset = ( 'iphaseTo': 0.020291447639465, 'mulTo': 0.82755702733994, 'freqTo': 3.382718237162, 'width': 0.87584480643272,
  'widthTo': 0.84853640198708, 'freq': 16.5255143601894, 'mulSlope': 0.023716312646866, 'iphase': 0.93742084503174, 'iphaseSlope': 0.04655141711235,
  'widthSlope': 0.012570865154266, 'mul': 0.98665377616882, 'freqSlope': 3.2299557805061 )
;)

(~mod1Preset =  ('iphaseTo': 0.98492538928986, 'mulTo': 0.76000958681107, 'freqTo': 69.65300471783, 'width': 0.99372059106827,
  'widthTo': 0.81601485610008, 'freq': 12.34445371628, 'mulSlope': 0.049938156604767, 'iphase': 0.83512544631958, 'iphaseSlope': 0.034405001401901,
  'widthSlope': 0.087808544635773, 'mul': 0.99623997211456, 'freqSlope': 5.8169541239738 );)

(~mod1Preset = (freq: rrand(0.2, 13.00), freqTo: rrand(2, 63.00), freqSlope: rrand(0.1, 1.1), iphase: rrand(0.0, 1), iphaseTo: rrand(0.0, 1), iphaseSlope: rrand(0.01, 0.1), width: rrand(0.75, 1), widthTo: rrand(0.75, 1), widthSlope: rrand(0.01, 0.1), mul: rrand(0.78, 1), mulTo: rrand(0.75, 1), mulSlope: rrand(0.01, 0.1));)

(
Ndef(\floatingPointErrorsMod1, {
	LFPulse.kr(
		freq: Phasor.kr(0.0, ~mod1Preset[\freqSlope], ~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqTo]),
		iphase: Phasor.kr(0.0, ~mod1Preset[\iphaseSlope], ~mod1Preset[\iphase], ~mod1Preset[\iphaseTo], ~mod1Preset[\iphaseTo]) * SinOsc.kr(Ndef.kr(\mod2).cos), // 0..1
		width: Phasor.kr(0.0, ~mod1Preset[\widthSlope], ~mod1Preset[\width], ~mod1Preset[\widthTo], ~mod1Preset[\widthTo]),
		mul: Phasor.kr(0.0, ~mod1Preset[\mulSlope], ~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulTo])
	);
})
)

(
Ndef(\floatingPointErrorsMod2).fadeTime_(12);
)

(~mod2Preset = ( 'phaseSlope': 0.054374605417252, 'mul': 0.66760340929031, 'freqSlope': 5.333999145031, 'phase': 2.4810985762403,
  'freqTo': 13.88414754868, 'phaseTo': 1.2972556443161, 'freq': 1101.4124545574, 'mulTo': 0.66136627197266, 'mulSlope': 0.043804609775543 )
 ;)

(~mod2Preset = ( 'phaseSlope': 0.095024062395096, 'mul': 0.73929506540298, 'freqSlope': 1.365862929821, 'phase': 0.31204936766299,
  'freqTo': 6.814984614372, 'phaseTo': 1.2016102943605, 'freq': 39.61998090744, 'mulTo': 0.6583433508873, 'mulSlope': 0.015672979354858 )
 ;)

(~mod2Preset = ( 'phaseSlope': 0.094131895303726, 'mul': 0.90399335622787, 'freqSlope': 8.6860234618187, 'phase': 2.0432639074918,
  'freqTo': 63.5410558224, 'phaseTo': 0.77392813664194, 'freq': 123.09250648022, 'mulTo': 0.8441557765007, 'mulSlope': 0.084886159896851 )

;)

(~mod2Preset = (freq: rrand(0.2, 134), freqTo: rrand(0.2, 122), freqSlope: rrand(0.21, 1.1), phase: rrand(0, pi), phaseTo: rrand(0, pi), phaseSlope: rrand(0.01, 0.1), mul: rrand(0.65, 0.95), mulTo: rrand(0.65, 0.95), mulSlope: rrand(0.01, 1.1));)

(
Ndef(\floatingPointErrorsMod2, {
	SinOsc.kr(
		freq: Phasor.kr(0.0, ~mod2Preset[\freqSlope], ~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqTo]) +  (Ndef(\mod1)).cos,
		phase: Phasor.kr(0.0, ~mod2Preset[\phaseSlope], ~mod2Preset[\phase], ~mod2Preset[\phaseTo], ~mod2Preset[\phaseTo]).mod(pi), // radians, 0..8pi
		mul: Phasor.kr(0.0, ~mod2Preset[\mulSlope], ~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulTo])
	)
})
)

(
Ndef(\floatingPointErrorsMod3).fadeTime_(12);
)

(~mod3Preset = ;)

(
Ndef(\floatingPointErrorsMod3, {})
)


Ndef(\floatingPointErrors).fadeTime_(8);


(
~floatingPointErrorsPreset = (amp: 0.061, attack: 0, release: 1.4, sustain: 1, curve: (-4), envPow: 1, med4: 30, med5: 50);
)

(
~floatingPointErrorsPreset = (amp: 0.061, attack: 0, release: 1.4, sustain: 1, curve: (-4), envPow: 1, med4: 3, med5: 5);
)

(
~floatingPointErrorsPreset = (amp: 0.061, attack: 0, release: 1.4, sustain: 1, curve: (-4), envPow: 1, med4: 1.3, med5: 13.5);
)

(
~floatingPointErrorsPreset = (amp: 0.061, attack: 0, release: 1.4, sustain: 1, curve: (-4), envPow: 1, med4: 21, med5: 1.2);
)

(
~floatingPointErrorsPreset = (amp: 0.061, attack: 0, release: rrand(0.9, 1.7), sustain: rrand(0.9, 1.2), curve: (-4), envPow: 1, med4: rrand(3.0,20), med5: rrand(1.0, 15));
)

(
Ndef(\floatingPointErrors, {
    var sig, sig1, pink1, sig2, pink2, sig3, pink3, sig4, sig5, globalEnv;

	globalEnv = EnvGen.ar(
		Env.asr(
			~floatingPointErrorsPreset[\attack],
			1,
			~floatingPointErrorsPreset[\release],
			~floatingPointErrorsPreset[\curve]
		),
		timeScale: ~floatingPointErrorsPreset[\sustain]
	).pow(~floatingPointErrorsPreset[\envPow]);

	pink1 = { PinkNoise.ar().range(1 /*0.08*/, 0.12) } ! 2;
    sig1 = 0.5 * LeakDC.ar(Median.ar(2, Limiter.ar(99999999*(SawDPW.ar(pink1, 0) + SawDPW.ar(pink1, pi)), 0.9)));

	pink2 = { PinkNoise.ar().range(0.0999/3, 0.1001/3 * Ndef.kr(\floatingPointErrorsMod2)) } ! 2;
    sig2 = 0.5*LeakDC.ar(Median.ar(5, Limiter.ar(99999999*(SawDPW.ar(pink2, 0) + SawDPW.ar(pink2, pi)), 0.9)));

	pink3 = { PinkNoise.ar().range(0.00999, 0.01001 + Ndef.kr(\floatingPointErrorsMod1)) } ! 2;
	// sig3 = 0.5 * Median.ar(20, Limiter.ar(999999*LeakDC.ar(SawDPW.ar(pink3, 0+(pi/2)) + SawDPW.ar(pink3 , pi+(pi/2))), 0.1));
	sig3 = /*0.5 * */Median.ar((20 * (Ndef.kr(\floatingPointErrorsMod1) + Ndef.kr(\floatingPointErrorsMod2).cos)), Limiter.ar(999999*LeakDC.ar(SawDPW.ar(pink3, 0+(pi/2)) + SawDPW.ar(pink3 , pi+(pi/2))), 0.1)) ;

	sig4 = 0.5 * Median.ar(
		min(1, ~floatingPointErrorsPreset[\med4] + Ndef.kr(\floatingPointErrorsMod2).cos),
		Limiter.ar(99999999*LeakDC.ar((SinOsc.ar(0.005, 0) + SinOsc.ar(0.005 * Ndef.kr(\floatingPointErrorsMod1), pi)), 0.05))
	) ! 2;

	sig5 = 0.5 * SVF.ar((
		Median.ar(
			// max(1, ~floatingPointErrorsPreset[\med5] + Ndef.kr(\mod1)),
			max(1, ~floatingPointErrorsPreset[\med5] + Ndef.kr(\floatingPointErrorsMod1)),
			Limiter.ar(999999*LeakDC.ar(LFPulse.ar(0.5, 0) + LFPulse.ar(0.5 * Ndef.kr(\floatingPointErrorsMod2).cos, pi)), 0.6)
		)
	), 800) ! 2;

	// sig = sig1 + sig2 + sig3 + sig4 + sig5;
    sig = sig1 + sig2  + sig3 + sig4 + sig5;
	sig = sig * ~floatingPointErrorsPreset[\amp] * 0.55;
    sig = Limiter.ar(sig, 0.46, 0.05);
	sig = sig * globalEnv;
});
)

Ndef(\floatingPointErrors).play(0);

Ndef(\floatingPointErrors).release(1);

Ndef(\floatingPointErrors).clear;

