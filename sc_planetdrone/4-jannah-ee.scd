// 1002: args, ranges, graphe

Ndef(\jee).fadeTime_(7);


(
~jeePreset = ( 'roomsizeLfo': 1567.1746287107, 'revtimeLfo': 3011.3361779451, 'revtime1': 16.489367008209, 'sineLfo1': 22.75616712451, 'roomsize2': 1.3147722482681, 'freqShift2': 0.24689629077911, 'amp': 0.1, 'freqShiftLfo': 1.4254677966237, 'revtime2': 31.483050823212, 'freqShift1': 16.292575240135, 'freqShiftDivArray': [ 3, 4, 5, 6, 7, 8 ], 'dustDensity': 2.2623041570187, 'roomsize1': 7.0232915878296, 'sineFreq3': 0.5371248960495, 'sineFreq1': 844.11394820333, 'sineFreq2': 8398.6752426863, 'lfNoiseFreq': 4712.0921421051, 'sineLfo2': 24.393057568908 );
)

(
~jeePreset = ( 'roomsizeLfo': 2725.9913392544, 'revtimeLfo': 2155.6273156404, 'revtime1': 20.414831995964, 'sineLfo1': 17.504312296391, 'roomsize2': 1.2494068145752, 'freqShift2': 0.11614249944687, 'amp': 0.1, 'freqShiftLfo': 1.7978907600045, 'revtime2': 19.925497055054, 'freqShift1': 471.61717879772, 'freqShiftDivArray': [ 4, 5, 6, 7 ], 'dustDensity': 3.3773378431797, 'roomsize1': 9.9096703529358, 'sineFreq3': 82.724195623398, 'sineFreq1': 834.11490015745, 'sineFreq2': 4495.3944402218, 'lfNoiseFreq': 3368.9888429642, 'sineLfo2': 24.265935827971 );
)

(
~jeePreset = ( 'roomsizeLfo': 2097.1195244491, 'revtimeLfo': 3387.3422030807, 'revtime1': 8.8182600736618, 'sineLfo1': 18.576055106282, 'roomsize2': 7, 'freqShift2': 0.1094514966011, 'amp': 0.1, 'freqShiftLfo': 1.8863970041275, 'revtime2': 17.328016400337, 'freqShift1': 82.458225131035, 'freqShiftDivArray': [ 4, 5, 6, 7, 8, 9 ], 'dustDensity': 2.0980212688446, 'roomsize1': 13, 'sineFreq3': 464.70298012495, 'sineFreq1': 704.37960881948, 'sineFreq2': 5740.589774704, 'lfNoiseFreq': 4975.5947828293, 'sineLfo2': 14.161561595917 );
)

(
~jeePreset = ( 'roomsizeLfo': 1.2728339493275, 'revtimeLfo': 2.6401835501194, 'revtime1': 39.112383008003, 'sineLfo1': 19.250651101589, 'roomsize2': 9, 'freqShift2': 0.1131484746933, 'amp': 0.1, 'freqShiftLfo': 0.90419288724661, 'revtime2': 5.5594990253448, 'freqShift1': 479.2348241806, 'freqShiftDivArray': [ 3, 4, 5, 6, 7, 8, 9 ], 'dustDensity': 1.4870459139347, 'roomsize1': 11, 'sineFreq3': 481.16895110607, 'sineFreq1': 277.70468940735, 'sineFreq2': 1516.3518985629, 'lfNoiseFreq': 3131.9160795212, 'sineLfo2': 7.237008238554 );
)

(
Post << ~jeePreset = (sineFreq1: rrand(0.13, 1000), sineFreq2: rrand(0.1,10000), lfNoiseFreq: rrand(40.0, 8000), sineFreq3: rrand(0.1, 522),  freqShift1: rrand(1.0, 500), freqShift2: rrand(0.1, 0.25), freqShiftLfo: rrand(0.0625, 2), amp: 0.1, freqShiftDivArray: Array.series(rrand(4,7), rrand(2,4), 1), sineLfo1: rrand(0.001,30), sineLfo2: rrand(0.001,30), dustDensity: rrand(0.75,3.5), roomsize1: rrand(5.0,30), roomsizeLfo: rrand(0.05,3500), roomsize2: rrand(1.0,10), revtimeLfo: rrand(5.5,3500), revtime1: rrand(3.0,50), revtime2: rrand(3.0, 50));
)

(
Ndef(\jee,{
	var sig;
	sig = SinOsc.ar(
		// LFNoise0.ar(10).range(
			~jeePreset[\sineFreq1]
			+ SinOsc.ar(
				freq: ~jeePreset[\sineLfo1] , // 0.03,
				phase: 0.0,
				mul: ~jeePreset[\sineFreq3],
				add: ~jeePreset[\sineFreq3] / 2 // 0.0
			)   ,
			~jeePreset[\sineFreq2]
			+ SinOsc.ar(
				freq: ~jeePreset[\sineLfo2] , // 0.03,
				phase: 0.0,
				mul: ~jeePreset[\sineFreq3],
				add: ~jeePreset[\sineFreq3] / 2 //0.0
		// )
		), // range // freq
		0, // phase
		0.095 // mul
	);
	sig = FreqShift.ar(
		Mix.ar(sig) ,
		~jeePreset[\freqShift1] / (
			~jeePreset[\freqShiftDivArray] +   SinOsc.ar(
				freq: ~jeePreset[\freqShiftLfo],
				phase: 0.0,
				mul: ~jeePreset[\freqShift2],
				add: ~jeePreset[\freqShift2]/ 2 // 0.0
			)
		)
	);
	sig =	Mix.ar(sig)  * Decay.kr(Dust.kr(~jeePreset[\dustDensity])) * LFNoise1.ar(~jeePreset[\lfNoiseFreq]);

	sig =GVerb.ar(
		Mix.ar(sig),
		Phasor.kr(0.0, ~jeePreset[\roomsizeLfo], ~jeePreset[\roomsize1], ~jeePreset[\roomsize2], ~jeePreset[\roomsize2]), // 299, // roomsize
		Phasor.kr(0.0, ~jeePreset[\revtimeLfo], ~jeePreset[\revtime1], ~jeePreset[\revtime2], ~jeePreset[\revtime2]), // 400, // revtime
		0.5, // damping
		0.5, // inputbw
		50, // spread
		0.2, // drylevel
		0.2, // earlyreflevel
		0.9 // taillevel
	);
	// sig = Splay.ar(sig, 1);
	sig = HPF.ar(sig, 140);
	sig = sig * ~jeePreset[\amp] * 0.5;
	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\jee).play(0);

Ndef(\jee).clear(1);