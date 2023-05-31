(
~duryGenePreset = (amp: 0.02, impFreq1: 0.02, impFreq2: 0.04, smooth1: 4, smooth2: 1.7, smooth3: 0.9, seq1: [54, 60, 66, 72, 81, 90, 96, 102,
        108, 128, 132, 144, 162, 180, 192, 204,
        216, 240, 264, 288, 324, 360, 384, 408,
        432, 480, 528, 576, 648, 720, 768, 816,
        864, 960, 1056, 1152, 1296, 1440, 1536, 1632,
        1728, 1920, 2112, 2304, 2592, 2880, 3072, 3264,
        3456, 3840, 4224, 4608, 5184, 5760, 6144, 6528,
        6912, 7680, 8448, 9216, 10368, 11520, 12288, 528], repVal: [4, 8, 16, 24, 32] )
) // default

(
~duryGenePreset = ( 'smooth3': 0.75253055095673, 'impFreq1': 0.056424970626831, 'impFreq2': 0.091279363632202, 'smooth2': 0.99975628852844, 'smooth1': 1.2620580792427, 'amp': 0.01, seq1: [ 20, 38, 66, 68, 78, 86, 86, 90, 96, 105, 110, 113, 118, 124, 126, 135, 135, 142, 148, 153, 157, 159, 163, 164, 169, 185, 221, 245, 255, 257, 262, 307, 316, 318, 322, 331, 333, 338, 340, 345, 354, 369, 379, 384, 390, 400, 401, 403, 407, 431, 443, 475, 499, 499, 509, 511 ], repVal: [ 19, 28, 67, 97, 111 ]);
)

(
~duryGenePreset = ( 'smooth3': 0.73461811542511, 'impFreq1': 0.049386787414551, 'impFreq2': 0.11217704892159, 'smooth2': 1.256218957901, 'smooth1': 3.8995408415794, 'amp': 0.01 , seq1: [ 17, 30, 33, 47, 51, 52, 57, 84, 90, 120, 131, 154, 155, 174, 176, 178, 185, 235, 255, 259, 260, 263, 288, 293, 301, 307, 311, 336, 367, 373, 393, 394, 404, 424, 425, 460, 462, 476, 501, 506 ], repVal: [ 10, 29, 78, 93, 128 ]);
) // s'arrete apres les ringmod aigus

(
~duryGenePreset = ( 'impFreq1': 0.067178201675415, 'smooth1': 0.5241464972496, 'amp': 0.01, 'repVal': [ 10, 19, 40, 89, 98 ], 'seq1': [ 29, 54, 133, 179, 212, 214, 237, 268, 304, 325, 404, 413, 440, 440, 474, 476 ], 'smooth2': 1.9854602098465, 'impFreq2': 0.14566891312599, 'smooth3': 0.75433669686317 ) // superaigu
)

(
~duryGenePreset = ( 'impFreq1': 0.094736270904541, 'smooth1': 1.7536251544952, 'amp': 0.01, 'repVal': [ 48, 84, 94, 111, 115 ], 'seq1': [ 45, 81, 105, 124, 130, 133, 161, 181, 201, 261, 310, 313, 317, 364, 480, 492 ], 'smooth2': 1.7201658368111, 'impFreq2': 0.10614985823631, 'smooth3': 0.67538095712662 )
)

(
~randArr = { arg min = 1, max = 64, size = 64;
	var arr = { rrand(min * 8, max * 8) } ! size;
	arr.sort;
};

~repArr = { arg minRep = 1, maxRep = 8, sizeRep = 5;
	var arrRep = { rrand((minRep * 4) , (maxRep * 16)) } ! sizeRep;
	arrRep.sort;
};


Post << ~duryGenePreset = ( amp: 0.01, impFreq1: rrand(0.02, 0.1), impFreq2: rrand(0.04, 0.15), smooth1: rrand(0.5, 4), smooth2: rrand(0.7, 2), smooth3: rrand(0.65, 0.8), repVal: ~repArr.(sizeRep:5), seq1: ~randArr.(size:rrand(1, 8) * 8)
// rrand
)
)

// ERROR: Message '*' not understood.
// réglé 1504 !!
(
Ndef(\duryGene, {
    var snd, rep, repCh, randNum, fac, fac1, fac2, fac3;

	rep = ~duryGenePreset[\repVal];
	repCh = TChoose.kr(Impulse.kr(~duryGenePreset[\impFreq1]), rep);
	randNum = ~duryGenePreset[\seq1];


    fac = [1, 10, 100, 1000] ;
	fac1 = Lag2.kr(TChoose.kr(Impulse.kr(~duryGenePreset[\impFreq2]), fac), ~duryGenePreset[\smooth1]);
	fac2 = Lag3.kr(TChoose.kr(Impulse.kr(~duryGenePreset[\impFreq1] * 0.76 /** (Ndef.kr(\mod2)* 0.5 + 0.75)*/), fac), ~duryGenePreset[\smooth2]);
	fac3 = Lag2.kr(TChoose.kr(Impulse.kr(~duryGenePreset[\impFreq2] * 0.86 * (Ndef.kr(\mod2).cos)), fac), ~duryGenePreset[\smooth3] );

    snd = Mix.fill(8, { arg i;
        var detune;
        var saw;
        var tri;
        var sig;
		detune = LFNoise1.kr(0.003 + Rand(0, 0.9)).range(0.1, 1 + Rand(0, 250.0)) * Rand(0, 2.0) * TChoose.kr(Impulse.kr(0), [1,-1]);
        tri = LFTri.ar(TChoose.kr(Impulse.kr(0), randNum) * ( 1 + ( SinOsc.ar(TChoose.kr(Impulse.kr(0  ), randNum /* + (Ndef.kr(\mod2).cos)*/) / fac1 ) * TChoose.kr(Impulse.kr(0), randNum) / fac2 )) + detune, Rand(0, 1)/*, 0.25*/);
		saw = RLPF.ar(Saw.ar(TChoose.kr(Impulse.kr(0), randNum) * 0.01 + detune , 0.75), TChoose.kr(Impulse.kr(0), randNum), Rand(0, 2));
        saw = TChoose.kr(Impulse.kr(0), [
            saw,
            saw.fold2( SinOsc.ar(TChoose.kr(Impulse.kr(0), randNum) / fac3).range(0.1, 1) ),
            saw.wrap2( SinOsc.ar(TChoose.kr(Impulse.kr(0), randNum) / fac3).range(0.1, 1) ),
            saw *  SinOsc.ar(TChoose.kr(Impulse.kr(0), randNum) / 2),
			( saw *  SinOsc.ar(TChoose.kr(Impulse.kr(0), randNum) / fac3 , [0, 3/pi]).range(1, 20) ).tanh / 2
        ]);
        sig = (tri + saw) * EnvGen.kr(Env.asr(rrand(4,20), 1, 1/repCh));
        sig = Limiter.ar(sig * 1/(i + 0.1));
    });

	snd = HPF.ar(LPF.ar(snd, 10000), 60);
	snd = Limiter.ar(snd, 0.7, 0.02);

	snd * ~duryGenePreset[\amp];
});
)

Ndef(\duryGene).clear;

Ndef(\duryGene).play(2);

Ndef(\duryGene).release(8);

Ndef(\duryGene).fadeTime_(8);