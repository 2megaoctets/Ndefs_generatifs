// on le garde

Ndef(\sg).fadeTime_(7);

(
~sgPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)


(
~sgPreset = (planetDrone_1a: rrand(0.1,1.7), planetDrone_2a: rrand(0.1,0.8), planetDrone_3a: rrand(0,0.82), planetDrone_4a: rrand(0.1,1), planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: rrand(0,0.6), planetDrone_effect_2: rrand(0,0.6), planetDrone_effect_3: rrand(0,0.625), amp: 0.15);
)


(
Ndef(\sg, {

		var freqs = Array.series(8, 100, 100) * (1 + ~sgPreset[\planetDrone_effect_3]);
    var trig = Impulse.kr(1) + Impulse.kr(3/8);
		var blip = SinOsc.ar(Demand.kr(trig, 0, Drand(freqs, inf)), mul: abs(0.6 + ~sgPreset[\planetDrone_1b] * 0.5)) * Env.perc(abs(~sgPreset[\planetDrone_3b]), abs(0.4 + (~sgPreset[\planetDrone_2b] * 10))).kr(gate: trig);
    var bass = Pan2.ar(LPF.ar(
        Saw.ar( 50 * {LFNoise1.kr(1).bipolar(1/4).midiratio}!7, mul: LFTri.kr(2).range(0.2, 0.5)),
			SinOsc.kr(1/8).range(375, abs(5 + 1200 + (~sgPreset[\planetDrone_4a] * 1195))),
		).sum * abs(0.4+(~sgPreset[\planetDrone_4b] * 0.8)), 0);
    var sig = 0;
    freqs.do{ |freq|
        var detune = {LFNoise1.kr(1/4).bipolar(1/2).midiratio}!8;
        var voice = PMOsc.ar(
				freq+(~sgPreset[\planetDrone_1a] * 500) * detune,
				LFNoise1.kr(1/7).exprange(4, 500+(~sgPreset[\planetDrone_3a] * 1000)),
            LFNoise1.kr(1/9).range(0, 2)
        ) * 0.1;
        voice = LPF.ar(voice, LFNoise0.kr(LFNoise0.kr(1/4).range(1, 8)).exprange(300, 9000));
			sig = sig + Pan2.ar(voice.sum, SinOsc.kr(1/3), 0.2+(~sgPreset[\planetDrone_2a] * 0.25));
    };
    sig = sig + bass;
		sig = sig + Pan2.ar(CombL.ar(blip, 2, abs(0.5 + (~sgPreset[\planetDrone_effect_2] * 0.5)), 3+(~sgPreset[\planetDrone_effect_1]*16)), LFNoise1.kr(0.85));
    sig = XFade2.ar(sig, FreeVerb.ar(sig));
		sig = sig * ~sgPreset[\amp] * 0.5;
});
)

Ndef(\sg).play(0);

Ndef(\sg).release(1);