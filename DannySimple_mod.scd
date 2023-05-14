// séparer les ndefs

Ndef(\mod1).fadeTime_(12);

(
~mod1Preset = (freq: 10, freqTo: 0.1, freqSlope: 2.5, iphase: 0.0, iphaseTo: pi, iphaseSlope: 3.25, width: 0.5, widthTo: 0.95, widthSlope: 4.5, mul: 0.5, mulTo: 0.95, mulSlope: 5);
)

(
~mod1Preset = (freq: 0.3, freqTo: 0.5, freqSlope: 2, iphase: 0.0, iphaseTo: 0.1, iphaseSlope: 3, width: 0.95, widthTo: 0.25, widthSlope: 5, mul: 0.95, mulTo: 0.5, mulSlope: 6);
)

(
~mod1Preset = (freq: rrand(0.1, 20), freqTo: rrand(0.1, 20), freqSlope: rrand(0.1, 10), iphase: rrand(0.0, 1), iphaseTo: rrand(0.01, 1), iphaseSlope: rrand(0.1, 10), width: rrand(0.1, 1), widthTo: rrand(0.1, 1), widthSlope: rrand(0.1, 10), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1), mulSlope: rrand(0.1, 10));
)

(
Ndef(\mod1, {
	LFPulse.kr(
		freq: XLine.kr(~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqSlope]),
		iphase: Line.kr(~mod1Preset[\iphase], ~mod1Preset[\iphaseTo], ~mod1Preset[\iphaseSlope]),
		width: Line.kr(~mod1Preset[\width], ~mod1Preset[\widthTo], ~mod1Preset[\widthSlope]),
		mul: Line.kr(~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulSlope])
	)
});
)


Ndef(\mod2).fadeTime_(12);

(
~mod2Preset = (freq: 0.5, freqTo: 0.25, freqSlope: 5, feedback: 0.0, feedbackTo: pi, feedbackSlope: 6, mul: 0.47, mulTo: 0.75, mulSlope: 7);
)

(
~mod2Preset = (freq: rrand(0.05, 10), freqTo: rrand(0.01, 10), freqSlope: rrand(0.1, 10), feedback: rrand(0, pi), feedbackTo: rrand(0, 2*pi), feedbackSlope: rrand(0.10, 10), mul: rrand(0.5, 0.95), mulTo: rrand(0.5, 0.95), mulSlope: rrand(0.1, 10));
)

(
Ndef(\mod2, {
	SinOscFB.kr(
		freq: XLine.kr(~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqSlope]),
		feedback: Line.kr(~mod2Preset[\feedback], ~mod2Preset[\feedbackTo], ~mod2Preset[\feedbackSlope]),
		mul: Line.kr(~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulSlope])
	)
});
)


Ndef(\dannySimple).fadeTime_(19);

(
~dannySimplePreset = (amp: 0.41, atk: 0.001, rls: 0.2, sustain: 1, add1: 0, add2: 0, div1: 0.03, div2: 5, rng1Lo: (-3), rng1Hi: 2, rng2Lo: (-2), freq1: [5, 6, 7, 8], freq2: [ 3, 4, 5, 6, 7 ], rng2Hi: 3 )
// default dannySimple
)

(
~dannySimplePreset = (out: 2, amp: 0.4, pan: 0, atk: 0.001, rls: 0.2, sustain: 1, add1: 970, add2: 1030, div1: 30, div2: 30, freq1: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], freq2: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], rng1Lo: (-4), rng1Hi: 4, rng2Lo: (-4), rng2Hi: 4)
// default dannySimple1
)

(
~dannySimplePreset = ( 'rls': 0.2763254404068, 'rng1Hi': 1.9994381666183, 'div2': 6, 'add2': 1.1983327865601, 'rng2Hi': 1.7402127385139, 'rng2Lo': -2, 'add1': 27, 'div1': 0.035431569814682, 'atk': 0.0008384296298027, 'rng1Lo': -3, 'amp': 0.1, 'sustain': 1 )
)

(
~dannySimplePreset = (amp: 0.1, atk: rrand(0.0005,0.001), rls: rrand(0.2, 0.4), sustain: 1, add1: rrand(0, 30), add2: rrand(0, 4.0), div1: rrand(0.03, 0.3), div2: rrand(5, 8), rng1Lo: (-3), rng1Hi: rrand(1.0,2), rng2Lo: (-2), rng2Hi: rrand(1.5,3) )
// rrand
)

