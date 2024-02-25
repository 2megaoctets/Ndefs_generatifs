// 1802 todo

Ndef(\sx).fadeTime_(10);

(
~sxPreset = ( 'arrayFreqMul': [ 0.34273241758347, 0.969784501791, 0.36168115496635, 0.81332328915596, 0.66578923940659, 0.96081175804138, 0.75869537711143, 0.73131879448891, 0.3793060696125, 0.97166612505913, 0.21979027986526, 0.80227473258972, 0.42167696714401, 0.8603102850914, 0.45219373226166, 0.44613901138306, 0.93506111264229, 0.71677896976471, 0.69705912470818, 0.7467338848114, 0.42338587284088, 0.7882438313961 ], 'bpfFreq2': 78, 'bpfLfoRate2': 0.0299540579319, 'dynKlankArrayLfo': 1720, 'dynKlankArrayIndexes': 4, 'bpfFreq1': 28.684349775314, 'blipFreqFactor': 1.0569263696671, 'blipLfoRate': 0.15805414557457, 'dynKlankArrayLfoRate': 0.089199025630951, 'arrayFreqBase': [ 0.81019313964579, 0.11264938888726, 0.45210612482495, 0.43314989407857, 0.33405257761478, 0.63055521801666, 0.22692215553036, 0.48982470013477, 0.32244052765546, 0.50707060319406, 0.37400369180573, 0.63957329867063, 0.90107616064725, 0.6715324813569, 0.94113157468813, 0.024812896494512, 0.41913135349751, 0.7733209475323, 0.71513183580505, 0.7456965567889 ], 'verb1DampLfoMul': 0.029896499872208, 'amp': 0.1, 'dynKlankArrayMinFreq': 2806, 'blipFreq': [ 18, 17 ], 'collectLfoRate': 0.089075792718817, 'dynKlankArrayMaxFreq': 5107, 'dynKlankMaxRingTime': 0.046021936337153, 'blipLfoMul': 162, 'arrayFreqAdd': 95, 'blipNumHarm': 70, 'collectLfoMaxRate': 0.41925430297852, 'blipFreqAdd': 116, 'verb1DampBase': 0.10955957889557, 'bpfRqFreq': 8.7459008812904, 'bpfLfoRate1': [ 0.0092308963781094, 0.0092445755074566 ] );
)

(
~sxPreset = ( 'arrayFreqMul': [ 0.53085095286369, 0.82453232049942, 0.59785661220551, 0.98317256212235, 0.97343520879745, 0.47287623763084, 0.8980532181263, 0.71290318369865, 0.36665116429329, 0.76987756848335, 0.32302716970444, 0.38437854170799, 0.38691920399666, 0.85053563833237, 0.8884903717041, 0.78779583930969, 0.36235271930695, 0.9718245279789, 0.23624026298523, 0.62910587310791, 0.90266545534134, 0.55334388494492 ], 'bpfFreq2': 159, 'bpfLfoRate2': 0.076012908220291, 'dynKlankArrayLfo': 417, 'dynKlankArrayIndexes': 7, 'bpfFreq1': 7.5175521373749, 'blipFreqFactor': 1.2532007694244, 'blipLfoRate': 0.095235272049904, 'dynKlankArrayLfoRate': 0.014844286441803, 'arrayFreqBase': [ 0.32656363480621, 0.21047944437574, 0.77389180825816, 0.59986377093527, 0.55977857388832, 0.88805457949638, 0.67339670768491, 0.58098882050426, 0.80461410626217, 0.02859177854326, 0.39525926554645, 0.16757245582563, 0.11615405369688, 0.91838162971867, 0.7332391915498, 0.57396655722901, 0.43893456072719, 0.06365978497046, 0.070603497050427, 0.92651132245859 ], 'verb1DampLfoMul': 0.045513212680817, 'amp': 0.1, 'dynKlankArrayMinFreq': 609, 'blipFreq': [ 15, 15 ],
'collectLfoRate': 0.063559805463862, 'dynKlankArrayMaxFreq': 5137, 'dynKlankMaxRingTime': 0.047850199540456, 'blipLfoMul': 116, 'arrayFreqAdd': 83,
  'blipNumHarm': 54, 'collectLfoMaxRate': 0.46441955566406, 'blipFreqAdd': 351, 'verb1DampBase': 0.072185621261597, 'bpfRqFreq': 4.8308609485626,
  'bpfLfoRate1': [ 0.0092326067084856, 0.0092584148960226 ] )
)

(
~sxPreset =
)

(
~sxPreset =
)

(
~sxPreset =
)

(
~sxPreset =
)

