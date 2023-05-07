(
~circSegsPreset = (amp: 0.035, attack: 0.001, release: 1.4, freqs: [50.909089430214, 63.608512393358, 65.056484949596, 67.985432742352, 68.449254734715, 71.154462801524, 75.153162666907, 80.159090540174, 88.650405760834, 89.244467136653, 89.787749814836, 94.804318696787, 97.17438072031, 104.06610340747, 105.58273927332, 105.70848787891, 118.14763403707, 122.30357892333, 125.91379530205, 138.19911121285, 157.10948972852, 194.04854760832, 198.76041832049, 198.847779932, 201.92012940761, 230.06225552661, 237.68115421845, 290.73868194269, 293.38951591388, 336.31430916388, 341.91511960964, 349.4171680391, 393.59846721581, 409.2946639466, 413.5242979, 425.15780461208, 465.90490967238, 492.76629119068, 549.91655801867, 645.03288565102, 700.87369257369, 709.96409772057, 716.96599236393, 843.4571242342, 898.23211278398, 1024.3564550409, 1077.5384208642, 1122.7178267914, 1356.4674355527], phase: Array.rand(49, 0, 2*pi), sustain: 1, curve: 0, envPow: 1, tu: 1, segments: 49, xMajor: 10.0, yMajor: 1.0, rMajor: 100.1, rMinor: 1.1, circlefreq: 0.0001 );
) // default


(
Post << ~circSegsPreset = (amp: 0.035, attack: 0.001, release: 1.4, sustain: 1, curve: 0, envPow: 1, freqs: Array.exprand(rrand(49, 96), 50, 1500).sort, phase: Array.rand(49, 0, 2*pi), tu: rrand(0.5, 2), segments: rrand(25, 49), xMajor: rrand(1.0, 12), yMajor: rrand(0.8, 1), rMajor: 100.1, rMinor: rrand(0.8, 1.5), circlefreq: rrand(0.0001, 0.002) );
) // random

(
~mod1Preset = (dur: 1, width: -0.51, iphase: 0.0) // default
)

(
~mod1Preset = (dur: rrand(0.01, 5.0), width: rrand(0.3, 1.0), iphase: rrand(0.0, pi))
)

(
Ndef(\mod1, {
	LFGauss.ar(
		~mod1Preset[\dur],
		{ Line.kr(rrand(0, ~mod1Preset[\width] / 2), ~mod1Preset[\width], rrand(0.0, 20)) } ! 2,
		~mod1Preset[\iphase]
	)
});
)

Ndef(\mod1).fadeTime_(12);

(
Ndef(\circSegs, {
    var sig, xMinor, yMinor, amps, shuheiKawachi, globalEnv;

    shuheiKawachi = { arg x, y, a, b;
        ((cos(x) * cos(y))
            + (cos((sqrt(a) * x - y) / b)
                * cos((x + (sqrt(a) * y) ) / b))
            + (cos(( sqrt(a) * x + y) /b)
                * cos((x - (sqrt(a) * y*y)) / b)))/3;
    };

	globalEnv = EnvGen.kr(Env.asr(~circSegsPreset[\attack], ~circSegsPreset[\sustain], ~circSegsPreset[\release], ~circSegsPreset[\curve])).pow(~circSegsPreset[\envPow]);

    amps = Array.new;
	xMinor = ~circSegsPreset[\xMajor] + (~circSegsPreset[\rMajor] * SinOsc.ar(~circSegsPreset[\circlefreq]));
	yMinor = ~circSegsPreset[\yMajor] + (~circSegsPreset[\rMajor] * SinOsc.ar(~circSegsPreset[\circlefreq] * Line.kr(Ndef(\mod1).ar, 0 , 9), [pi, pi/2]));
    amps = Array.fill(49,
        {
            arg seg;
			var x = xMinor + (~circSegsPreset[\rMinor] * sin(seg*2*pi/~circSegsPreset[\segments]));
			var y = yMinor + (~circSegsPreset[\rMinor] * cos(seg*2*pi/~circSegsPreset[\segments]));
            var grey = abs(shuheiKawachi.(x, y, 2*pi, 0.5))/12 * Ndef(\mod1).ar;
            grey
        }
    );
    sig = DynKlang.ar(
		`[
			~circSegsPreset[\freqs] * ~circSegsPreset[\tu],
			amps,
			~circSegsPreset[\phase]
		]
	);
	sig = sig * ~circSegsPreset[\amp];
});
)

Ndef(\circSegs).fadeTime_(22);

Ndef(\circSegs).play(2);

Ndef(\circSegs).release(19);

Ndef(\circSegs).clear;