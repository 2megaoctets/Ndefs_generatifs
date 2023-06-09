Ndef(\mod1).fadeTime_(12);

(
~mod1Preset = (freq: 0.2, freqTo: 0.5, freqSlope: 2.5, iphase: 0.0, iphaseTo: 0.1, iphaseSlope: 2.3, mul: 1.0, mulTo: 0.75, mulSlope: 0.15);
)

(
~mod1Preset = (freq: rrand(0.12, 5), freqTo: rrand(0.15, 5), freqSlope: rrand(0.02, 0.1), iphase: rrand(0.0, pi), iphaseTo: rrand(0.01, pi*2), iphaseSlope: rrand(0.012, 0.1), mul: rrand(0.5, 1.0), mulTo: rrand(0.5, 1), mulSlope: rrand(0.15, 0.1));
)


(
Ndef(\mod1, {
	LFPar.kr(
		freq: Phasor.kr(start: ~mod1Preset[\freq], end: ~mod1Preset[\freqTo], rate: ~mod1Preset[\freqSlope], resetPos: ~mod1Preset[\freqTo]) * (Ndef.kr(\mod2) * 0.5 + 0.5),
		iphase: Phasor.kr(start: ~mod1Preset[\iphase], end: ~mod1Preset[\iphaseTo], rate: ~mod1Preset[\iphaseSlope] , resetPos: ~mod1Preset[\iphase]),
		mul: Phasor.kr(start: ~mod1Preset[\mul], end: ~mod1Preset[\mulTo], rate: ~mod1Preset[\mulSlope], resetPos: ~mod1Preset[\mulTo])
	);
});
)

Ndef(\mod2).fadeTime_(12);

(
~mod2Preset = (freq: 0.2, freqTo: 1, freqSlope: 0.125, width: 0.25, widthTo: 0.75, widthSlope: 0.035, mul: 0.75, mulTo: 0.9, mulSlope: 0.05);
)

(
~mod2Preset = (freq: rrand(0.1, 3), freqTo: rrand(0.1, 10), freqSlope: rrand(0.01, 0.18), width: rrand(0.05, 1), widthTo: rrand(0.05, 1), widthSlope: rrand(0.01, 0.12), mul: rrand(0.25, 0.95), mulTo: rrand(0.25, 0.95), mulSlope: rrand(0.01, 0.18));
)

(
Ndef(\mod2, {
	Pulse.kr(
		freq: Phasor.kr(start: ~mod2Preset[\freq], end: ~mod2Preset[\freqTo], rate:~mod2Preset[\freqSlope] + (Ndef.kr(\mod1) * 0.5 + 0.5)),
		width: Phasor.kr(start: ~mod2Preset[\width], end: ~mod2Preset[\widthTo], rate: ~mod2Preset[\widthSlope] * cos(Ndef.kr(\mod1)), resetPos: ~mod2Preset[\widthTo]),
		mul: Phasor.kr(start: ~mod2Preset[\mul], end: ~mod2Preset[\mulTo], rate: ~mod2Preset[\mulSlope], resetPos: ~mod2Preset[\mulTo])
	);
});
)


Ndef(\bigraph).fadeTime_(18);

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
~bigraphPreset = ( 'crv': -12, 'atk': 9.810443520546e-05, 'trig1Freq': 0.017981886863708, 'amp': 0.051, 'modulo2Offset': 82, 'dcy': 0.049163869023323, 'modulo1': 128, 'noteOffset': 26, 'envPow': 0.50888347387314, 'modulo2Mul': 4.6286385774612, 'modulo2Freq': 0.5213317155838, 'stn': 1, 'trig2Freq': 0.033640800714493, 'rls': 1.6970034241676, 'srcFreq': 53, 'modPhaseMul': 1.77260344692 ) ;
)

(
~bigraphPreset = ( 'crv': -5, 'atk': 6.3081806898117e-05, 'trig1Freq': 0.084721727371216, 'amp': 0.051, 'modulo2Offset': 69, 'dcy': 0.087416344881058, 'modulo1': 128, 'noteOffset': 36, 'envPow': 0.96279802918434, 'modulo2Mul': 6.0141309022903, 'modulo2Freq': 1.0204768776894, 'stn': 1, 'trig2Freq': 0.045470143556595, 'rls': 1.5917581319809, 'srcFreq': 69, 'modPhaseMul': 2.327184348993 );
)

(
~bigraphPreset = (amp: 0.051, atk: rrand(0.00005, 0.0001), dcy: rrand(0.025, 0.1), stn: 1, rls: rrand(1.5, 2), crv: rrand(-12, -4), envPow: rrand(0.01, 1), trig1Freq: rrand(0, 0.120), trig2Freq: rrand(0,0.17), modulo1: 128, modulo2Freq: rrand(0.1,3), modulo2Mul: rrand(0.8,9), modulo2Offset: rrand(12,99), noteOffset: rrand(12,53), srcFreq: rrand(4,89), modPhaseMul: rrand(1.12, 3.1415926535898));
)

(
Ndef(\bigraph, {
    var sig, modPhase, env, trig1, trig2;
	env = EnvGen.kr(Env.adsr(~bigraphPreset[\atk], ~bigraphPreset[\dcy], ~bigraphPreset[\stn], ~bigraphPreset[\rls], curve: ~bigraphPreset[\crv])).pow(~bigraphPreset[\envPow]);
	trig1 = Impulse.kr(~bigraphPreset[\trig1Freq] );
	trig2 = Impulse.kr(~bigraphPreset[\trig2Freq] );
    modPhase = SinOsc.ar(
        midicps(
            (
				Sweep.ar(trig1, (33..3)) % ~bigraphPreset[\modulo1]  & (Sweep.ar(trig2, (3..9)) % (LFSaw.ar(~bigraphPreset[\modulo2Freq]) * ~bigraphPreset[\modulo2Mul] * (~bigraphPreset[\modulo2Offset] + (Ndef.ar(\mod1) + 0.5 * 0.5) )))
			) + (~bigraphPreset[\noteOffset] % (Ndef.kr(\mod2) * 0.5 + 0.5))
        ),
        0,
			~bigraphPreset[\modPhaseMul]
    );
	sig = SinOsc.ar(~bigraphPreset[\srcFreq], modPhase ) / 1.5 * env;
	sig = (Splay.ar(sig) * ~bigraphPreset[\amp]);
});
)

Ndef(\bigraph).play(2);

Ndef(\bigraph).release(8);
