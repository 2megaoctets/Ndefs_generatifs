(
~tirgoPreset = (amp: 0.021, att: 0.01, rel: 5, blipFreqMod: 2, blipHarmo: 400, brfFreq: 150, brfRq: 2);
// default
)

(
~tirgoPreset = ( 'brfRq': 0.93783041238785, 'att': 0.044967068433762, 'rel': 4, 'brfFreq': 326, 'amp': 0.21, 'blipHarmo': 471, 'blipFreqMod': 3.0236197412014 );
)

(
~tirgoPreset = ( 'brfRq': 1.7299792766571, 'att': 0.020413483381271, 'rel': 3, 'brfFreq': 237,  'amp': 0.21, 'blipHarmo': 201, 'blipFreqMod': 0.87983870506287 );
)

(
~tirgoPreset = ( 'brfRq': 1.8334934711456, 'att': 0.091781142950058, 'rel': 4, 'brfFreq': 298, 'amp': 0.21, 'blipHarmo': 515, 'blipFreqMod': 2.7309162318707);
)

(
~tirgoPreset = (amp: 0.21, att: rrand(0.01, 0.1), rel: rrand(3,5), blipFreqMod: rrand(0.75, 4), blipHarmo: rrand(200, 600), brfFreq: rrand(150, 400), brfRq: rrand(0.9, 2))
// rrand
)

(
Ndef(\tirgo, {
	// amp = 1, att = 0.01, rel = 5, blipFreqMod = 2, blipHarmo = 400, brfFreq = 150, brfRq = 2;
	var sig, noise, thunder, rainStep, env, delayTime;
	// env = Linen.kr(gate, att, 1, rel, doneAction);
	env = EnvGen.ar(Env.asr(~tirgoPreset[\att], 1, ~tirgoPreset[\rel]));
	noise = PinkNoise.ar(1!2);
	rainStep = noise + Blip.ar(noise + ~tirgoPreset[\blipFreqMod], ~tirgoPreset[\blipHarmo]);
	rainStep = BRF.ar(
		rainStep,
		~tirgoPreset[\brfFreq],
		~tirgoPreset[\brfRq],
		0.1
	);
	thunder = LPF.ar(FreeVerb2.ar(*LPF.ar(noise + 0.2 * Dust.ar(0.1), 60) ++ [1, 1, 0.2, 1e4]).tanh, 2000);
	sig = rainStep + thunder;
	sig = sig * env * ~tirgoPreset[\amp];
	// OffsetOut.ar(out, sig);
	// OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan));
});
)

Ndef(\tirgo).fadeTime_(9);

Ndef(\tirgo).play(2);

Ndef(\tirgo).release(22);

