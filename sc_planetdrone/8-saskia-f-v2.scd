// todo sem6: modulateurs
// 0402: presets, args, valeurs, graphe

Ndef(\sfMod1).fadeTime_(10);

(
~sfMod1Preset =
)

(
~sfMod1Preset =
)

(
~sfMod1Preset = ( 'excitationLfoFreq': 9.6369777321815, 'mulEnd': 0.8469865322113, 'mulSlope': 35.398494470119, 'excitation': 12.794041365385,  'tensionStart': 0.49172254800797, 'lossSlope': 63.966823780537, 'lossStart': 0.70339985133862, 'tensionEnd': 0.54796454906464, 'lossEnd': 0.78162767830026, 'addStart': 1.0754736661911, 'addEnd': 1.1303398609161, 'mulStart': 1.2032529115677, 'addSlope': 8.2082888424397, 'tensionSlope': 86.10612205267 );
)

(
~sfMod1Preset = ( 'excitationLfoFreq': 4.6370942592621, 'mulEnd': 1.3822771310806, 'mulSlope': 87.377484935522, 'excitation': 2.8778329193592,
	'tensionStart': 0.33643479049206, 'lossSlope': 49.668849676847, 'lossStart': 0.93807110734582, 'tensionEnd': 0.45843720436096, 'lossEnd': 0.75090856331253,
	'addStart': 0.9387298822403, 'addEnd': 0.81052476167679, 'mulStart': 0.81965047121048, 'addSlope': 0.87180473804474, 'tensionSlope': 5.8839141070843 );
)

(
~sfMod1Preset = ( 'excitationLfoFreq': 14.383007645607, 'mulEnd': 1.2910871207714, 'mulSlope': 86.448498672247, 'excitation': 1.7291570603848, 'tensionStart': 0.173835927248, 'lossSlope': 90.514159965515, 'lossStart': 0.81568664656901, 'tensionEnd': 0.17909235954285, 'lossEnd': 0.95245907912326, 'addStart': 1.0562909245491, 'addEnd': 0.76043909788132, 'mulStart': 1.1621098518372, 'addSlope': 6.8438391923904, 'tensionSlope': 88.338450974226 );
)

(
~sfMod1Preset = ( 'iphaseSlope': 3.7748604416847, 'widthEnd': 0.49094226360321, 'mulEnd': 0.98911760449409, 'freq': 9.1297081470489, 'widthSlope': 3.6574540603161, 'mulSlope': 7.7921793520451, 'freqLfoRate': 17.669886171818, 'widthStart': 0.41543142795563, 'addStart': 1.5737296938896, 'iphaseStart': 0.56215620040894, 'iphaseEnd': 0.86077988147736, 'addEnd': 2.0769242048264, 'mulStart': 3.0160260498524, 'addSlope': 6.7286503136158 );
)

(
~sfMod1Preset = (excitation: 15, excitationLfoFreq: 3.5, tensionSlope: 100, tensionStart: 0.05, tensionEnd: 0.25, lossSlope: 100, lossStart: 0.7, lossEnd: 0.998, mulSlope: 100, mulStart: 1.25, mulEnd: 1.54, addSlope: 100, addStart: 0.54, addEnd: 1.25);
)

(
~sfMod1Preset = (excitation: rrand(0.25, 15), excitationLfoFreq: rrand(0.5, 20), tensionSlope: rrand(0.05,100), tensionStart: rrand(0.025,0.65), tensionEnd: rrand(0.05,0.65), lossSlope: rrand(0.05,100), lossStart: rrand(0.65, 0.999999), lossEnd: rrand(0.65, 0.999999), mulSlope: rrand(0.05, 100), mulStart: rrand(0.75, 1.25), mulEnd: rrand(0.75, 1.5), addSlope: rrand(0.05, 10), addStart: rrand(0.75, 1.25), addEnd: rrand(0.75, 1.25));
)

(
Ndef(\sfMod1, {
	MembraneCircle.ar(
		LFPulse.ar(~sfMod1Preset[\excitationLfoFreq], 0.0, 0.5, ~sfMod1Preset[\excitation], ~sfMod1Preset[\excitation] / 2),
		Phasor(0.0, ~sfMod1Preset[\tensionSlope], ~sfMod1Preset[\tensionStart], ~sfMod1Preset[\tensionEnd], ~sfMod1Preset[\tensionEnd]) ,
		Phasor.kr(0.0, ~sfMod1Preset[\lossSlope], ~sfMod1Preset[\lossStart], ~sfMod1Preset[\lossEnd], ~sfMod1Preset[\lossEnd]),
		Phasor.kr(0.0, ~sfMod1Preset[\mulSlope], ~sfMod1Preset[\mulStart], ~sfMod1Preset[\mulEnd], ~sfMod1Preset[\mulEnd]),
		Phasor.kr(0.0, ~sfMod1Preset[\addSlope], ~sfMod1Preset[\addStart], ~sfMod1Preset[\addEnd], ~sfMod1Preset[\addEnd])
	)
});
)


