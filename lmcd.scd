
(
~lmcdPreset = (amp: 0.21, att: 0.01, rel: 5, trigDur: 0.1, lfCubTu: 1, hpfFreq: 440);
// default
)

(
~lmcdPreset = ( 'att': 0.036224783658981, 'hpfFreq': 440, 'lfCubTu': 0.83353449106216, 'rel': 4.0325203537941, 'trigDur': 0.067111976146698, 'amp': 0.21 )
)

(
~lmcdPreset = ( 'att': 0.080523428916931, 'hpfFreq': 440, 'lfCubTu': 0.96023582220078, 'rel': 4.3934026360512, 'trigDur': 0.036587396860123, 'amp': 0.21 )
)

(
~lmcdPreset = ( 'att': 0.054452003240585, 'hpfFreq': 440, 'lfCubTu': 0.2589919090271, 'rel': 4.8915323615074, 'trigDur': 0.012462729215622, 'amp': 0.21 )
)

(
~lmcdPreset = (amp: 0.21, att: rrand(0.01, 0.1), rel: rrand(2.5, 5), trigDur: rrand(0.01, 0.1), lfCubTu: rrand(0.1, 1), hpfFreq: 440);
// rrand
)

(
Ndef(\lmcd, {
	var sig, noise, thunder, rainStep, env, delayTime;
	// env = Linen.kr(gate, att, 1, rel, doneAction);
	env = EnvGen.ar(Env.asr(~lmcdPreset[\att], 1, ~lmcdPreset[\rel]));
	sig = Duty.kr(~lmcdPreset[\trigDur], 0, Dseq(fib(32).wrap(20, 55).midicps, inf));
	sig = LFCub.ar([-1, sig, sig / 3, -2] * ~lmcdPreset[\lfCubTu]);
	sig = LeakDC.ar(sig) * 9;
	sig = HPF.ar(sig, ~lmcdPreset[\hpfFreq]).clip2 / 9;
	sig = sig * env;
	sig = Splay.ar(sig, 1, ~lmcdPreset[\amp]);
	// OffsetOut.ar(out, sig);
	// OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan));
});
)

Ndef(\lmcd).fadeTime_(10);

Ndef(\lmcd).play(2);

Ndef(\lmcd).release(12);
