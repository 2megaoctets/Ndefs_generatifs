(
~jbPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, hz: 100, amp: 0.35);
)
(
/*SynthDef(\freeVerb2x2, { |out, mix = 0.3, room = 0.11, damp = 0.45, amp = 1.0|
var signal;
signal = In.ar(out, 2);
ReplaceOut.ar(out,
FreeVerb2.ar( // FreeVerb2 - true stereo UGen
signal[0], // Left channel
signal[1], // Right Channel
mix, room, damp, amp
)
); // same params as FreeVerb 1 chn version
}).add;*/

Ndef(\jb,{
	var sig, mix1, mix2, mix3, mix4;
	mix1 = Pulse.ar(
		freq: ~jbPreset[\hz] + 50 + (~jbPreset[\planetDrone_1a] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) + (SinOsc.ar(0.075) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width:  SinOsc.ar(0.005 * (~jbPreset[\planetDrone_1b] * 200)) + 0.25,
		mul: 1.7,
	);
	mix1 = BRF.ar(
		mix1,
		2000 + (~jbPreset[\planetDrone_effect_1] * 200) - (SinOsc.ar(0.15) * 1100),
		0.5);
	mix1 = Pan2.ar(
			mix1,
			SinOsc.ar(0.015) - 0.5);
 	mix2 = Pulse.ar(
		freq: ~jbPreset[\hz] + 123 + (~jbPreset[\planetDrone_2a] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) - (SinOsc.ar(0.05) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width: SinOsc.ar(0.012 * (~jbPreset[\planetDrone_2b] * 100)) + 0.25,
		mul: 1.8,
	);
	mix2 = BRF.ar(
		mix2,
		2000 + (~jbPreset[\planetDrone_effect_1] * 200) - (SinOsc.ar(0.08) * 1100),
		0.5);
	mix2 = Pan2.ar(
			mix2,
			SinOsc.ar(0.055));
	mix3 = Pulse.ar(
		freq: ~jbPreset[\hz] - 27 + (~jbPreset[\planetDrone_3a] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) + (SinOsc.ar(0.075) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width: SinOsc.ar(0.0005 * (~jbPreset[\planetDrone_3b] * 500)) + 0.25,
		mul: 1.9,
	);
	mix3 = BRF.ar(
		mix3,
		2000 + (~jbPreset[\planetDrone_effect_1] * 200) - (SinOsc.ar(0.02) * 1100),
		0.5);
	mix3 = Pan2.ar(
			mix3 ,
			SinOsc.ar(0.15)-0.5);
	mix4 = Pulse.ar(
		freq: ~jbPreset[\hz] - 13 + (~jbPreset[\planetDrone_4a] * 450) + (~jbPreset[\planetDrone_effect_2] * 350) - (SinOsc.ar(0.05) * (~jbPreset[\planetDrone_effect_3] * 8)),
		width: SinOsc.ar(0.0005 * (~jbPreset[\planetDrone_4b] * 50)) + 0.25,
		mul: 2.0,
	);
	mix4 = BRF.ar(
		mix4,
		2000 + (~jbPreset[\planetDrone_effect_1] * 200) -(SinOsc.ar(0.005) * 1100), 0.5);
	mix4 = Pan2.ar(
			mix4 ,
			SinOsc.ar(0.005));

	sig = Mix.ar([
		mix1,
		mix2,
		mix3,
		mix4
	]);

	// spread the signal


	sig = DFM1.ar(sig, 6200, 0.35);

	sig = Greyhole.ar(sig,delayTime:0.25 + abs(~jbPreset[\planetDrone_effect_1]));

	sig = Splay.ar(sig)* ~jbPreset[\amp] * 0.1;
	sig = Limiter.ar(sig, 0.15);

	// make sound!
	// Out.ar(0,sig);
	// s.sync;
	// z = Synth(\freeVerb2x2, [\outbus, 0], addAction:\addToTail);

});
)

Ndef(\jb).play(0);

Ndef(\jb).clear(1);