// 1102 refonte

Ndef(\sa).fadeTime_(7);

(
~saPreset = (sineAdd: rrand(60.0,900.13), freqShift1: rrand(0.1, 2), lpfFreq: rrand(2500, 5500), srcSus: Array.rand(2, rrand(0.1, 0.5), rrand(0.51, 0.99)),  verbMix: rrand(0.1, 0.9), verbRoom: rrand(0.125, 0.9), planetDrone_effect_3: 0.0625, amp: 0.1, freqShiftDivArray: Array.series(rrand(6, 15), rrand(4.0,7), 1));
)

(
Ndef(\sa,{
	// var freq = ~saPreset[\sineAdd] ;
	var rt = 0.75;
	var src = (PinkNoise.ar(1!2) - ~saPreset[\srcSus]) ;
	var sig;


	// sig =
	src = (4.do{src = BRF.ar(
		src,
		rrand(1900,3600).round(2)+(~saPreset[\sineAdd] * LFNoise0.ar(rt.rand!2)),
		0.25
	)
	};
	2.do{src = BRF.ar(
		src,
		rrand(100,600).round(8)+(~saPreset[\sineAdd] * LFNoise1.ar(rt.rand!2)),
		0.14
	)
	};
	4.do{src = BRF.ar(
		src,
		rrand(900,2600).round(16)+(~saPreset[\sineAdd] * LFNoise1.ar(rt.rand!4)),
		0.2
	)
	};
	6.do{src = BRF.ar(
		src,
		rrand(250,7500).round(8)+(~saPreset[\sineAdd] * LFNoise1.ar(rt.rand!6)),
		0.11
	)
	};
	4.do{src = BRF.ar(
		src,
		rrand(2500,5000).round(12)+(~saPreset[\sineAdd] * LFNoise1.ar(rt.rand!2)),
		0.2
	)
	});
	sig = FreqShift.ar(
		Mix.ar(src),
		Duty.ar(
			6,
			0,
			Dwhite(
				~saPreset[\sineAdd] * 12,
				~saPreset[\sineAdd] * 10
				).round(~saPreset[\sineAdd] / 16)
		// ),
		),
		// 0,
		~saPreset[\freqShift1]
	) + src;
	sig = CombC.ar(sig, 1, 1, 7);

	sig = Limiter.ar(
		LPF.ar(
			sig,
			~saPreset[\lpfFreq] + LFNoise1.ar(rt.rand!2,1250)
		),
		0.5
	);
	sig = FreqShift.ar(
		sig,
		abs(~saPreset[\planetDrone_effect_3] * 8) / ~saPreset[\freqShiftDivArray] // (4..16)
	);
	sig = FreeVerb.ar(

		sig,
		mix:  ~saPreset[\verbMix],
		room: ~saPreset[\verbRoom],
		damp:  0.25,
		mul: 1.0,
		add: 0.0);



	/*	sig = FreqShift.ar(
	FreeVerb.ar(
	4.do{src=BRF.ar(src,rrand(1900,3600).round(2)+(freq*LFNoise0.ar(rt.rand!2)),0.25)};
	2.do{src=BRF.ar(src,rrand(100,600).round(8)+(freq*LFNoise1.ar(rt.rand!2)),0.14)};
	4.do{src=BRF.ar(src,rrand(900,2600).round(16)+(freq*LFNoise1.ar(rt.rand!4)),0.2)};
	6.do{src=BRF.ar(src,rrand(250,7500).round(8)+(freq*LFNoise1.ar(rt.rand!6)),0.11)};
	4.do{src=BRF.ar(src,rrand(2500,5000).round(12)+(freq*LFNoise1.ar(rt.rand!2)),0.2)};
	src=FreqShift.ar(src,Duty.ar(6,0,Dwhite(-1*freq*12,freq*10).round(freq/16)),0, ~saPreset[\freqShift1] * 2) + src;
	src=CombC.ar(src,1,1,7);
	Limiter.ar(LPF.ar(src,2500+(~saPreset[\lpfFreq] * 3000)+LFNoise1.ar(rt.rand!2,1250))),
	mix:  abs(~saPreset[\planetDrone_effect_1]),
	room: abs(~saPreset[\planetDrone_effect_2]),
	damp:  0.25,
	mul: 1.0,
	add: 0.0),
	abs(~saPreset[\planetDrone_effect_3] * 8) / (4..16));*/
	sig = Splay.ar(sig);
	sig = Limiter.ar(sig, 0.5);
	sig = sig * ~saPreset[\amp] * 0.5;

});
)

Ndef(\sa).play(0);

Ndef(\sa).clear(1);