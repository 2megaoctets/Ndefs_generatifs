
(
~padovanPreset = (amp: 0.021, tridDur: 1, freq: 165, roomSize: 9)
// default
)

(
~padovanPreset = ( 'roomSize': 3.6036995053291, 'freq': 245.55842895508, 'tridDur': 0.65141571164131, 'amp': 0.021 );
)

(
~padovanPreset = ( 'roomSize': 8.4315677285194, 'freq': 224.36461868286, 'tridDur': 0.86605371832848, 'amp': 0.021 );
)

(
~padovanPreset = ( 'roomSize': 5.2112172245979, 'freq': 299.78749885559, 'tridDur': 0.8859096467495, 'amp': 0.021) ;
)

(
~padovanPreset = (amp: 0.021, tridDur: rrand(0.65, 1), freq: rrand(165, 320.2), roomSize: rrand(0.5, 9))
// rrand
)

// module GVerb !
(
Ndef(\padovan, {
	// amp = 0.21, tridDur = 1, freq = 165, roomSize = 9;

	var sig, env, input, mod, grainTr, sinMod;
	// env = Linen.kr(gate, 0.1, 1, 5, doneAction);
	env = EnvGen.ar(Env.asr(0,1, 1, 5));
	sig = SinOsc;
	mod = Trig.ar(
		Saw.ar(~padovanPreset[\freq]),
		~padovanPreset[\tridDur]
	);
	grainTr = sig.ar(mod * ~padovanPreset[\freq]);
	sinMod = sig.ar(mod);
	sig = GrainIn.ar(1, grainTr, grainTr / 2, sinMod, mod * sinMod, -1, mul: env);
	sig = GVerb.ar(sig, ~padovanPreset[\roomSize], mul: ~padovanPreset[\amp]);
	// GVerb.ar(in, roomsize: 10, revtime: 3, damping: 0.5, inputbw: 0.5, spread: 15, drylevel: 1, earlyreflevel: 0.7, taillevel: 0.5, maxroomsize: 300, mul: 1, add: 0)
	// OffsetOut.ar(out, sig);
	// OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan));
});
)

Ndef(\padovan).fadeTime_(12);

Ndef(\padovan).clear;

Ndef(\padovan).play(2);

Ndef(\padovan).release(12);
