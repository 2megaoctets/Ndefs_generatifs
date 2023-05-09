(
~gcdFuncPreset = (amp: 0.3, atk: 0.001, rls: 0.2, sustain: 1, rangeMin: -4, rangeMax: 4, lfnoiseFrq: 0.05, sinFreq1: 40, sinFreq2: 51, thr: 0.1);
) // default

(
~gcdFuncPreset = (amp: 0.3, atk: rrand(0.001, 0.1), rls: rrand(0.15,0.25), sustain: 1, rangeMin: rrand(-14.0, -2), rangeMax: rrand(2.0, 14), lfnoiseFrq: rrand(0, 0.07), sinFreq1: rrand(40.0, 42), sinFreq2: rrand(38.0, 52), thr: 0.1);
// rrand
)

(
Ndef(\modul, {
	var phaseMod = Line.kr(1, rrand(1.5, 2.5), 0.5);
	var freq = Demand.kr(Impulse.kr(0.1), 0, Dseq([0.06, 3, 0.4, 52, 10, 0.02], inf));
	var sig = SinOsc.kr(
		[cos(freq), freq],
		[cos(phaseMod), pi * phaseMod],
		SinOsc.kr(0.1, pi, 1, 0)
	);
	tanh(sig);
});
)

Ndef(\modul).release(9);

Ndef(\modul).fadeTime = 12;

(
Ndef(\gcdFunc, {
    var sig, src, gcdFunc, env;

	env = EnvGen.kr(Env.asr(~gcdFuncPreset[\atk], 1, ~gcdFuncPreset[\rls]), gate: 1, timeScale: ~gcdFuncPreset[\sustain]);

    gcdFunc = { |a| (a.size > 2).if { gcd(a[0], gcdFunc.(a.drop(1))) } { gcd(a[0], a[1]) } };

	src = {
		SinOsc.ar(
			[~gcdFuncPreset[\sinFreq1], ~gcdFuncPreset[\sinFreq2]],
			LFDNoise3.ar(~gcdFuncPreset[\lfnoiseFrq]).range(0, 2pi * Ndef.kr(\modul))
		).range(~gcdFuncPreset[\rangeMin], ~gcdFuncPreset[\rangeMax])
	} ! 4;
    sig = gcdFunc.(src);
	sig = Limiter.ar(LPF.ar(LeakDC.ar(Splay.ar(sig)), 12000), ~gcdFuncPreset[\thr]).clip2(~gcdFuncPreset[\thr]);
	sig = (sig * env * ~gcdFuncPreset[\amp]);
	// OffsetOut.ar(out, sig);
});
)

Ndef(\gcdFunc).play(2);

Ndef(\gcdFunc).release(6);

Ndef(\gcdFunc).fadeTime_(18);

