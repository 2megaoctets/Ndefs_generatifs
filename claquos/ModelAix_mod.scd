// Moduler Greyhole

Ndef(\mod1).fadeTime_(22);

(
~mod1Preset = (freq: 1, freqTo: 0.2, iphase: 0.0, iphaseTo: 0.15, width: 0.5, widthTo: 0.8, mul: 0.785, mulTo: 1,freqSlope: 0.10, iphaseSlope: 0.05, widthSlope: 0.015, mulSlope: 0.020);
)

(
~mod1Preset = (freq: rrand(0.25, 5), iphase: rrand(0.0, 1), width: rrand(0.45, 0.95), mul: rrand(0.25, 0.95), freqTo: rrand(0.25, 5), iphaseTo: rrand(0.0, 1), widthTo: rrand(0.25, 1), mulTo: rrand(0.5, 1), freqSlope: rrand(0.01, 0.18), iphaseSlope: rrand(0.01, 0.1), widthSlope: rrand(0.03, 0.25), mulSlope: rrand(0.02, 0.14));
)

(
Ndef(\mod1, {
	LFPulse.kr(
		freq: Phasor.kr(start: ~mod1Preset[\freq], end: ~mod1Preset[\freqTo], rate: ~mod1Preset[\freqSlope], resetPos: ~mod1Preset[\freqTo]),
		iphase: Phasor.kr(start: ~mod1Preset[\iphase], end: ~mod1Preset[\iphaseTo], rate: ~mod1Preset[\iphaseSlope], resetPos: ~mod1Preset[\iphaseTo]),
		// iphase: ~mod1Preset[\iphase],
		width: Phasor.kr(start: ~mod1Preset[\width], end: ~mod1Preset[\widthTo], rate: ~mod1Preset[\widthSlope], resetPos: ~mod1Preset[\widthTo]),
		mul: Phasor.kr(start: ~mod1Preset[\mul], end: ~mod1Preset[\mulTo], rate: ~mod1Preset[\mulSlope], resetPos: ~mod1Preset[\mulTo])
	)
});
)

(
Ndef(\mod2).fadeTime_(12);
)

(
~mod2Preset = (freq: rrand(0.25, 5), iphase: rrand(0.0, 1), width: rrand(0.45, 0.95), mul: rrand(0.25, 0.95), freqTo: rrand(0.25, 5), iphaseTo: rrand(0.0, 1), widthTo: rrand(0.25, 1), mulTo: rrand(0.5, 1), freqSlope: rrand(0.01, 0.18), iphaseSlope: rrand(0.01, 0.1), widthSlope: rrand(0.03, 0.25), mulSlope: rrand(0.02, 0.14));
)

(
Ndef(\mod2, {
	VarSaw.kr(
		freq: Phasor.kr(start: ~mod2Preset[\freq], end: ~mod2Preset[\freqTo], rate: ~mod2Preset[\freqSlope], resetPos: ~mod2Preset[\freqTo]) + (Ndef.kr(\mod1) * 3 + 3),
		iphase: Phasor.kr(start: ~mod2Preset[\iphase], end: ~mod2Preset[\iphaseTo], rate: ~mod2Preset[\iphaseSlope], resetPos: ~mod2Preset[\iphaseTo]),
		// iphase: ~mod1Preset[\iphase],
		width: Phasor.kr(start: ~mod2Preset[\width], end: ~mod2Preset[\widthTo], rate: ~mod2Preset[\widthSlope], resetPos: ~mod2Preset[\widthTo]) * (Ndef.kr(\mod3) * 0.5 + 0.5),
		mul: Phasor.kr(start: ~mod2Preset[\mul], end: ~mod2Preset[\mulTo], rate: ~mod2Preset[\mulSlope], resetPos: ~mod2Preset[\mulTo])
	)
})
)

(Ndef(\mod3).fadeTime_(14);)

(
~mod3Preset = (freq: , freqTo: , freqSlope: , phase: , phaseTo: , phaseSlope: , mul: , mulTo: , mulSlope: );
)

(
~mod3Preset = (freq: , freqTo: , freqSlope: , phase: , phaseTo: , phaseSlope: , mul: , mulTo: , mulSlope: );
)

(
~mod3Preset = (freq: rrand(0.1, 3), freqTo: rrand(0.5, 3), freqSlope: rrand(0.01, 0.1), phase: rrand(0.0, 1), phaseTo: rrand(0.0, 1), phaseSlope: rrand(0.01, 0.1), mul: rrand(0.45, 0.85), mulTo: rrand(0.45, 0.85), mulSlope: rrand(0.01, 0.1));
)

