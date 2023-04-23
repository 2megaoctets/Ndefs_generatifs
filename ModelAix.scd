// Moduler Greyhole

(
~modelAixPreset = ( 'atk': 0.0010641890645027, 'pan': 0, 'revtSel': 1, 'out': 2, 'amp': 0.1, 'rls': 0.25551299858093, 'sustain': 1 )
)


(
~modelAixPreset = (out: 2, amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, revtSel: 0)
) // default

(
~modelAixPreset = ( 'atk': 0.00071098121404648, 'revtSel': 1, 'out': 2, 'amp': 0.1, 'rls': 0.16832694339752, 'sustain': 1 )
)

(
~modelAixPreset = ( 'atk': 0.0008523430109024, 'pan': 0, 'revtSel': 0, 'out': 2, 'amp': 0.1, 'rls': 0.16422292542458, 'sustain': 1 )
)

(
~modelAixPreset = (out: 2, amp: 0.1, pan: 0, atk: rrand(0.0005, 0.0012), rls: rrand(0.162, 0.3), sustain: 1, revtSel: rrand(0,1))
) // rrand

(
Ndef(\modelAix, {
	// arg out = 0, amp = 0.1, pan = 0, atk = 0.001, rls = 0.2, sustain = 1, revtSel = 0, gate = 1, doneAction = 2;
	var snd, revt, revt1, revt2, revt3, env;

	env = EnvGen.kr(Env.asr(~modelAixPreset[\atk], 1, ~modelAixPreset[\rls]), timeScale: ~modelAixPreset[\sustain]);

	snd = Pulse.ar(freq: LFNoise0.ar([2,3]).exprange(50,5000));
	snd = snd * LFPulse.ar(
		freq: LFNoise0.ar(1).exprange(0.5,8),
		width:0.02,
		mul: LFNoise1.ar(3).exprange(0.01,1000));
	snd = HPF.ar(snd, 50);

	// reverb time - various optons:
	revt1 = LFNoise0.ar(1).exprange(0.0001, 0.01);
	revt2 = LFTri.ar(0.0165, -1).exprange(1, 0.0001);
	revt3 = LFTri.ar(1/10, 1).range(0.01, 0.0001);

	revt = Select.ar(~modelAixPreset[\revtSel], [revt1, revt2, revt3, K2A.ar(0.000001)]);
	snd = Greyhole.ar(snd, revt, 0.5, revt);
	snd = Limiter.ar(snd, 0.9);
	snd = (snd * env * ~modelAixPreset[\amp]);
	// OffsetOut.ar(out, snd);
});
)

Ndef(\modelAix).play(2);

Ndef(\modelAix).release(8);

Ndef(\modelAix).fadeTime_(9);