(
~dannySimplePreset = ( 'rls': 0.39076561927795, 'rng1Hi': 1.0371713638306, 'div2': 7, 'add2': 1.2977290153503, 'rng2Hi': 2.2433305978775, 'rng2Lo': -2, 'add1': 23, 'div1': 0.14185033679008, 'atk': 0.0007648029923439, 'rng1Lo': -3, 'amp': 0.1, 'sustain': 1 )
)

(
~dannySimplePreset = ( 'rls': 0.34209322929382, 'rng1Hi': 1.363156080246, 'div2': 7, 'add2': 3.1031847000122, 'rng2Hi': 2.9404816031456, 'rng2Lo': -2, 'add1': 6, 'div1': 0.23246762037277, 'atk': 0.00096376663446426,'rng1Lo': -3, 'amp': 0.1, 'sustain': 1, 'freq1': [0.9, 0.234, 0.9, 1, 0.9, 32, 0.1], 'freq2': [0.2, 6.8, 1.2] )
)

// à adapter

(
~dannySimplePreset = ( 'add2': 1559, 'pan': 0, 'rng1Lo': -2.1913464546204, 'rng2Lo': (-4),
  'amp': 0.51, 'sustain': 1, 'atk': 0.0090056415855885, 'rng1Hi': 1.8232978820801, 'div2': 35,
  'add1': 1087, 'div1': 16, 'out': 2, 'rng2Hi': 4, 'rls': 0.12155921936035 )
)

(
~dannySimplePreset = ( 'add2': 1215, 'rng1Lo': -1.9456105232239, 'rng2Lo': (-4),
  'amp': 0.51, 'sustain': 1, 'atk': 0.0064284901106358, 'rng1Hi': 1.6333084106445, 'div2': 20,
  'add1': 1666, 'div1': 16,'rng2Hi': 4, 'rls': 0.14686702728271 )
)

(
~dannySimplePreset = (amp: 0.51, atk: rrand(0.00051,0.01), rls: rrand(0.1,0.23), sustain: 1, add1: rrand(430, 1970), add2: rrand(230, 1930), div1: rrand(15, 50), div2: rrand(20,35), rng1Lo: rrand(-4, -1.2), rng1Hi: rrand(1.3, 4.5) , rng2Lo: rrand(-12, 24), rng2Hi: rrand(-12, 24), freq1: [12, 24, 35, 49.5, 65.6, 20], freq2: [32, 64, 127, 260, 330, 475])
)

// séparer les ndefs


(
Ndef(\dannySimple, {
	var sig, sig1, sig2, env, thr, frq1, frq2;

	thr = 0.03;
	env = EnvGen.kr(Env.asr(~dannySimplePreset[\atk], 1, ~dannySimplePreset[\rls]), timeScale: ~dannySimplePreset[\sustain]);

	frq1 = Line.kr(~mod2Preset[\feedback], ~mod2Preset[\freqTo], ~mod2Preset[\mulSlope]) + ~dannySimplePreset[\freq1] % Line.kr(~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqSlope]);
	frq2 = Ndef.kr(\mod2) % ~dannySimplePreset[\freq2] / XLine.kr(~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\iphaseSlope]);

	sig1 = SinOsc.ar(Ndef.kr(\mod1) * frq1 + ~dannySimplePreset[\add1] / ~dannySimplePreset[\div1]).range(~dannySimplePreset[\rng1Lo], ~dannySimplePreset[\rng1Hi]);
	sig2 = SinOsc.ar(Ndef.kr(\mod2) * frq2 + ~dannySimplePreset[\add2] / ~dannySimplePreset[\div2]).range(~dannySimplePreset[\rng2Lo], ~dannySimplePreset[\rng2Hi]);

	sig = gcd(sig1.product.round(1), sig2.round(1));
	sig = Limiter.ar(LeakDC.ar(Splay.ar(sig)), thr).clip2(thr);
	sig = (sig * env * ~dannySimplePreset[\amp]);
}).add;
)

Ndef(\dannySimple).play(2);

Ndef(\dannySimple).release(10);

Ndef(\dannySimple).clear;