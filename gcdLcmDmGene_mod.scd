(
~mod1Preset = (freq: 2.0, freqTo: 2.5, freqSlope: 5.3, iphase: 0.0, iphaseTo: 0.5, iphaseSlope: 10.0, mul: 0.5, mulTo: 1.0, mulSlope: 10.0);
)

(
~mod1Preset = (freq: rrand(0.05, 20), freqTo: rrand(0.5, 20), freqSlope: rrand(0.125, 10), iphase: rrand(0.0, pi), iphaseTo: rrand(0.5, 2*pi), iphaseSlope: rrand(0.01, 15), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1.0), mulSlope: rrand(0.5, 10.0));
)

(
Ndef(\mod1, {
	LFPar.kr(
		XLine.kr(~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqSlope]),
		{Line.kr(~mod1Preset[\iphase], ~mod1Preset[\iphaseTo], ~mod1Preset[\iphaseSlope])}! 2,
		Line.kr(~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulSlope])
	)
});
)

Ndef(\mod1).fadeTime_(12);

(
~mod2Preset = (freq: 2.0, freqTo: 2.5, freqSlope: 5.3, iphase: 0.0, iphaseTo: 0.5, iphaseSlope: 10.0, mul: 0.5, mulTo: 1.0, mulSlope: 10.0);
)

(
~mod2Preset = (freq: rrand(0.05, 20), freqTo: rrand(0.5, 20), freqSlope: rrand(0.125, 10), iphase: rrand(0.0, pi), iphaseTo: rrand(0.5, 2*pi), iphaseSlope: rrand(0.01, 15), mul: rrand(0.5, 1), mulTo: rrand(0.5, 1.0), mulSlope: rrand(0.5, 10.0));
)

(
Ndef(\mod2, {
	LFTri.kr(
		Line.kr(~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqSlope]),
		Line.kr(~mod1Preset[\iphase], ~mod2Preset[\iphaseTo], ~mod2Preset[\iphaseSlope]),
		Line.kr(~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulSlope])
	)
});
)

Ndef(\mod2).fadeTime_(5);

(
~gcdLcmDmGenePreset = (amp: 0.1, spread: 0.5, atk: 0.001, rls: 0.2, sustain: 1, mul1: 1, mul2: 40, mulTanh: 0.0001, modu1: 100, modu2: 300, rate1: 0.6, rate2: 0.06, smooth1: 0.4, smooth2: 0);
// default
)

(
~gcdLcmDmGenePreset = ( 'rate1': 0.66003608703613, 'rate2': 0.08333221912384, 'mulTanh': 0.00078034864664078, 'smooth2': 0, 'amp': 0.1, 'sustain': 1, 'modu1': 80, 'atk': 0.090585555791855, 'mul1': 1.1539040088654, 'modu2': 289, 'mul2': 11, 'smooth1': 0.41847088336945, 'spread': 0.3523308634758, 'rls': 0.27332791090012 );
)

(
~gcdLcmDmGenePreset = ( 'rate1': 0.61352477073669, 'rate2': 0.060503163337708, 'mulTanh': 0.00045209368467331, 'smooth2': 0,
  'amp': 0.1, 'sustain': 1, 'modu1': 88, 'atk': 0.047958358049393, 'mul1': 0.81992778778076,
  'modu2': 234, 'mul2': 34, 'smooth1': 0.48425145149231, 'spread': 0.41102212667465, 'rls': 0.34053097963333 )
)

(
~gcdLcmDmGenePreset = ( 'rate1': 0.48810939788818, 'rate2': 0.070423121452332, 'mulTanh': 0.00071299312114716, 'smooth2': 0, 'amp': 0.1, 'sustain': 1, 'modu1': 68, 'atk': 0.059621265888214, 'mul1': 0.93580513000488, 'modu2': 186, 'mul2': 37, 'smooth1': 0.33775401115417, 'spread': 0.34417432546616, 'rls': 0.23200072050095 )
)

(
~gcdLcmDmGenePreset = (amp: 0.1, spread: rrand(0.25, 0.75), atk: rrand(0.001, 0.1), rls: rrand(0.2, 0.5), sustain: 1, mul1: rrand(0.8, 1.2), mul2: rrand(8, 40), mulTanh: rrand(0.0001, 0.001), modu1: rrand(50,100), modu2: rrand(120, 300), rate1: rrand(0.4, 0.8), rate2: rrand(0.06, 0.1), smooth1: rrand(0.3, 0.5), smooth2: 0);
// rrand
)

(
Ndef(\gcdLcmDmGene, {
	var mod1, mod2, sin1, sin2, sig, sig1, sig2, sig3, env;

	env = EnvGen.kr(Env.asr(~gcdLcmDmGenePreset[\atk], 1, ~gcdLcmDmGenePreset[\rls]), timeScale: ~gcdLcmDmGenePreset[\sustain]);

	mod1 = TRand.kr(1, 300, Impulse.kr(~gcdLcmDmGenePreset[\rate1]));
	mod1 = Lag2.kr(mod1, ~gcdLcmDmGenePreset[\smooth1]);

	mod2 = TRand.kr(1, 300, Dust.kr(~gcdLcmDmGenePreset[\rate2]));
	mod2 = Lag2.kr(mod2, ~gcdLcmDmGenePreset[\smooth2]);

	sin1 = Ndef.kr(\mod1) + SinOsc.ar(mod1, Ndef.kr(\mod1)).range(1,100) * ~gcdLcmDmGenePreset[\mul1] + ~mod1Preset[\mul]  ;
	sin2 = Ndef.ar(\mod2) + SinOsc.ar(mod2, ~mod2Preset[\iphase]) * ~gcdLcmDmGenePreset[\mul2];

	sig1 = gcd(sin1, sin2) % (~gcdLcmDmGenePreset[\modu1] + ~mod1Preset[\freq]);
	sig2 = lcm(sin1, sin2) % (~gcdLcmDmGenePreset[\modu2] + ~mod2Preset[\iphase]);

	sig = tanh([sig1 * sig2, sin1 * sin2] * ~gcdLcmDmGenePreset[\mulTanh]);

	sig = Splay.ar(sig, ~gcdLcmDmGenePreset[\spread] * Ndef.kr(\mod2)) * env;
	sig = (sig * ~gcdLcmDmGenePreset[\amp]);
	// OffsetOut.ar(out, sig);
});
)

Ndef(\gcdLcmDmGene).play(2);

Ndef(\gcdLcmDmGene).fadeTime_(18);

Ndef(\gcdLcmDmGene).release(10);

