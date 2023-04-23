
// ok
(
~bigraphPreset = ( 'crv': -12, 'atk': 6.8707007169724e-05, 'trig1Freq': 0.045016779899597, 'amp': 0.051, 'modulo2Offset': 96, 'dcy': 0.071771189570427, 'modulo1': 128, 'noteOffset': 30, 'envPow': 0.7401768684387, 'modulo2Mul': 5.7536766052246, 'modulo2Freq': 1.8303462028503, 'stn': 1, 'trig2Freq': 0.054256244897842, 'rls': 1.8505662679672, 'srcFreq': 14, 'modPhaseMul': 2.2369314063435 )
)


(
~bigraphPreset = (amp: 0.051, atk: 0.0001, dcy: 0.1, stn: 1, rls: 2, crv: (-12), envPow: 1, trig1Freq: 0, trig2Freq: 0, modulo1: 128, modulo2Freq: 3, modulo2Mul: 9, modulo2Offset: 99, noteOffset: 33, srcFreq: 9, modPhaseMul: 3.1415926535898);
) // default

(
~bigraphPreset = ( 'crv': -12, 'atk': 8.2314211130142e-05, 'trig1Freq': 0.067522730827332, 'amp': 0.051, 'modulo2Offset': 43, 'dcy': 0.074790847301483, 'modulo1': 128, 'noteOffset': 53, 'envPow': 0.67135314583778, 'modulo2Mul': 1.8178494691849, 'modulo2Freq': 0.7831169128418, 'stn': 1, 'trig2Freq': 0.16879383325577, 'rls': 1.9973884224892, 'srcFreq': 67, 'modPhaseMul': 2.8165145701781 )
)


(
~bigraphPreset = ( 'crv': -12, 'atk': 9.4498956203461e-05, 'trig1Freq': 2.34856629371643, 'amp': 0.051, 'modulo2Offset': 87, 'dcy': 0.2085665157437325, 'modulo1': 128, 'noteOffset': 39, 'envPow': 0.8292261826992, 'modulo2Mul': 5.8483431577682, 'modulo2Freq': 2.3814787745476, 'stn': 1, 'trig2Freq': 0.18152314662933, 'rls': 1.8441705107689, 'srcFreq': 39, 'modPhaseMul': 3.9519720880263 )
)

(
~bigraphPreset = (amp: 0.051, atk: rrand(0.00005, 0.0001), dcy: rrand(0.025, 0.1), stn: 1, rls: rrand(1.5, 2), crv: (-12), envPow: rrand(0.01, 1), trig1Freq: rrand(0, 0.120), trig2Freq: rrand(0,0.17), modulo1: 128, modulo2Freq: rrand(0.1,3), modulo2Mul: rrand(0.8,9), modulo2Offset: rrand(12,99), noteOffset: rrand(12,53), srcFreq: rrand(4,89), modPhaseMul: rrand(1.12, 3.1415926535898));
)

(
Ndef(\bigraph, {
	// arg out = 0, amp = 0.2, pan = 0, atk = 0.0001, dcy = 0.1, stn = 1, rls = 2, crv = (-12), envPow = 1, trig1Freq = 0, trig2Freq = 0, modulo1 = 128, modulo2Freq = 3, modulo2Mul = 9, modulo2Offset = 99, noteOffset = 33, srcFreq = 9, modPhaseMul = 3.1415926535898, gate = 1, doneAction = 2;
    var sig, modPhase, env, trig1, trig2;
	env = EnvGen.kr(Env.adsr(~bigraphPreset[\atk], ~bigraphPreset[\dcy], ~bigraphPreset[\stn], ~bigraphPreset[\rls], curve: ~bigraphPreset[\crv])).pow(~bigraphPreset[\envPow]);
		trig1 = Impulse.kr(~bigraphPreset[\trig1Freq]);
		trig2 = Impulse.kr(~bigraphPreset[\trig2Freq]);
    modPhase = SinOsc.ar(
        midicps(
            (
				// Sweep.ar(trig1, (33..3)) % ~bigraphPreset[\modulo1] & (Sweep.ar(trig2, (3..9)) % (LFSaw.ar(~bigraphPreset[\modulo2Freq]) * ~bigraphPreset[\modulo2Mul] + (~bigraphPreset[\modulo2Offset] + Ndef.kr(\sinOscFbMod))))
				Sweep.ar(trig1, (33..3)) % ~bigraphPreset[\modulo1] & (Sweep.ar(trig2, (3..9)) % (LFSaw.ar(~bigraphPreset[\modulo2Freq]) * ~bigraphPreset[\modulo2Mul] * (~bigraphPreset[\modulo2Offset])))
			) + (~bigraphPreset[\noteOffset] )
        ),
        0,
			~bigraphPreset[\modPhaseMul]
    );
	sig = (SinOsc.ar(~bigraphPreset[\srcFreq], modPhase) / 3) * env;
	// sig = (SinOsc.ar(~bigraphPreset[\srcFreq], modPhase) / 3) * (Ndef.ar(\sinOscFbMod) + Ndef.ar(\mod2)) * ((Ndef.kr(\mod1) * env) + Ndef.kr(\mod2)) ;
	sig = (Splay.ar(sig) * ~bigraphPreset[\amp]);
		// OffsetOut.ar(out, sig);
});
)

Ndef(\bigraph).play(2);

Ndef(\bigraph).release(8);

Ndef(\bigraph).fadeTime_(18);