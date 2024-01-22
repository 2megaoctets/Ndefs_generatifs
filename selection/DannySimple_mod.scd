// sept23 : ok + niveaux

Ndef(\dannySimpleMod1).fadeTime_(12);

(
~mod1Preset = (freq: 1, freqTo: 0.1, freqSlope: 0.025, iphase: 0.0, iphaseTo: pi, iphaseSlope: 0.1325, width: 0.75, widthTo: 0.95, widthSlope: 0.045, mul: 0.5, mulTo: 0.95, mulSlope: 0.05);
)

(
~mod1Preset = (freq: 5.3, freqTo: 20.5, freqSlope: 1.02, iphase: 0.0, iphaseTo: 0.1, iphaseSlope: 0.03, width: 0.95, widthTo: 0.75, widthSlope: 0.05, mul: 0.95, mulTo: 0.5, mulSlope: 0.06);
)

(
~mod1Preset = (freq: rrand(0.1, 2), freqTo: rrand(0.1, 20), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.0, 1), iphaseTo: rrand(0.01, 1), iphaseSlope: rrand(0.01, 0.10), width: rrand(0.1, 1), widthTo: rrand(0.1, 1), widthSlope: rrand(0.01, 0.10), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.01, 0.10));
)

(
Ndef(\dannySimpleMod1, {
	LFPulse.kr(
		freq: Phasor.kr(start: ~mod1Preset[\freq], end: ~mod1Preset[\freqTo], rate: ~mod1Preset[\freqSlope], resetPos: ~mod1Preset[\freqTo]),
		iphase: Phasor.kr(start: ~mod1Preset[\iphase], end: ~mod1Preset[\iphaseTo], rate: ~mod1Preset[\iphaseSlope], resetPos: ~mod1Preset[\iphaseTo]),
		width: Phasor.kr(start: ~mod1Preset[\width], end: ~mod1Preset[\widthTo], rate: ~mod1Preset[\widthSlope], resetPos: ~mod1Preset[\widthTo]),
		mul: Phasor.kr(start: ~mod1Preset[\mul], end: ~mod1Preset[\mulTo], rate: ~mod1Preset[\mulSlope], resetPos: ~mod1Preset[\mulTo])
	)
});
)


Ndef(\dannySimpleMod2).fadeTime_(12);

(
~mod2Preset = (freq: 1.5, freqTo: 1.25, freqSlope: 0.05, feedback: 0.0, feedbackTo: pi, feedbackSlope: 0.06, mul: 0.47, mulTo: 0.75, mulSlope: 0.07);
)

(
~mod2Preset = (freq: rrand(1.05, 10), freqTo: rrand(2.01, 10), freqSlope: rrand(0.01, 1.10), feedback: rrand(0, pi), feedbackTo: rrand(0, 2*pi), feedbackSlope: rrand(0.010, 0.10), mul: rrand(0.5, 0.95), mulTo: rrand(0.5, 0.95), mulSlope: rrand(0.01, 0.10));
)

(
Ndef(\dannySimpleMod2, {
	SinOscFB.kr(
		freq: Phasor.kr(~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqSlope]),
		feedback: Phasor.kr(~mod2Preset[\feedback], ~mod2Preset[\feedbackTo], ~mod2Preset[\feedbackSlope]),
		mul: Phasor.kr(~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulSlope])
	)
});
)


Ndef(\dannySimple).fadeTime_(14);


(
~dannySimplePreset = (out: 2, amp: 0.5, pan: 0, atk: 0.001, rls: 0.2, sustain: 1, add1: 970, add2: 1030, div1: 30, div2: 30, freq1: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], freq2: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], rng1Lo: (-4), rng1Hi: 4, rng2Lo: (-4), rng2Hi: 4)
// default dannySimple1
)


(
~dannySimplePreset = ( 'rls': 0.39076561927795, 'rng1Hi': 1.0371713638306, 'div2': 7, 'add2': 1.2977290153503, 'rng2Hi': 2.2433305978775, 'rng2Lo': -2, 'add1': 23, 'div1': 0.14185033679008, 'atk': 0.0007648029923439, 'rng1Lo': -3, 'amp': 0.3, 'sustain': 1, freq1: [  1.4145130242369, 2.0628314936788, 2.9174331124886, 3.8663355995809, 1.1787608535307 ], freq2: [ 0.94968274428925, 1.8993654885785, 3.769053391398, 7.7161722973502, 9.7936033004829, 14.096853235544 ] )
)

