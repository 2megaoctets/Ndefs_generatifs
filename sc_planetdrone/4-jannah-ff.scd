// 0602 gros chantier. niveaux? filtrer gendy?

// réécrit. à voir ce qu'on peut en faire

Ndef(\jffMod1).fadeTime_(10);

(
~jffModPreset = (freqSlope: 10.5, freqStart: 7.5, freqEnd: 3.73, iphaseSlope: 0, iphaseStart: 0, iphaseEnd: 0, widthSlope: 30.1, widthStart: 0.5, widthEnd: 0.95, addSlope: 440.5, addStart: 13.0, addEnd: 45.0, mulSlope: 50.0, mulStart: 15.0, mulEnd: 25.0);
)

(
~jffModPreset =
)

(
~jffModPreset = (freqSlope: rrand(10.0,50.0), freqStart: rrand(0.1,30), freqEnd: rrand(0.1,30), iphaseSlope: rrand(10.0, 150), iphaseStart: rrand(0.0,2), iphaseEnd: rrand(0.0,2), widthSlope: rrand(10.0,140), widthStart:rrand(0.25,0.85), widthEnd: rrand(0.25,0.85), mulSlope: rrand(10.0,180), mulStart: rrand(1.0,27), mulEnd: rrand(1.0,27), addSlope: rand(10.0,800), addStart: rrand(0.0,27), addEnd: rrand(0.0,27))
)

(
Ndef(\jffMod1, {
	LFPulse.kr(
		Phasor.kr(0.0, ~jffModPreset[\freqSlope], ~jffModPreset[\freqStart], ~jffModPreset[\freqEnd] ),
		Phasor.kr(0.0, ~jffModPreset[\iphaseSlope], ~jffModPreset[\iphaseStart], ~jffModPreset[\iphaseEnd]),
		Phasor.kr(0.0, ~jffModPreset[\widthSlope], ~jffModPreset[\widthStart], ~jffModPreset[\widthEnd]),
		Phasor.kr(0.0, ~jffModPreset[\mulSlope], ~jffModPreset[\mulStart], ~jffModPreset[\mulEnd], ~jffModPreset[\mulEnd]),
		Phasor.kr(0.0, ~jffModPreset[\addSlope], ~jffModPreset[\addStart], ~jffModPreset[\addEnd], ~jffModPreset[\addEnd])
	)
});
)

Ndef(\jffModTest1).clear;

(
Ndef(\jff).fadeTime_(6);
)

(
~jffPreset = (dustFreq1: 975.424, dustFreq2: 208.75, gendyMinFreq: 34, gendyMaxFreq: 75, freqShift: 3.0, modMul: 0.095, modFreq: 0.06289, freqShiftDiv: (2..9), klankFreqArray: [361.58224710896, 94.133613046447, 202.52597215504, 114.47338899415, 158.74569323308], klankRingArray: [ 0.40737057812688, 0.12092396130234, 0.10215338483484, 0.16854044728704, 0.46763194265452 ], amp: 0.1, roomSize: 10, roomSizeFreq: 0.1, revTime: 5.75, revTimeFreq: 0.35, gendyMaxFreqMod: 0.38, gendyMaxFreqModMul: 150, gendyMaxFreqModAdd: 540);
)

(
~jffPreset = ( 'dustFreq1': 3888.80414, 'dustFreq2': 218.926056623, 'gendyMinFreq': 107.23813140392, 'gendyMaxFreq': 214.79018926621,  'freqShift': 0.59581643342972, 'modMul': 0.098067629814147, 'modFreq': 0.10378919567108, 'freqShiftDiv': Array.interpolation(8, rrand(1.5,2.5), rrand(8.5,9.5)), 'klankFreqArray': Array.exprand(5,99.0,353.0), 'klankRingArray': Array.exprand(5,0.1,0.5), 'amp': 0.1, roomSize: 80, roomSizeFreq: 0.6, revTime: 5, revTimeFreq: 0.125, gendyMaxFreqMod: 1.3, gendyMaxFreqModMul: 800, gendyMaxFreqModAdd: 30);
)

