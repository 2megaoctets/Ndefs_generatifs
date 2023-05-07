(
~runglerPreset = (amp: 0.2, spread: 0.3, attack: 0.001, release: 1.4, sustain: 1, curve: (-4), envPow: 1, lfoTrigRate: 0.4, tu: 24, ffreq: 24, gate: 1, doneAction: 2);
// default
)

(
~runglerPreset = ( 'sustain': 1, 'spread': 0.024839186668396, 'release': 1.9842470645905, 'lfoTrigRate': 0.25718367099762,
  'envPow': 1.0567637443542, 'amp': 0.2, 'ffreq': 334.63054275513, 'curve': -2, 'tu': 7.5839493274689,
  'attack': 0.050888548016548 );
)

(
~runglerPreset = ( 'sustain': 1, 'spread': 0.28134504079819, 'release': 9.4825898170471, 'lfoTrigRate': 0.50979968309402,
  'envPow': 0.98303428888321, 'amp': 0.2, 'ffreq': 24.855098724365, 'curve': -4, 'tu': 15.518655776978,
  'attack': 0.01711200273037 );
)

(
~runglerPreset = ( 'sustain': 1, 'spread': 0.19752838850021, 'release': 1.5388622999191, 'lfoTrigRate': 0.72720127105713,
  'envPow': 0.84595999717712, 'amp': 0.2, 'ffreq': 210.51501846313, 'curve': -4, 'tu': 13.242499351501,
  'attack': 0.083144748568535 );
)

(
~runglerPreset = (amp: 0.2, spread: rrand(0.01, 0.5), attack: rrand(0.001, 0.1), release: rrand(1.4, 10), sustain: 1, curve: rrand(-4, 2), envPow: rrand(0.6, 1.1), lfoTrigRate: rrand(0.1, 0.8), tu: rrand(4.0, 42), ffreq: rrand(24.0, 440));
// rrand
)


(
Ndef(\rungler, {
	// arg amp = 0.2, spread = 0.3, attack = 0.001, release = 1.4, sustain = 1, curve = (-4), envPow = 1, lfoTrigRate = 0.4, tu = 24, ffreq = 24, gate = 1, doneAction = 2;
    var rungler, lfo, snd, runglerOut, globalEnv;

	// globalEnv = EnvGen.ar(Env.asr(~runglerPreset[\attack], ~runglerPreset[\sustain], ~runglerPreset[\release], ~runglerPreset[\curve]), gate, doneAction: doneAction).pow(envPow);

	globalEnv = EnvGen.ar(Env.asr(~runglerPreset[\attack], ~runglerPreset[\sustain], ~runglerPreset[\release], ~runglerPreset[\curve])).pow(~runglerPreset[\envPow]);

    lfo = {
        var trigger;
		trigger = Dust.ar(~runglerPreset[\lfoTrigRate]);
        Select.ar(ToggleFF.ar(trigger), [
            LFNoise2.ar(TExpRand.ar(0.5, 10, trigger)),
            TRand.ar(-1, 1, trigger),
        ]);
    };

    rungler = { |dataSignal, clockSignal|
        var numBits, bits, bit, out, doDAC;
        doDAC = { |bits|
            var result;
            result = bits[0] + (bits[1] * 2) + (bits[2] * 4);
            result = result / 7;
            result = (result * 2) - 1;
            result;
        };
        bit = dataSignal > 0;
        numBits = 8;
        bits = [];
        numBits.do {
            bit = Latch.ar(bit, clockSignal);
            bits = bits.add(bit);
            bit = Delay1.ar(bit);
        };
        (
            out: doDAC.(bits[numBits - 3..numBits - 1]),
            outReverse: doDAC.(bits[numBits - 2..numBits - 4]),
        );
    };
    snd = LocalIn.ar(2);
    runglerOut = rungler.(snd[0], snd[1]);
    snd = [runglerOut[\out], runglerOut[\outReverse]];
	snd = LFTri.ar(({ lfo.() } ! 2).linexp(-1, 1, [10, 1], 8000) * (snd * ~runglerPreset[\tu]).midiratio);
    LocalOut.ar(LeakDC.ar(Sanitize.ar(snd)));
    snd = (snd[0] > snd[1]) - 0.5;
	snd = MoogFF.ar(snd, ({ lfo.() } ! 2).linexp(-1, 1, 100, 8000) * (runglerOut[\out] * ~runglerPreset[\ffreq]).midiratio, 3);
	snd = Splay.ar(snd, ~runglerPreset[\spread]);
    snd = snd * globalEnv * -10.dbamp;
	// OffsetOut.ar(out, snd * amp);
	snd = snd * ~runglerPreset[\amp];
});
)

Ndef(\rungler).fadeTime_(16);

Ndef(\rungler).play(2);

Ndef(\rungler).release(12);
