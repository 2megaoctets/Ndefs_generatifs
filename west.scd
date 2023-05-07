
(
~westPreset = (fadeIn: 0.01, fadeOut: 0.01, freq: 220, pitchBendRatio: 1, glide: 0, fm1Ratio: 0.66, fm2Ratio: 3.3, fm1Amount: 0.0, fm2Amount: 0.0, vel: 0.7, pressure: 0, timbre: 0, waveShape: 0, waveFolds: 0, envType: 0, attack: 0.04, peak: 10000, decay: 1, amp: 0.1, lfoShape: 0, lfoFreq: 0.5, lfoToFreqAmount: 0, lfoToWaveShapeAmount: 0, lfoToWaveFoldsAmount: 0, lfoToFm1Amount: 0, lfoToFm2Amount: 0, lfoToAttackAmount: 0, lfoToPeakAmount: 0, lfoToDecayAmount: 0, lfoToReverbMixAmount: 0, drift: 0, dur: 10, t_gate: 1, /*gate=1, */ killGate: 1 );
// default
)
(
~westPreset = ( 'fadeIn': 0.009472633600235, 'lfoToWaveFoldsAmount': 0.067932558059692, 'attack': 0.04, 'pressure': 0.048356151580811,
  'drift': 0.1580126285553, 'fadeOut': 0.0072627478837967, 'envType': 1, 'lfoToFreqAmount': 0.091015434265137, 'lfoShape': 3,
  'fm2Ratio': 2.2107476234436, 'fm1Amount': 0.40482223033905, 'fm2Amount': 0.20059487819672, 'waveFolds': 0.090831995010376, 'lfoToDecayAmount': 0,
  'dur': 10, 'decay': 1, 'amp': 0.021, 'lfoToAttackAmount': 0, 'lfoToReverbMixAmount': 0.22150498628616,
  'timbre': 0.2828013241291, 'lfoFreq': 0.10812397003174, 'lfoToWaveShapeAmount': 0.46422415971756, 'glide': 0.074775338172913, 'vel': 0.7,
  'waveShape': 0.25347763895988, 'lfoToFm1Amount': 0.13178379535675, 'lfoToFm2Amount': 0.19375326633453, 'fm1Ratio': 0.12595733642578, 'peak': 10000,
  'lfoToPeakAmount': 0, 'freq': 68, 'pitchBendRatio': 0.7518587231636 );
)

(
~westPreset = ( 'fadeIn': 0.0080050730705261, 'lfoToWaveFoldsAmount': 0.062978947162628, 'attack': 0.04, 'pressure': 0.22383259534836,
  'drift': 0.15631544589996, 'fadeOut': 0.0068280524015427, 'envType': 0, 'lfoToFreqAmount': 0.039518845081329, 'lfoShape': 0,
  'fm2Ratio': 3.1436656236649, 'fm1Amount': 0.12888491153717, 'fm2Amount': 0.15307071805, 'waveFolds': 0.018590241670609, 'lfoToDecayAmount': 0,
  'dur': 10, 'decay': 1, 'amp': 0.061, 'lfoToAttackAmount': 0, 'lfoToReverbMixAmount': 0.11391842365265,
  'timbre': 0.14032501578331, 'lfoFreq': 0.0511597971916199, 'lfoToWaveShapeAmount': 0.30468195676804, 'glide': 0.1400955915451, 'vel': 0.7,
  'waveShape': 0.12596333026886, 'lfoToFm1Amount': 0.13840772509575, 'lfoToFm2Amount': 0.036532044410706, 'fm1Ratio': 0.32282425880432, 'peak': 10000,
  'lfoToPeakAmount': 0, 'freq': 210, 'pitchBendRatio': 0.78707506656647 );
)

(
Post << ~westPreset = (amp: 0.021, fadeIn: rrand(0.005, 0.01), fadeOut: rrand(0.005, 0.01), freq: rrand(60,420), pitchBendRatio: rrand(0.3,1), glide: rrand(0.0,1), fm1Ratio: rrand(0.1, 0.66), fm2Ratio: rrand(1, 3.3), fm1Amount: rrand(0.0, 0.5), fm2Amount: rrand(0.0, 0.35), vel: 0.7, pressure: rrand(0, 0.3), timbre: rrand(0, 0.35), waveShape: rrand(0, 0.35), waveFolds: rrand(0, 0.25), envType: rrand(0, 1), attack: 0.04, peak: 10000, decay: 1, lfoShape: rrand(0, 3), lfoFreq: rrand(0.1, 0.5), lfoToFreqAmount: rrand(0, 0.14), lfoToWaveShapeAmount: rrand(0, 0.5), lfoToWaveFoldsAmount: rrand(0, 0.1), lfoToFm1Amount: rrand(0, 0.15), lfoToFm2Amount: rrand(0, 0.3), lfoToAttackAmount: 0, lfoToPeakAmount: 0, lfoToDecayAmount: 0, lfoToReverbMixAmount: rrand(0, 0.25), drift: rrand(0, 0.2), dur: 10);
// rrand
) ;