(
~jffPreset = ( 'dustFreq2': 372.14712775886, 'freqShift': 7.1379602432251, 'modMul': 0.32501478159428, 'dustFreq1': 8355.7328938293, 'modFreq': 0.51149380917788, 'gendyMinFreq': 17.439665055275, 'klankFreqArray': [ 92.747179654373, 95.644405000175, 209.47210291977, 114.09712080604, 105.36416453291 ], 'amp': 0.1, 'klankRingArray': [ 0.1717717533201, 0.20219206989255, 0.41808473945134, 0.16133095168164, 0.25647323287958 ], 'freqShiftDiv': [ 12.715886043947, 23.203646505308, 6.8149214109522, 9.4111354708808, 4.1480587340084, 16.291327184161, 3.0803754323293, 6.9377304495584 ], 'gendyMaxFreq': 107.11373710632, roomSize: 3, roomSizeFreq: 0.125, revTime: 6, revTimeFreq: 0.33, gendyMaxFreqMod: 2.5, gendyMaxFreqModMul: 300, gendyMaxFreqModAdd: 800 );
)

(
~jffPreset = ( 'dustFreq2': 811.68219948351, 'freqShift': 4.2412576556206, 'modMul': 0.24279423332214, 'dustFreq1': 62553.403978308, 'modFreq': 0.35410562832594, 'gendyMinFreq': 47.936392855644, 'klankFreqArray': [ 184.886968116, 121.74663126024, 181.77663591335, 284.12201503112, 149.75703309 ], 'amp': 0.1, 'klankRingArray': [ 0.3564933558623, 0.10083130793343, 0.19938921965551, 0.23349592701096, 0.20677458420587 ], 'freqShiftDiv': [ 2.4887504113947, 14.321679857018, 8.555256913862, 15.660817241536, 6.8134305625205, 6.6480019198755, 8.5261097190027, 10.73031216043 ], 'gendyMaxFreq': 400.0901782155, roomSize: 6, roomSizeFreq: 0.25, revTime: 3, revTimeFreq: 0.65, gendyMaxFreqMod: 0.01, gendyMaxFreqModMul: 1500, gendyMaxFreqModAdd: 3000 );
)

(
~jffPreset = ('freqShiftDiv': [ 12.279811579661, 20.082879650414, 17.759214353707, 13.214534060279, 4.352185374814, 4.4811572824518, 12.767662052244, 2.3220366461122 ], 'revTimeFreq': 4.4191006064415, 'roomSize': 4.8549469709396, 'gendyMinFreq': 54.242159605026,
  'modFreq': 0.81653506845713, 'klankFreqArray': [ 105.7068680368, 269.00516424963, 277.6734986618, 117.52005704529, 111.44927501412 ], 'gendyMaxFreqMod': 1.1988924117088, 'amp': 0.1, 'dustFreq1': 46630.616593367,
  'gendyMaxFreq': 1317.7432374597, 'modMul': 0.26876306843758, 'klankRingArray': [ 0.13049947402177, 0.21749980891942, 0.11647686021289, 0.24318869845574, 0.22773363712793 ], 'dustFreq2': 684.97200548589, 'roomSizeFreq': 2.5315667510033,
  'gendyMaxFreqModMul': 1300.4104803801, 'freqShift': 6.9002995729446, 'revTime': 2.6227597594261, 'gendyMaxFreqModAdd': 680.617649436 );
)

(
Post << ~jffPreset = (dustFreq1: rrand(0.13, 74250), dustFreq2: rrand(0.145, 850), gendyMinFreq: rrand(0.2, 170), gendyMaxFreq: rrand(0.1, 1750),  freqShift: rrand(0.1, 10.0), modMul: rrand(0.001, 0.38), modFreq: rrand(0.0625, 1.00039), freqShiftDiv: Array.linrand(8,rrand(1.5,2.5), rrand(18.5,29.5)), klankFreqArray: Array.exprand(5, rrand(80,100), rrand(350,450)), klankRingArray: Array.exprand(5, 0.1, 0.5), roomSize: rrand(1.0,10), roomSizeFreq: rrand(0.1,5), revTime: rrand(0.5,10), revTimeFreq: rrand(0.1,5), gendyMaxFreqMod: rrand(0.001,5), gendyMaxFreqModMul: rrand(1.0,2000), gendyMaxFreqModAdd: rrand(1.0,2000), amp: 0.1);
)