(
Post << ~sxPreset = (blipFreq: Array.linrand(2, rrand(8,15), rrand(20,25)), blipFreqAdd: rrand(100,375), blipLfoRate: rrand(0.005, 0.25), bpfFreq1: rrand(1.0,35), arrayFreqAdd: rrand(1,125), bpfRqFreq: rrand(0.1,10), blipLfoMul: rrand(1,350), bpfFreq2: rrand(1,175), dynKlankArrayLfo: rrand(1,2000), verb1DampLfoMul: rrand(0.01, 0.123),  verb1DampBase: rrand(0.01, 0.13), dynKlankArrayIndexes: rrand(4,7), dynKlankArrayMinFreq: rrand(400, 4400), dynKlankArrayMaxFreq: rrand(4600,5200), blipFreqFactor: rrand(1.0,2), amp: 0.1, arrayFreqBase: Array.rand(20, 1/216, 1), arrayFreqMul: Array.rand(22, 0.21, 1), dynKlankArrayLfoRate: rrand(0.01, 0.15), blipNumHarm: rrand(15,85), bpfLfoRate1: Array.linrand(2, 1/108, 1/109), bpfLfoRate2: rrand(0.01, 0.1), collectLfoRate: rrand(1/108, 0.1), dynKlankMaxRingTime: rrand(1/30, 1/20), collectLfoMaxRate: rrand(1/10, 1/2) );
)

(
Ndef(\sx,{
	var sig, sig2;

	sig = BPF.ar(
		WhiteNoise.ar([0.04,0.08]) + Blip.ar(
			~sxPreset[\blipFreq] + ~sxPreset[\blipFreqAdd] + SinOsc.ar(
				freq: ~sxPreset[\blipLfoRate],
				phase: 0.0,
				mul: ~sxPreset[\blipLfoMul],
				add:0.0
			) ,
			~sxPreset[\blipNumHarm],
			mul:0.5
		)
		*  ~sxPreset[\blipFreqFactor], // in
		SinOsc.kr(
			SinOsc.kr(~sxPreset[\bpfLfoRate1]).range(1/106, 1/16)
		).exprange(195, 8000) + ~sxPreset[\bpfFreq1] + SinOsc.ar(
			freq: ~sxPreset[\bpfLfoRate2],
			phase: 0.0,
			mul: ~sxPreset[\bpfFreq2] * 5,
			add: 0.0
		) , // freq
		PMOsc.kr(
			~sxPreset[\bpfRqFreq], // 1/54-~sxPreset[\bpfRqFreq],
			1/216,
			3
		).range(0.1, 2) // rq
	);

	sig = (sig * SinOsc.ar(
		~sxPreset[\arrayFreqBase] + ~sxPreset[\arrayFreqAdd]  ,
		mul: ~sxPreset[\arrayFreqMul]
	).reshape(10,2)
	).sum;

	sig = GVerb.ar(
		sig,
		roomsize:12,
		damping: ~sxPreset[\verb1DampBase] + PMOsc.kr(
			~sxPreset[\dynKlankMaxRingTime] * 0.965,
			1/100,
			~sxPreset[\collectLfoMaxRate] * 10
		).range(0.25, 0.88)  + SinOsc.ar(
			freq: 0.02,
			phase: 0.0,
			mul: ~sxPreset[\verb1DampLfoMul] ,
			add: 0.0
		)  ,
		drylevel:SinOsc.kr(1/125).range(0.25, 0.95)
	);

	sig2 = DynKlank.ar(
		`[
			Array.rand(~sxPreset[\dynKlankArrayIndexes], ~sxPreset[\dynKlankArrayMinFreq], ~sxPreset[\dynKlankArrayMaxFreq] + SinOsc.ar(
				freq: ~sxPreset[\dynKlankArrayLfoRate],
				phase: 0.0,
				mul: ~sxPreset[\dynKlankArrayLfo],
				add: ~sxPreset[\dynKlankArrayLfo] / 2 // 0.0
			)
			).collect({|freq|
				SinOsc.kr(~sxPreset[\collectLfoRate]).range(freq/2,freq)
			}), // freq
			nil, // amp = 1 partout
			Array.rand(~sxPreset[\dynKlankArrayIndexes], ~sxPreset[\collectLfoRate], ~sxPreset[\dynKlankMaxRingTime]).collect({ |freq|
				SinOsc.kr(freq).range(~sxPreset[\collectLfoRate],~sxPreset[\collectLfoMaxRate])
			}) // ring times
		], // specificationsArrayRef
		Limiter.ar(
			Dust.ar(
				SinOsc.kr(1/256).exprange(~sxPreset[\dynKlankMaxRingTime], ~sxPreset[\collectLfoMaxRate] * 10),
				TRand.kr(0.15, 0.25, Dust.kr(~sxPreset[\collectLfoMaxRate] / 3))
			)
			+
			Impulse.ar(
				SinOsc.kr(~sxPreset[\collectLfoRate]).exprange(~sxPreset[\dynKlankMaxRingTime] / 2, 3),
				0,
				TRand.kr(0.6, 0.8, Dust.kr(~sxPreset[\collectLfoMaxRate]))
			)
		) // input
	);
	sig2 = LPF.ar(
		sig2,
		942,
		LFPar.kr(~sxPreset[\dynKlankMaxRingTime]).exprange(0.05, 0.2)
	);

	sig2 = Pan2.ar(
		sig2,
		SinOsc.kr(1/125).range(-012, 0.12)
	);

	sig2 = GVerb.ar(
		sig2,
		roomsize: 12,
		drylevel:0.6
	);

	sig = Limiter.ar(
		sig
		+
		sig2
	);

	sig = Mix.ar(sig);
	sig = HPF.ar(sig, 140);
	sig = sig * ~sxPreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);
});
)


Ndef(\sx).play(0);

Ndef(\sx).clear(1);