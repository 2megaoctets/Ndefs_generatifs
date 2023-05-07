// on le garde?
// pas forcément

(
~lcm2GenePreset = (amp: 0.01, atk: 0.001, rls: 0.2, sustain: 1, rate1: 28, rate2: 26, smooth1: 0.4, smooth2: 0.2);
// default
)

(
~lcm2GenePreset = ( 'rate1': 18.416101551056, 'smooth1': 0.26401857733727, 'atk': 0.0062176464796066, 'amp': 0.01,
  'sustain': 1, 'rls': 0.54321409463882, 'smooth2': 0.29533241391182, 'rate2': 29 );
)

(
~lcm2GenePreset = ( 'rate1': 16.22926671505, 'smooth1': 0.31869168281555, 'atk': 0.080930144071579, 'amp': 0.01,
  'sustain': 1, 'rls': 0.62533481121063, 'smooth2': 0.41831920742989, 'rate2': 24 );
)

(
~lcm2GenePreset = ( 'rate1': 26.347225594521, 'smooth1': 0.29038656949997, 'atk': 0.018025007367134, 'amp': 0.01,
  'sustain': 1, 'rls': 0.24922437667847, 'smooth2': 0.20402170419693, 'rate2': 40 );
)

(
~lcm2GenePreset = ( 'rate1': 15.715190243721, 'smooth1': 0.26995588541031, 'atk': 0.095597262263298, 'amp': 0.01,
  'sustain': 1, 'rls': 0.68452371358871, 'smooth2': 0.27485747337341, 'rate2': 35 )
)

(
~lcm2GenePreset = (amp: 0.01, atk: rrand(0.001, 0.1), rls: rrand(0.2, 0.7), sustain: 1, rate1: rrand(4.6, 28), rate2: rrand(20, 40), smooth1: rrand(0.2, 0.45), smooth2: rrand(0.2, 0.45));
// rrand
)

(
Ndef(\lcm2Gene, {
	var sig, sig1, sig2, mod1, mod2, env;

	env = EnvGen.kr(Env.asr(~lcm2GenePreset[\atk], 1, ~lcm2GenePreset[\rls]), timeScale: ~lcm2GenePreset[\sustain]);

	mod1 = TExpRand.kr(1, 1000, Impulse.kr(~lcm2GenePreset[\rate1]));
	mod1 = Lag2.kr(mod1, ~lcm2GenePreset[\smooth1]);

	mod2 = TExpRand.kr(1, 1000, Dust.kr(~lcm2GenePreset[\rate2]));
	mod2 = Lag2.kr(mod2, ~lcm2GenePreset[\smooth2]);

	sig1 = Saw.ar(mod1).range(
		-100,
		100
	).round(1);

	sig2 = LFCub.ar(mod2, [0, pi/2]).range(
		-100,
		100
	).round(1);

	sig = tanh(lcm(sig1, sig2) * 0.001);

	sig = sig * env;
	sig = (sig * ~lcm2GenePreset[\amp]);
});
)

Ndef(\lcm2Gene).fadeTime_(6);

Ndef(\lcm2Gene).clear;

Ndef(\lcm2Gene).play(2);

Ndef(\lcm2Gene).release(14);