// continue à tourner sur 4 canaux

(

Ndef(\jff,{

	var sig, mod;

	mod = SinOsc.ar(
		freq: (~jffPreset[\modFreq]),
		phase: 0.0,
		mul: ~jffPreset[\modMul],
		add: 0.0
	);

	sig = Gendy1.ar(
		/*0:	LINEAR.
		1:	CAUCHY.
		2:	LOGIST.
		3:	HYPERBCOS.
		4:	ARCSINE.
		5:	EXPON.
		6:	SINUS.*/
		ampdist: 3, // 6,
		durdist: Ndef.kr(\jffMod1, 1).abs, // 3,
		adparam: 10, // 3,
		ddparam: Dust.ar(
			density: [
				~jffPreset[\dustFreq1],  ~jffPreset[\dustFreq2] + SinOsc.ar(
					freq: 0.000125,
					phase: 0.0,
					mul: 0.4,
					add: 0.0
				)
			],
			mul: 1
		),
		minfreq: ~jffPreset[\gendyMinFreq],
		maxfreq: abs(~jffPreset[\gendyMaxFreq] + SinOsc.ar(
			freq: ~jffPreset[\gendyMaxFreqMod], // 0.000525,
			phase: 0.0,
			mul: ~jffPreset[\gendyMaxFreqModMul] , // 360, // 3,
			add: ~jffPreset[\gendyMaxFreqModMul] + ~jffPreset[\gendyMaxFreqModAdd] // 130 // 0.0
		) * Ndef.kr(\jffMod1),
		)
	);
	sig = Klank.ar(
		`[
			~jffPreset[\klankFreqArray], // [40, 99, 98, 353, 223],
			nil,
			~jffPreset[\klankRingArray] // [0.2, 0.3, 0.4, 0.1, 0.17] / 50
		] ,
		/*GVerb.ar(
		CombC.ar(sig) * 0.005,
		9,
		9,
		mul:0.005
		)*/
		CombC.ar(
			sig * 0.05,
			0.4 ,
			mod.linlin(-1, 1, 0, 0.4)
		)
	);
	sig= LPF.ar(sig, 7000);

	sig = FreqShift.ar(
		sig,
		~jffPreset[\freqShift] + LFPulse.kr(Ndef.kr(\jffMod1), 0.0, 0.5, 170, 170),
		0.0,
		0.1// 170
	) / (~jffPreset[\freqShiftDiv] + mod);

	sig = GVerb.ar(
		Mix.ar(sig * 0.5),
		// sig,
		roomsize: 10, // LFPulse.kr(~jffPreset[\roomSizeFreq], 0.0, 0.5, ~jffPreset[\roomSize] , ~jffPreset[\roomSize] / 3),  // 10, // 80,
		revtime: 3, // LFPulse.kr(~jffPreset[\revTimeFreq], 0.0, 0.5, ~jffPreset[\revTime], ~jffPreset[\revTime] / 2.5), // 3, // 4.85,
		damping: 0.15, // 0.81,
		inputbw: 0.75, // 0.97,
		spread: 20, // 40,
		drylevel: 1, // 0.5, // -0,
		earlyreflevel: 0.17, // 0,
		taillevel: 0.31, // -11,
		maxroomsize: 100, // 170,
		mul: 0.002513 //0.008
	);

	sig= HPF.ar(sig, 200);

	sig = sig * ~jffPreset[\amp] * 0.01251;

	sig = Limiter.ar(sig, 0.25);

	sig;
});
)

Ndef(\jff).play(0);

Ndef(\jff).clear(1);