(
~westPreset = ( 'fadeIn': 0.0093503767251968, 'lfoToWaveFoldsAmount': 0.049498617649078, 'attack': 0.04, 'pressure': 0.18272227048874,  'drift': 0.10011909008026, 'fadeOut': 0.0088478624820709, 'envType': 0, 'lfoToFreqAmount': 0.12006192684174, 'lfoShape': 3,   'fm2Ratio': 2.0281603813171, 'fm1Amount': 0.18409752845764, 'fm2Amount': 0.21566777825356, 'waveFolds': 0.22270148992538, 'lfoToDecayAmount': 0,   'dur': 10, 'decay': 1, 'amp': 0.061, 'lfoToAttackAmount': 0, 'lfoToReverbMixAmount': 0.20571199059486,   'timbre': 0.27708098292351, 'lfoFreq': 0.23736214637756, 'lfoToWaveShapeAmount': 0.29811197519302, 'glide': 0.10442280769348, 'vel': 0.7,   'waveShape': 0.30640349984169, 'lfoToFm1Amount': 0.092695695161819, 'lfoToFm2Amount': 0.24404439926147, 'fm1Ratio': 0.38128667831421, 'peak': 10000,   'lfoToPeakAmount': 0, 'freq': 243, 'pitchBendRatio': 0.94898122549057 );
)

(
Post << ~westPreset = (fadeIn: 0.01, fadeOut: 0.01, freq: 220, pitchBendRatio: 1, glide: 0, fm1Ratio: 0.66, fm2Ratio: 3.3, fm1Amount: 0.0, fm2Amount: 0.0, vel: 0.7, pressure: 0, timbre: 0, waveShape: 0, waveFolds: 0, envType: 0, attack: 0.04, peak: 10000, decay: 1, amp: 0.031, lfoShape: 0, lfoFreq: 0.5, lfoToFreqAmount: 0, lfoToWaveShapeAmount: 0, lfoToWaveFoldsAmount: 0, lfoToFm1Amount: 0, lfoToFm2Amount: 0, lfoToAttackAmount: 0, lfoToPeakAmount: 0, lfoToDecayAmount: 0, lfoToReverbMixAmount: 0, drift: 0, dur: 10);
// default
)

(
~westPreset = ( 'fadeIn': 0.009314392209053, 'lfoToWaveFoldsAmount': 0.0054842948913574, 'attack': 0.04, 'pressure': 0.23147302865982,
  'drift': 0.11903855800629, 'fadeOut': 0.0091292178630829, 'envType': 1, 'lfoToFreqAmount': 0.016076285839081, 'lfoShape': 2,
  'fm2Ratio': 2.8589839339256, 'fm1Amount': 0.35786592960358, 'fm2Amount': 0.3085353910923, 'waveFolds': 0.20430070161819, 'lfoToDecayAmount': 0,
  'dur': 10, 'decay': 1, 'amp': 0.021, 'lfoToAttackAmount': 0, 'lfoToReverbMixAmount': 0.085539937019348,
  'timbre': 0.045879137516022, 'lfoFreq': 0.24191155433655, 'lfoToWaveShapeAmount': 0.4341955780983, 'glide': 0.45726263523102, 'vel': 0.7,
  'waveShape': 0.18246900439262, 'lfoToFm1Amount': 0.076183837652206, 'lfoToFm2Amount': 0.00084843635559082, 'fm1Ratio': 0.39958936691284, 'peak': 10000,
  'lfoToPeakAmount': 0, 'freq': 259, 'pitchBendRatio': 0.98423570394516);
)


