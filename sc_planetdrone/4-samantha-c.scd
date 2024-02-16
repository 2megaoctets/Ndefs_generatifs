//1502 problemes de timing

Ndef(\sc).fadeTime_(7);

(
~scPreset = (baseFreq: 166, collectFreq: 10.8, addFreq: 124, collectLfo: 1,  freqLpf: 1570, modFreq: 0.25, collectClip: 6.25, sigAmp: 0.8, sig1Amp: 0.8, modLfo: rrand(0,0.8), modLfoPhase: rrand(0.025,1.05), modLfoPhasePhase: rrand(1,4), amp: 0.1, freq: 160);
)

(
~scPreset = ( 'addFreq': 53, 'sig1Amp': 0.8, 'collectFreq': 0.7336061000824, 'collectClip': 8, 'sigAmp': 0.8, 'collectLfo': 4.7524049639702, 'amp': 0.1, 'modLfoPhasePhase': 1, 'freq': 2577.4930524826, 'modFreq': 0.14204549789429, 'modLfo': 0.34105682373047, 'baseFreq': 167.05239551067, 'freqLpf': 1120, 'modLfoPhase': 0.60416392982006 );
)


(
~scPreset = ( 'addFreq': 17, 'sig1Amp': 0.8, 'collectFreq': 22.624786889553, 'collectClip': 4, 'sigAmp': 0.8, 'collectLfo': 4.0220547199249, 'amp': 0.1, 'modLfoPhasePhase': 4, 'freq': 174.59510803223, 'modFreq': 0.42823548316956, 'modLfo': 0.091876029968262, 'baseFreq': 14.339697992802, 'freqLpf': 787, 'modLfoPhase': 0.9227662563324 );
)

(
~scPreset = (baseFreq: rrand(0.1,200), collectFreq: rrand(0.1,24), addFreq: rrand(0,200), collectLfo: rrand(0.1,5), freqLpf: rrand(180,1900), modFreq: rrand(0,0.6), collectClip: rrand(0,10), amp: 0.1, sigAmp: 0.8, sig1Amp: 0.8, modLfo: rrand(0,0.8), modLfoPhase: rrand(0.025,1.0), modLfoPhasePhase: rrand(1,4),   freq: rrand(160.0, 5000));
)


(
Ndef(\sc, {
	// var sig;
	// var env4, env5, env6, env7, env8;
	var sig, sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var fac = 1 / SelectX.kr( SinOsc.kr(1/75).range(0,16), [1/3,1,7,4,8,12,128] )/6;


	~scPreset[\freq] = 8.collect(
		{ arg x ;
			~scPreset[\freq] + (EnvGen.ar(Env([42,21,42,30,84],[4,4,7.5,0.5]/fac).circle, 1) + ~scPreset[\addFreq] * x ) + [0, SinOsc.kr(
				x + ~scPreset[\collectFreq] ,
				LFPulse.kr(~scPreset[\collectLfo] / 5, LFPulse.kr(~scPreset[\collectLfo]), 0.5,~scPreset[\collectLfo], ~scPreset[\collectLfo] / 2), // ajout 1602
				mul: EnvGen.kr(Env([1,4,2,3],[6,1,3]).circle, 1) + (~scPreset[\collectLfo] * 2),
				add: EnvGen.kr(Env([1,4,2,3],[6,1,3]).circle, 1) + ~scPreset[\collectLfo]  // ajout 1502
			).range(0, x + ~scPreset[\collectClip] )];
	});
	//~scPreset[\freq].debug.shape.debug("freq");
	sig = SinOsc.ar(
		~scPreset[\freq] + ~scPreset[\baseFreq] / [4,2,1],
		LFPulse.kr(0.25)
	);
	//sig.shape.debug("sig1");
	sig = sig.collect({ arg isig, x;
		isig = SelectX.ar( PMOsc.kr(x + 1/34).range(0,1), [isig, isig.fold2(XLine.kr(1,0.1,20*1))]);
		isig = SelectX.ar( SinOsc.kr(
			1/223 + ~scPreset[\modFreq],
			LFPulse.kr(~scPreset[\modLfo], LFPulse.kr(~scPreset[\modLfoPhase]), 0.5, 3pi / ~scPreset[\modLfoPhasePhase], 3pi / ~scPreset[\modLfoPhasePhase] / 2)
		).range(0,1), [isig, ( isig * SinOsc.kr(1/48 * ( x + 1 )).range(1,83) ).tanh]);
	});

	// sig.shape.debug("sig2");
	sig1 = sig.flop[1];
	sig = sig.flop[0];
	//sig.debug("sig");
	sig1 = Pan2.ar(
		Mix.ar(sig1),
		SinOsc.ar(
			sig1.size.collect({ arg x; SinOsc.kr(x/100+1.32).range(0,8)/4 })
		) * SinOsc.kr(1/48).range(0,1)  ,
		~scPreset[\sig1Amp]
	).mean;

	sig = Pan2.ar(
		Mix.ar(sig),
		SinOsc.ar(
			sig.size.collect({ arg x; SinOsc.kr(x/10+1.1).range(0,8) })) * SinOsc.kr(1/53).range(0,1) ,
		~scPreset[\sigAmp]
	).mean;

	sig = sig + sig1;
	sig = LPF.ar(sig , 1999 + ~scPreset[\freqLpf]);
	sig = sig * ~scPreset[\amp] * 0.35;
	sig = Limiter.ar(sig, 0.5);
});
)

Ndef(\sc).play(0);

Ndef(\sc).clear(1);