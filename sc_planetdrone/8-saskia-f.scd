// 0402: presets, args, valeurs, graphe

Ndef(\sf).fadeTime_(7);

(
~sfPreset = ( 'combDecTime': 0.87780169785023, 'impulseFreq': 0.73980569839478, 'filterFreq': 58.884483242035, 'impulsePhase': 0.048469887971878, 'verbMixLfoMul': 0.65344390869141, 'verbMixBase': 0.62439071655273, 'verbDamp': 0.49267339795828, 'filterRQ': 0.88423060178757, 'LFNFreq': 2.5169273328781,  'amp': 0.1, 'verbRoom': 0.32687248945236, 'verbMixLfoFreq': 0.52672609329224, 'combDelTime': 0.50482958555222 );
)

(
~sfPreset = ( 'combDecTime': 0.9646079903841, 'impulseFreq': 6.4523363113403, 'filterFreq': 22.533796322346, 'impulsePhase': 0.31642816901207,   'verbMixLfoMul': 0.74238436222076, 'verbMixBase': 0.51715033769608, 'verbDamp': 0.17097608834505, 'filterRQ': 0.76121451854706, 'LFNFreq': 3.5259000349045,  'amp': 0.1, 'verbRoom': 0.59700789809227, 'verbMixLfoFreq': 0.0518641480207443, 'combDelTime': 0.42152707099915 );
)

(
~sfPreset = ( 'combDecTime': 1.0777770662308, 'impulseFreq': 4.4328689575195, 'filterFreq': 68.705484890938, 'impulsePhase': 0.71087479233742, 'verbMixLfoMul': 0.62789551019669, 'verbMixBase': 0.16610580205917, 'verbDamp': 0.31428673326969, 'filterRQ': 0.55868738889694, 'LFNFreq': 1.2945363712311,  'amp': 0.1, 'verbRoom': 0.86268511176109, 'verbMixLfoFreq': 0.23208624958992, 'combDelTime': 0.44941891551018 );
)

(
~sfPreset = ( 'combDecTime': 1.9902489089966, 'impulseFreq': 19.143934249878, 'filterFreq': 45.348275995255, 'impulsePhase': 0.57230685353279, 'verbMixLfoMul': 0.22443192005157, 'verbMixBase': 0.39666988968849, 'verbDamp': 0.11096309125423, 'filterRQ': 0.35826861858368, 'LFNFreq': 0.37116665840149, 'amp': 0.1, 'verbRoom': 0.63712231516838, 'verbMixLfoFreq': 0.48905876994133, 'combDelTime': 0.30700491309166 );
)


(
~sfPreset = (filterFreq: 10.13, impulseFreq: 0.145, impulsePhase: 0.2, filterRQ: 0.1, combDelTime: 0.13, combDecTime: 0.145, LFNFreq: 0.2, verbMixLfoMul: 0.71, verbMixBase: 0.3, verbMixLfoFreq: 0.125, verbRoom: 0.25, verbDamp: 0.0625, amp: 0.1)
)


(
~sfPreset = (filterFreq: rrand(0.1,100), impulseFreq: rrand(0,20.0), impulsePhase: rrand(0,0.81), filterRQ: rrand(0.1,1), combDelTime: rrand(0.13,0.56), combDecTime: rrand(0.145,2), LFNFreq: rrand(0.12, 8), verbMixLfoMul: rrand(0.1, 0.8), verbMixLfoFreq: rrand(0.01,1.5), verbMixBase: rrand(0.03,0.64), verbRoom: rrand(0.25, 0.76), verbDamp: rrand(0.0625, 0.76), amp: 0.1)
)


(
Ndef(\sf, {
	var sig, src, q;

	src = { |int|
		RLPF.ar(
			0.6 ** int * 40 * Impulse.ar(
				2**int/32 + ~sfPreset[\impulseFreq], // Impulse freq
				1 / 2 + ~sfPreset[\impulsePhase] // Impulse phase
			), // input
			4 ** LFNoise0.kr(
				( 1 / 16 + ~sfPreset[\LFNFreq]) // LFNoise0 freq
			) * 300 + ~sfPreset[\filterFreq], // freq
			5e-3 + (~sfPreset[\filterRQ] * 0.025) // rq
		).sin * 2
	} ! 8;

	q = Splay.ar(src);

	2.do {
		q = FreeVerb2.ar(
			q[0], // in1
			q[1], // in2
			0.11 + ~sfPreset[\verbMixBase] + SinOsc.ar(~sfPreset[\verbMixLfoFreq], 0, ~sfPreset[\verbMixLfoMul]), // mix
			~sfPreset[\verbRoom], // room
			~sfPreset[\verbDamp] // damp
		)
	};

	sig = CombC.ar(
		q,
		maxdelaytime: 1.5,
		delaytime: ~sfPreset[\combDelTime] ,
		decaytime: ~sfPreset[\combDecTime],
		mul: 1,
		add: 0.0
	);

	sig = sig + Ringz.ar(
		sig,
		Line.kr(20 * ~sfPreset[\filterFreq], 80 * ~sfPreset[\filterFreq], 1.5 * ~sfPreset[\verbMixLfoFreq], 0.4),
		0.012,
		0.12
	);

	sig = FreqShift.ar(
		sig, // input
		~sfPreset[\verbDamp] * 6 / (2..6) // freq
	);
	sig = Splay.ar(sig, 1);
	sig = sig * ~sfPreset[\amp] * 0.35;
	sig = Limiter.ar(sig, 0.79, 0.2);

});
)

Ndef(\sf).play(0);

Ndef(\sf).clear(1);