(
Ndef(\west, {
	var i_nyquist = SampleRate.ir * 0.5, signal, controlLag = 0.005, i_numHarmonics = 44,
	modFreq, mod1, mod2, mod1Index, mod2Index, mod1Freq, mod2Freq, sinOsc, triOsc, additiveOsc, additivePhase,
	filterEnvVel, filterEnvLow, lpgEnvelope, lpgSignal, asrEnvelope, asrFilterFreq, asrSignal, killEnvelope, i_driftRate = 0.15, maxDecay=8, freq, fm1Ratio, fm2Ratio, fm1Amount, fm2Amount, vel, waveShape, waveFolds, decay, attack, peak;

	// Make lfos
	var lfo = Select.kr(~westPreset[\lfoShape], [
		LFTri.kr(~westPreset[\lfoFreq]),
		LFSaw.kr(~westPreset[\lfoFreq]),
		LFPulse.kr(~westPreset[\lfoFreq]),
		LFDNoise0.kr(~westPreset[\lfoFreq] * 2)
	]);

	var lfoArray = Array.fill(9, 0);
	var drift = ~westPreset[\drift];
	lfoArray[0] = (lfo * max(0.01, ~westPreset[\lfoToFreqAmount]) * 18).midiratio; // Freq ratio
	lfoArray[1] = (lfo * ~westPreset[\lfoToWaveShapeAmount]) + LFNoise1.kr(freq: i_driftRate, mul: drift); // Wave Shape
	lfoArray[2] = ((lfo * ~westPreset[\lfoToWaveFoldsAmount]) + LFNoise1.kr(freq: i_driftRate, mul: drift)) * 2; // Wave Folds
	lfoArray[3] = ((lfo * ~westPreset[\lfoToFm1Amount]) + LFNoise1.kr(freq: i_driftRate, mul: drift)) * 0.5; // FM1 Amount
	lfoArray[4] = ((lfo * ~westPreset[\lfoToFm2Amount]) + LFNoise1.kr(freq: i_driftRate, mul: drift)) * 0.5; // FM2 Amount
	lfoArray[5] = ((lfo * ~westPreset[\lfoToAttackAmount]) + LFNoise1.kr(freq: i_driftRate, mul: drift)) * 2.2; // Attack
	lfoArray[6] = (((lfo * ~westPreset[\lfoToPeakAmount]) + LFNoise1.kr(freq: i_driftRate, mul: drift)) * 24).midiratio; // Peak multiplier
	lfoArray[7] = ((lfo * ~westPreset[\lfoToDecayAmount]) + LFNoise1.kr(freq: i_driftRate, mul: drift)) * 2.2; // Decay
	lfoArray[8] = (lfo * ~westPreset[\lfoToReverbMixAmount]) + LFNoise1.kr(freq: i_driftRate, mul: drift); // Reverb Mix


	// LFO ins
	freq = (~westPreset[\freq] * lfoArray[0]).clip(0, i_nyquist);
	waveShape = (~westPreset[\waveShape] + lfoArray[1]).clip(0, 1);
	waveFolds = (~westPreset[\waveFolds] + lfoArray[2]).clip(0, 3);
	fm1Amount = (~westPreset[\fm1Amount] + lfoArray[3]).clip(0, 1);
	fm2Amount = (~westPreset[\fm2Amount] + lfoArray[4]).clip(0, 1);
	attack = (~westPreset[\attack] + lfoArray[5]).clip(0.003, 8);
	peak = (~westPreset[\peak] * lfoArray[6]).clip(100, 10000);
	decay = (~westPreset[\decay] + lfoArray[7]).clip(0.01, maxDecay);

	// Lag inputs
	freq = Lag.kr(freq * ~westPreset[\pitchBendRatio], 0.007 + ~westPreset[\glide]);
	fm1Ratio = Lag.kr(~westPreset[\fm1Ratio], controlLag);
	fm2Ratio = Lag.kr(~westPreset[\fm2Ratio], controlLag);
	fm1Amount = Lag.kr(fm1Amount.squared, controlLag);
	fm2Amount = Lag.kr(fm2Amount.squared, controlLag);

	vel = Lag.kr(~westPreset[\vel], controlLag);
	waveShape = Lag.kr(waveShape, controlLag);
	waveFolds = Lag.kr(waveFolds, controlLag);
	attack = Lag.kr(attack, controlLag);
	peak = Lag.kr(peak, controlLag);
	decay = Lag.kr(decay, controlLag);

	// Modulators
	mod1Index = fm1Amount * 22;
	mod1Freq = freq * fm1Ratio * LFNoise2.kr(freq: 0.1, mul: 0.001, add: 1);
	mod1 = SinOsc.ar(freq: mod1Freq, phase: 0, mul: mod1Index * mod1Freq, add: 0);
	mod2Index = fm2Amount * 12;
	mod2Freq = freq * fm2Ratio * LFNoise2.kr(freq: 0.1, mul: 0.005, add: 1);
	mod2 = SinOsc.ar(freq: mod2Freq, phase: 0, mul: mod2Index * mod2Freq, add: 0);
	modFreq = freq + mod1 + mod2;

	// Sine and triangle
	sinOsc = SinOsc.ar(freq: modFreq, phase: 0, mul: 0.5);
	triOsc = VarSaw.ar(freq: modFreq, iphase: 0, width: 0.5, mul: 0.5);

	// Additive square and saw
	additivePhase = LFSaw.ar(freq: modFreq, iphase: 1, mul: pi, add: pi);
	additiveOsc = Mix.fill(i_numHarmonics, {
		arg index;
		var harmonic, harmonicFreq, harmonicCutoff, attenuation;

		harmonic = index + 1;
		harmonicFreq = freq * harmonic;
		harmonicCutoff = i_nyquist - harmonicFreq;

		// Attenuate harmonics that will go over nyquist once FM is applied
		attenuation = Select.kr(index, [1, // Save the fundamental
			(harmonicCutoff - (harmonicFreq * 0.25) - harmonicFreq).expexp(0.000001, harmonicFreq * 0.5, 0.000001, 1)]);

		(sin(additivePhase * harmonic % 2pi) / harmonic) * attenuation * (harmonic % 2 + waveShape.linlin(0.666666, 1, 0, 1)).min(1);
	}
	);

	// Mix carriers
	signal = LinSelectX.ar(waveShape * 3, [sinOsc, triOsc, additiveOsc]);

	// Fold
	signal = Fold.ar(in: signal * (1 + (~westPreset[\timbre] * 0.5) + (waveFolds * 2)), lo: -0.5, hi: 0.5);

	// Hack away some aliasing
	signal = LPF.ar(in: signal, freq: 12000);

	// Noise
	signal = signal + PinkNoise.ar(mul: 0.003);

	// LPG
	filterEnvVel = vel.linlin(0, 1, 0.5, 1);
	filterEnvLow = (peak * filterEnvVel).min(300);

	lpgEnvelope = EnvGen.ar(envelope: Env.new(levels: [0, 1, 0], times: [0.003, decay], curve: [4, -20]), timeScale: ~westPreset[\dur]);
	lpgSignal = RLPF.ar(in: signal, freq: lpgEnvelope.linlin(0, 1, filterEnvLow, peak * filterEnvVel), rq: 0.9);
	// lpgSignal = lpgSignal * EnvGen.ar(envelope: Env.new(levels: [0, 1, 0], times: [0.002, decay], curve: [4, -10]), timeScale: ~westPreset[\dur]);

	// ASR with 4-pole filter
	asrEnvelope = EnvGen.ar(envelope: Env.new(levels: [0, 1, 0], times: [attack, decay], curve: -4, releaseNode: 1));
	asrFilterFreq = asrEnvelope.linlin(0, 1, filterEnvLow, peak * filterEnvVel);
	asrSignal = RLPF.ar(in: signal, freq: asrFilterFreq, rq: 0.95);
	asrSignal = RLPF.ar(in: asrSignal, freq: asrFilterFreq, rq: 0.95);
	asrSignal = asrSignal * EnvGen.ar(envelope: Env.asr(attackTime: attack, sustainLevel: 1, releaseTime: decay, curve: -4));

	signal = Select.ar(~westPreset[\envType], [lpgSignal, asrSignal]);

	signal = signal * vel.linlin(0, 1, [0.18, 0.2], 1) ;

	// Saturation amp
	signal = tanh(signal * ~westPreset[\pressure].linlin(0, 1, 1.5, 3) * ~westPreset[\amp]).softclip;

	// main Envelope
	signal = signal * EnvGen.kr(
		Env([0.0,1.0,1.0,0], [~westPreset[\fadeIn], ~westPreset[\fadeOut]], releaseNode: 2)
	);

	signal;

});
)

Ndef(\west).clear;


Ndef(\west).play(2);

Ndef(\west).release(9);

Ndef(\west).fadeTime_(8);