(
~dannySimplePreset = ( 'rls': 0.34209322929382, 'rng1Hi': 1.363156080246, 'div2': 7, 'add2': 3.1031847000122, 'rng2Hi': 2.9404816031456, 'rng2Lo': -2, 'add1': 6, 'div1': 0.23246762037277, 'atk': 0.00096376663446426,'rng1Lo': -3, 'amp': 0.3, 'sustain': 1, 'freq1': [70.9, 80.234, 90.9, 1, 150.9, 32, 200.1], 'freq2': [0.2, 6.8, 1.2] )
)

(
~dannySimplePreset = ( 'add2': 1559, 'pan': 0, 'rng1Lo': -2.1913464546204, 'rng2Lo': (-4), 'amp': 0.34, 'sustain': 1, 'atk': 0.0090056415855885, 'rng1Hi': 1.8232978820801, 'div2': 35, 'add1': 1087, 'div1': 16, 'out': 2, 'rng2Hi': 4, 'rls': 0.12155921936035, freq1: [12, 24, 35, 49.5, 65.6, 20] / 10, freq2: [3.2, 6.4, 12.7, 26, 33.7, 47.5] )
)

(
~dannySimplePreset = ( 'add2': 1215, 'rng1Lo': -1.9456105232239, 'rng2Lo': (-4), 'amp': 0.34, 'sustain': 1, 'atk': 0.0064284901106358, 'rng1Hi': 1.6333084106445, 'div2': 20, 'add1': 1666, 'div1': 16,'rng2Hi': 4, 'rls': 0.14686702728271, freq1: [12, 24, 35, 49.5, 65.6, 20] / 15, freq2: [32, 64, 127, 260, 330, 475] / 25 )
)

(
~dannySimplePreset = (amp: 0.26, atk: rrand(0.00051,0.01), rls: rrand(0.1,0.23), sustain: 1, add1: rrand(430, 1970), add2: rrand(230, 1930), div1: rrand(15, 50), div2: rrand(20,35), rng1Lo: rrand(-4, -1.2), rng1Hi: rrand(1.3, 4.5) , rng2Lo: rrand(-12, 24), rng2Hi: rrand(-12, 24), freq1: [12, 24, 35, 49.5, 65.6, 20] / rrand(10.0,30), freq2: [32, 64, 127, 260, 330, 475] / rrand(15, 45))
)


(
Ndef(\dannySimple, {
	var sig, sig1, sig2, env, thr, frq1, frq2;

	thr = 0.03;
	env = EnvGen.kr(Env.asr(~dannySimplePreset[\atk], 1, ~dannySimplePreset[\rls]), timeScale: ~dannySimplePreset[\sustain]);

	frq1 = (Ndef.kr(\dannySimpleMod1) * 0.5 + 0.5) * ~dannySimplePreset[\freq1] ;
	frq2 = ~dannySimplePreset[\freq2] * (Ndef.kr(\dannySimpleMod2) + (Ndef.kr(\dannySimpleMod1))).cos;

	sig1 = SinOsc.ar(Ndef.kr(\dannySimpleMod1) * frq1 + ~dannySimplePreset[\add1] / ~dannySimplePreset[\div1]).range(~dannySimplePreset[\rng1Lo], ~dannySimplePreset[\rng1Hi]);
	sig2 = SinOsc.ar(Ndef.kr(\dannySimpleMod2) * frq2 + ~dannySimplePreset[\add2] / ~dannySimplePreset[\div2]).range(~dannySimplePreset[\rng2Lo], ~dannySimplePreset[\rng2Hi]);

	sig = gcd(sig1.product.round(1), sig2.round(1));
	sig = Limiter.ar(LeakDC.ar(Splay.ar(sig)), thr).clip2(thr);
	sig = (sig * env * ~dannySimplePreset[\amp] * 1.7);
}).add;
)

Ndef(\dannySimple).play(2);

Ndef(\dannySimple).release(7);

Ndef(\dannySimple).clear;