Ndef(\sfMod1).clear(0);

Ndef(\sfMod2).fadeTime_(10);

(
~sfMod2Preset = ( 'iphaseSlope': 7.9633863568306, 'widthEnd': 0.81462409496307, 'mulEnd': 3.4237605512142, 'freq': 6.0229078054428,  'widthSlope': 1.1521548509598, 'mulSlope': 5.509928894043, 'freqLfoRate': 0.45727754235268, 'widthStart': 0.34370515346527, 'addStart': 2.626646399498, 'iphaseStart': 0.68495166301727, 'iphaseEnd': 0.76952743530273, 'addEnd': 0.3661857843399, 'mulStart': 1.5865712940693, 'addSlope': 1.891213208437 );
)

(
~sfMod2Preset = ( 'iphaseSlope': 1.2639584541321, 'widthEnd': 0.27785363197327, 'mulEnd': 2.8462258577347, 'freq': 5.9370857000351, 'widthSlope': 4.5600651693344, 'mulSlope': 7.7024128496647, 'freqLfoRate': 0.10407472848892, 'widthStart': 0.82156944274902, 'addStart': 1.5902796387672, 'iphaseStart': 0.51400363445282, 'iphaseEnd': 0.59005534648895, 'addEnd': 1.3522309660912, 'mulStart': 0.69531266689301, 'addSlope': 6.975599527359 );
)

(
~sfMod2Preset = (freqLfoRate: , freq: , iphaseSlope: , iphaseStart: , iphaseEnd: , widthSlope: , widthStart: , widthEnd: , mulSlope: , mulStart: , mulEnd: , addSlope: , addStart: , addEnd: );
)

(
~sfMod2Preset = (freqLfoRate: rrand(0.05, 20), freq: rrand(0.1, 10), iphaseSlope: rrand(4550.5,10000), iphaseStart: rrand(0.0,1), iphaseEnd: rrand(0.0,1), widthSlope: rrand(1000,44100), widthStart: rrand(0.25,0.85), widthEnd: rrand(0.25,0.85), mulSlope: rrand(1000,44110), mulStart: rrand(0.65,3.5), mulEnd: rrand(0.65,3.5), addSlope: rrand(1000,44100), addStart: rrand(0.0,3.5), addEnd: rrand(0.0,3.5));
)

(
Ndef(\sfMod2, {
	VarSaw.kr(
		LFPulse.kr(~sfMod2Preset[\freqLfoRate], 0, 0.3, ~sfMod2Preset[\freq], ~sfMod2Preset[\freq] / 2),
		Phasor.kr(0.0, ~sfMod2Preset[\iphaseSlope], ~sfMod2Preset[\iphaseStart], ~sfMod2Preset[\iphaseEnd], ~sfMod2Preset[\iphaseEnd]),
		Phasor.kr(0.0, ~sfMod2Preset[\widthSlope], ~sfMod2Preset[\widthStart], ~sfMod2Preset[\widthEnd], ~sfMod2Preset[\widthEnd]),
		Phasor.kr(0.0, ~sfMod2Preset[\mulSlope], ~sfMod2Preset[\mulStart], ~sfMod2Preset[\mulEnd], ~sfMod2Preset[\mulEnd]),
		Phasor.kr(0.0, ~sfMod2Preset[\addSlope], ~sfMod2Preset[\addStart], ~sfMod2Preset[\addEnd], ~sfMod2Preset[\addEnd])
	)
});
)

Ndef(\sfMod2).release(3);


Ndef(\sf).fadeTime_(7);

(
~sfPreset = ( 'combDecTime': 0.87780169785023, 'impulseFreq': 0.73980569839478, 'filterFreq': [ 95.257843732834, 1092.9450431466, 2090.6322425604, 3088.3194419742, 4086.0066413879, 58.884483242035], 'impulsePhase': 0.048469887971878, 'verbMixLfoMul': 0.65344390869141, 'verbMixBase': 0.62439071655273, 'verbDamp': 0.49267339795828, 'filterRQ': 0.88423060178757, 'LFNFreq': 2.5169273328781,  'amp': 0.1, 'verbRoom': 0.32687248945236, 'verbMixLfoFreq': 0.52672609329224,'freqShift': [ 8.7432392239571, 18.690464261781, 39.954694750169, 85.411341859684, 182.58423356472 ], 'freqShiftDivArray': [ 1.5284937024117, 1.9985472500324, 2.4686007976532, 2.938654345274, 3.4087078928947 ],  'combDelTime': 0.50482958555222 );
)

