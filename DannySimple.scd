
(
~dannySimplePreset = (amp: 0.1, atk: 0.001, rls: 0.2, sustain: 1, add1: 0, add2: 0, div1: 0.03, div2: 5, rng1Lo: (-3), rng1Hi: 2, rng2Lo: (-2), freq1: [5, 6, 7, 8], freq2: [ 3, 4, 5, 6, 7 ], rng2Hi: 3 )
// default dannySimple
)

(
~dannySimplePreset = (out: 2, amp: 0.4, pan: 0, atk: 0.001, rls: 0.2, sustain: 1, add1: 970, add2: 1030, div1: 30, div2: 30, freq1: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], freq2: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], rng1Lo: (-4), rng1Hi: 4, rng2Lo: (-4), rng2Hi: 4)
// default dannySimple1
)

(
~dannySimplePreset = ( 'rls': 0.2763254404068, 'rng1Hi': 1.9994381666183, 'div2': 6, 'add2': 1.1983327865601,
  'rng2Hi': 1.7402127385139, 'rng2Lo': -2, 'add1': 27, 'div1': 0.035431569814682, 'atk': 0.0008384296298027,
  'rng1Lo': -3, 'amp': 0.1, 'sustain': 1 )
)

(
~dannySimplePreset = (amp: 0.1, atk: rrand(0.0005,0.001), rls: rrand(0.2, 0.4), sustain: 1, add1: rrand(0, 30), add2: rrand(0, 4.0), div1: rrand(0.03, 0.3), div2: rrand(5, 8), rng1Lo: (-3), rng1Hi: rrand(1.0,2), rng2Lo: (-2), rng2Hi: rrand(1.5,3) )
// rrand
)

(
~dannySimplePreset = ( 'rls': 0.39076561927795, 'rng1Hi': 1.0371713638306, 'div2': 7, 'add2': 1.2977290153503,
  'rng2Hi': 2.2433305978775, 'rng2Lo': -2, 'add1': 23, 'div1': 0.14185033679008, 'atk': 0.0007648029923439,
  'rng1Lo': -3, 'amp': 0.1, 'sustain': 1 )
)

(
~dannySimplePreset = ( 'rls': 0.34209322929382, 'rng1Hi': 1.363156080246, 'div2': 7, 'add2': 3.1031847000122,
  'rng2Hi': 2.9404816031456, 'rng2Lo': -2, 'add1': 6, 'div1': 0.23246762037277, 'atk': 0.00096376663446426,
	'rng1Lo': -3, 'amp': 0.1, 'sustain': 1, 'freq1': [0.9, 0.234, 0.9, 1, 0.9, 32, 0.1], 'freq2': [0.2, 6.8, 1.2] )
)

// à adapter

(
~dannySimplePreset = ( 'add2': 1559, 'pan': 0, 'rng1Lo': -2.1913464546204, 'rng2Lo': (-4),
  'amp': 0.51, 'sustain': 1, 'atk': 0.0090056415855885, 'rng1Hi': 1.8232978820801, 'div2': 35,
  'add1': 1087, 'div1': 16, 'out': 2, 'rng2Hi': 4, 'rls': 0.12155921936035 )
)

(
~dannySimplePreset = ( 'add2': 1215, 'pan': 0, 'rng1Lo': -1.9456105232239, 'rng2Lo': (-4),
  'amp': 0.51, 'sustain': 1, 'atk': 0.0064284901106358, 'rng1Hi': 1.6333084106445, 'div2': 20,
  'add1': 1666, 'div1': 16, 'out': 2, 'rng2Hi': 4, 'rls': 0.14686702728271 )
)

(
~dannySimplePreset = (out: 2, amp: 0.51, pan: 0, atk: rrand(0.00051,0.01), rls: rrand(0.1,0.23), sustain: 1, add1: rrand(430, 1970), add2: rrand(230, 1930), div1: rrand(15, 50), div2: rrand(20,35), rng1Lo: rrand(-4, -1.2), rng1Hi: rrand(1.3, 4.5) , rng2Lo: (-4), rng2Hi: 4, freq1: [20], freq2: [300])
)

(
Ndef(\dannySimple, {
	var sig, sig1, sig2, env, thr, frq1, frq2;

	thr = 0.03;
	env = EnvGen.kr(Env.asr(~dannySimplePreset[\atk], 1, ~dannySimplePreset[\rls]), timeScale: ~dannySimplePreset[\sustain]);

	frq1 = ~dannySimplePreset[\freq1];
	frq2 = ~dannySimplePreset[\freq2];

	sig1 = SinOsc.ar(frq1 + ~dannySimplePreset[\add1] / ~dannySimplePreset[\div1]).range(~dannySimplePreset[\rng1Lo], ~dannySimplePreset[\rng1Hi]);
	sig2 = SinOsc.ar(frq2 + ~dannySimplePreset[\add2] / ~dannySimplePreset[\div2]).range(~dannySimplePreset[\rng2Lo], ~dannySimplePreset[\rng2Hi]);

	sig = gcd(sig1.product.round(1), sig2.round(1));
	sig = Limiter.ar(LeakDC.ar(Splay.ar(sig)), thr).clip2(thr);
	sig = (sig * env * ~dannySimplePreset[\amp]);
}).add;
)

Ndef(\dannySimple).play(2);

Ndef(\dannySimple).release(10);

Ndef(\dannySimple).fadeTime_(19);

Ndef(\dannySimple).clear;