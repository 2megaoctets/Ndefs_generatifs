// variables sur les tableaux


(
~duryGenePreset = (amp: 0.02, impFreq1: 0.02, impFreq2: 0.04, smooth1: 4, smooth2: 1.7, smooth3: 0.9)
) // default

(
~duryGenePreset = (amp: 0.01, impFreq1: rrand(0.02, 0.1), impFreq2: rrand(0.04, 0.15), smooth1: rrand(0.5, 4), smooth2: rrand(0.7, 2), smooth3: rrand(0.65, 0.8)) // rrand
)

// ERROR: Message '*' not understood.
// réglé 1504 !!
(
Ndef(\duryGene, {
    var snd, rep, repCh, randNum, fac, fac1, fac2, fac3;

    rep = [4, 8, 16, 24, 32];
	repCh = TChoose.kr(Impulse.kr(~duryGenePreset[\impFreq1]), rep);
    randNum = [

        54, 60, 66, 72, 81, 90, 96, 102,
        108, 128, 132, 144, 162, 180, 192, 204,
        216, 240, 264, 288, 324, 360, 384, 408,
        432, 480, 528, 576, 648, 720, 768, 816,
        864, 960, 1056, 1152, 1296, 1440, 1536, 1632,
        1728, 1920, 2112, 2304, 2592, 2880, 3072, 3264,
        3456, 3840, 4224, 4608, 5184, 5760, 6144, 6528,
        6912, 7680, 8448, 9216, 10368, 11520, 12288, 528

    ];
    fac = [1, 10, 100, 1000];
	fac1 = Lag2.kr(TChoose.kr(Impulse.kr(~duryGenePreset[\impFreq2]), fac), ~duryGenePreset[\smooth1]);
	fac2 = Lag3.kr(TChoose.kr(Impulse.kr(~duryGenePreset[\impFreq1] * 0.76), fac), ~duryGenePreset[\smooth2]);
	fac3 = Lag2.kr(TChoose.kr(Impulse.kr(~duryGenePreset[\impFreq2] * 0.86), fac), ~duryGenePreset[\smooth3]);

    snd = Mix.fill(8, { arg i;
        var detune;
        var saw;
        var tri;
        var sig;
        detune = LFNoise1.kr(0.003 + Rand(0, 0.9)).range(0.1, 1 + Rand(0, 250.0)) * Rand(0, 2.0) * TChoose.kr(Impulse.kr(0), [1,-1]);
        tri = LFTri.ar(TChoose.kr(Impulse.kr(0), randNum) * ( 1 + ( SinOsc.ar(TChoose.kr(Impulse.kr(0), randNum) / fac1) * TChoose.kr(Impulse.kr(0), randNum) / fac2 )) + detune, Rand(0, 1)/*, 0.25*/);
        saw = RLPF.ar(Saw.ar(TChoose.kr(Impulse.kr(0), randNum) * 0.01 + detune, 0.75), TChoose.kr(Impulse.kr(0), randNum), Rand(0, 2));
        saw = TChoose.kr(Impulse.kr(0), [
            saw,
            saw.fold2( SinOsc.ar(TChoose.kr(Impulse.kr(0), randNum) / fac3).range(0.1, 1) ),
            saw.wrap2( SinOsc.ar(TChoose.kr(Impulse.kr(0), randNum) / fac3).range(0.1, 1) ),
            saw *  SinOsc.ar(TChoose.kr(Impulse.kr(0), randNum) / 2),
			( saw *  SinOsc.ar(TChoose.kr(Impulse.kr(0), randNum) / fac3, [0, 3/pi]).range(1, 20) ).tanh / 2
        ]);
        sig = (tri + saw) * EnvGen.kr(Env.asr(rrand(4,20), 1, 1/repCh));
        sig = Limiter.ar(sig * 1/(i + 0.1));
    });

	snd * ~duryGenePreset[\amp]
});
)

Ndef(\duryGene).clear;

Ndef(\duryGene).play(2);

Ndef(\duryGene).release(8);

Ndef(\duryGene).fadeTime_(8);