(
~sfPreset = ( 'freqShiftDivArray': [ 0.86119362711906, 1.2745613992214, 1.6879291713238, 2.1012969434261, 2.5146647155285 ], 'verbMixLfoMul': 0.5411448597908, 'combDecTime': 1.1646026545763, 'LFNFreq': 7.0833071708679, 'verbMixLfoFreq': 0.2397175717354, 'verbMixBase': 0.27787903666496, 'amp': 0.1, 'verbRoom': 0.49419502139091, 'freqShift': [3.5596313476562, 10.265319110997, 29.603283643398, 85.370400373884, 246.19246120768], 'filterRQ': 0.051, 'combDelTime': 0.1508831679821, 'impulseFreq': 12.026815414429, 'verbDamp': 0.091818819046021, 'impulsePhase': 0.37111513853073, 'filterFreq': [12.699772119522, 1751.8314963579, 3490.9632205963] );
)

(
~sfPreset = ( 'combDecTime': 0.9646079903841, 'impulseFreq': 6.4523363113403, 'filterFreq': [ 86.181420087814, 1107.3432698846, 2128.5051196814, 3149.6669694781, 4170.8288192749, 22.533796322346], 'impulsePhase': 0.31642816901207,   'verbMixLfoMul': 0.74238436222076, 'verbMixBase': 0.51715033769608, 'verbDamp': 0.17097608834505, 'filterRQ': 0.76121451854706, 'LFNFreq': 3.5259000349045,  'amp': 0.1, 'verbRoom': 0.59700789809227, 'verbMixLfoFreq': 0.0518641480207443,'freqShift': [ 6.9184099435806, 13.592920973458, 26.70664243626, 52.47177936302, 103.09373917341 ], 'freqShiftDivArray': [ 1.602519184351, 1.9204673528671, 2.2384155213833, 2.5563636898994, 2.8743118584156 ],  'combDelTime': 0.42152707099915 );
)

(
~sfPreset = ( 'combDecTime': 1.0777770662308, 'impulseFreq': 4.4328689575195, 'filterFreq': [ 31.584572792053, 1247.6471741994, 2463.7097756068, 3679.7723770142, 68.705484890938], 'impulsePhase': 0.71087479233742, 'verbMixLfoMul': 0.62789551019669, 'verbMixBase': 0.16610580205917, 'verbDamp': 0.31428673326969, 'filterRQ': 0.55868738889694, 'LFNFreq': 1.2945363712311,  'amp': 0.1, 'verbRoom': 0.86268511176109, 'freqShift': [ 7.8962504863739, 18.360753335247, 42.693334465457, 99.272659160466, 230.83371163627 ], 'freqShiftDivArray': [ 0.38716548681259, 2.0995561659336, 3.8119468450546, 5.5243375241756, 7.2367282032967 ],  'verbMixLfoFreq': 0.23208624958992, 'combDelTime': 0.44941891551018 );
)

(
~sfPreset = ( 'combDecTime': 1.9902489089966, 'impulseFreq': 19.143934249878, 'filterFreq': [ 58.276983499527, 1201.2578937411, 2344.2388039827, 3487.2197142243, 4630.2006244659, 45.348275995255] , 'impulsePhase': 0.57230685353279, 'verbMixLfoMul': 0.22443192005157, 'verbMixBase': 0.39666988968849, 'verbDamp': 0.11096309125423, 'filterRQ': 0.35826861858368, 'LFNFreq': 0.37116665840149, 'amp': 0.1, 'verbRoom': 0.63712231516838, 'verbMixLfoFreq': 0.48905876994133,'freqShift': [ 6.4414119124413, 12.075962462006, 22.639270918556, 42.442711240315, 79.568981877072 ], 'freqShiftDivArray': [ 2.0387077927589, 3.5951387643814, 5.1515697360039, 6.7080007076263, 8.2644316792488 ],  'combDelTime': 0.30700491309166 );
)