(
Ndef(\mod3, {
	SinOsc.kr(
		freq: Phasor.kr(0.0, ~mod3Preset[\freqSlope], ~mod3Preset[\freq], ~mod3Preset[\freqTo], ~mod3Preset[\freqTo]) * (Ndef.kr(\mod2) * 2 + 2),
		phase: Phasor.kr(0.0, ~mod3Preset[\phaseSlope], ~mod3Preset[\phase], ~mod3Preset[\phaseTo], ~mod3Preset[\phaseTo]) * cos(Ndef.kr(\mod1) * 0.25 + 0.5),
		mul: Phasor.kr(0.0, ~mod3Preset[\mulSlope], ~mod3Preset[\mul], ~mod3Preset[\mulTo], ~mod3Preset[\mulTo])
)});
)


Ndef(\modelAix).fadeTime_(19);

(
~modelAixPreset = ( 'atk': 0.0010641890645027, 'pan': 0, 'revtSel': 1, 'out': 2, 'amp': 0.1, 'rls': 0.25551299858093, 'sustain': 1 )
)


(
~modelAixPreset = (out: 2, amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, revtSel: 0)
) // default

(
~modelAixPreset = ( 'atk': 0.00071098121404648, 'revtSel': 1, 'out': 2, 'amp': 0.061, 'rls': 0.16832694339752, 'sustain': 1 )
)

(
~modelAixPreset = ( 'atk': 0.0008523430109024, 'pan': 0, 'revtSel': 0, 'out': 2, 'amp': 0.1, 'rls': 0.16422292542458, 'sustain': 1 )
)

(
~modelAixPreset = (amp: 0.1, pan: 0, atk: rrand(0.0005, 0.12), rls: rrand(0.162, 2.3), sustain: 1, revtSel: rrand(0,1))
) // rrand


(
Ndef(\modelAix, {
	var snd, revt, revt1, revt2, revt3, env;

	env = EnvGen.kr(Env.asr(~modelAixPreset[\atk], 1, ~modelAixPreset[\rls]), timeScale: ~modelAixPreset[\sustain]);

	snd = Pulse.ar(freq: LFNoise0.ar([2,3] + (Ndef.kr(\mod1) * 0.5 + 0.5)).exprange(50,5000), width: Ndef.kr(\mod2) * 0.5 + 0.5);
	snd = snd * LFPulse.ar(
		freq: LFNoise0.ar(1 / cos(Ndef.kr(\mod1) * 0.5 + 0.5)).exprange(0.5,8),
		width: SinOsc.kr(Ndef.kr(\mod3) * 0.5 + 0.5, (Ndef.kr(\mod2) * 0.5 + 0.5), 0.5, 1) * 0.02,
		mul: LFNoise1.ar(3).exprange(0.01,1000));
	snd = HPF.ar(snd, 50);

	// reverb time - various optons:
	revt1 = LFNoise0.ar(1 / cos(Ndef.kr(\mod3) * 0.5 + 0.5)).exprange(0.0001, 0.01) ;
	revt2 = LFTri.ar(0.0165 * (Ndef.kr(\mod1) * 0.5 + 0.5), -1).exprange(1, 0.0001) ;
	revt3 = LFTri.ar(1/10 * tanh(Ndef.kr(\mod2) * 0.5 + 0.5), 1).range(0.01, 0.0001) ;

	revt = Select.ar(~modelAixPreset[\revtSel], [revt1, revt2, revt3, K2A.ar(0.000001)]);
	snd = Greyhole.ar(
		snd + cos(Ndef.kr(\mod2) * 0.5 + 0.5) ,
		revt , // + ((Ndef.kr(\mod1) * 0.25 + 0.25) * 2)
		0.5, //(Ndef.kr(\mod2) * 2 + 2) * revt,
		revt //, // * ((Ndef.kr(\mod1) * 2 + 2) * 3),
		// SinOsc.kr(Ndef.kr(\mod1) + cos(Ndef.kr(\mod3)) , 0.0, 0.25, 0.25) // fb

	);
	snd = Limiter.ar(snd, 0.9);
	snd = (snd * env * ~modelAixPreset[\amp] * 0.34);
	// OffsetOut.ar(out, snd);
	snd = snd.sum;
});
)


Ndef(\modelAix).play(2);

Ndef(\modelAix).release(38);