(
~sfPreset = (filterFreq:  [ 23.320729732513, 2358.6312806606, 4693.9418315887, 10.13], impulseFreq: 0.145, impulsePhase: 0.2, filterRQ: 0.1, combDelTime: 0.13, combDecTime: 0.145, LFNFreq: 0.2, verbMixLfoMul: 0.71, verbMixBase: 0.3, verbMixLfoFreq: 0.125, verbRoom: 0.25, verbDamp: 0.0625, freqShift: [ 2.0824889882067, 2.752904138974, 4.5325209494256, 8.2416799829501, 15.863451488017 ], freqShiftDivArray: [ 0.24921731412411, 4.1045254051685, 0.5716877669096, 17.3292299330235, 28.9415821969509 ], amp: 0.1)
)


(
Post << ~sfPreset = (filterFreq: Array.interpolation(rrand(3,6), rrand(10.0,100), rrand(3000.0,5000)) /*rrand(0.1,100)*/, impulseFreq: rrand(0,20.0), impulsePhase: rrand(0,0.81), filterRQ: rrand(0.1,0.1), combDelTime: rrand(0.13,0.56), combDecTime: rrand(0.145,2), LFNFreq: rrand(0.12, 8), verbMixLfoMul: rrand(0.1, 0.8), verbMixLfoFreq: rrand(0.01,1.5), verbMixBase: rrand(0.03,0.64), verbRoom: rrand(0.25, 0.76), verbDamp: rrand(0.0625, 0.76), freqShift: Array.geom(rrand(3,7), rrand(1.5,10), rrand(1.65,3)), freqShiftDivArray: Array.series(5, rrand(0.25,1.25), rrand(0.25,2.1)), amp: 0.1)
)


(
Ndef(\sf, {
	var sig, src, q;

	src = { |int|
		RLPF.ar(
			0.6 ** int * 40 * Impulse.ar(
				~sfPreset[\impulseFreq] , // + Ndef.ar(\sfMod1).abs,  // 2**int/32 + ~sfPreset[\impulseFreq], // Impulse freq
				1 / 2 + ~sfPreset[\impulsePhase] // Impulse phase
			), // input
			(4 ** LFNoise0.kr(
				( 1 / 16 + ~sfPreset[\LFNFreq]) // LFNoise0 freq
			) *  300 + ~sfPreset[\filterFreq]).max(50).min(1400), // freq
			((Ndef.kr(\sfMod2) % -1) * ~sfPreset[\filterRQ]).max(0).min(2) // 5e-3 + (~sfPreset[\filterRQ] * 0.025) // rq
		).sin * 2
	} ! 8;

	q = Mix.ar(src * 0.125);

	2.do {
		q = FreeVerb2.ar(
			q[0], // in1
			q[1], // in2
			(~sfPreset[\verbMixBase] + SinOsc.ar(~sfPreset[\verbMixLfoFreq], 0, ~sfPreset[\verbMixLfoMul], ~sfPreset[\verbMixLfoMul] / 2)).linlin(0,2,0.1,0.9), // mix
			~sfPreset[\verbRoom], // room
			~sfPreset[\verbDamp] // damp
		)
	};

	sig = CombC.ar(
		q,
		maxdelaytime: Line.kr(0.15, 1.5, 15),
		delaytime: ~sfPreset[\combDelTime] ,
		decaytime: ~sfPreset[\combDecTime],
		mul: 1,
		add: 0.0
	);

/*	sig = FreqShift.ar(
		Mix.ar(sig ), // input
		~sfPreset[\freqShift] / ~sfPreset[\freqShiftDivArray]  // (2..6) // freq
	);*/

/*	sig = sig + Ringz.ar(
		sig,
		Line.kr(20 * ~sfPreset[\filterFreq], 80 * ~sfPreset[\filterFreq], 1.5 * ~sfPreset[\verbMixLfoFreq], 0.4) - Ndef.ar(\sfMod2), // ~sfPreset[\filterFreq], //
		 Ndef.kr(\sfMod1) % 0.012,
		0.12
	);*/


/*	2.do {
		sig = FreeVerb2.ar(
			sig[0], // in1
			sig[1], // in2
			(~sfPreset[\verbMixBase] + SinOsc.ar(~sfPreset[\verbMixLfoFreq], 0, ~sfPreset[\verbMixLfoMul], ~sfPreset[\verbMixLfoMul] / 2)).linlin(0,2,0.1,0.9), // mix
			~sfPreset[\verbRoom], // room
			~sfPreset[\verbDamp] // damp
		)
	};*/


	sig = Splay.ar(sig, 1);
	sig = sig * ~sfPreset[\amp] * 0.25;
	sig = Limiter.ar(sig, 0.79, 0.25);

});
)

Ndef(\sf).play(0);

Ndef(\sf).clear(1);
