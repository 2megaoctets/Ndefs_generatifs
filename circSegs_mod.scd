(
Ndef(\mod1).fadeTime_(2);
)

(~mod1Preset = (freq: 1, freqTo: 0.25, freqSlope: 0.005, iphase: 0.25, iphaseTo: 0.0, iphaseSlope: 0.005, width: 0.75, widthTo: 0.95, widthSlope: 0.001, mul: 1, mulTo: 0.8, mulSlope: 0.05);)

(~mod1Preset = (freq: 0.25, freqTo: 0.15, freqSlope: 0.01, iphase: 0.0, iphaseTo: 0.0, iphaseSlope: 0.01, width: 0.85, widthTo: 1, widthSlope: 0.005, mul: 0.95, mulTo: 0.995, mulSlope: 0.005);)

(~mod1Preset = (freq: rrand(0.2, 3), freqTo: rrand(0.2, 3), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.0, 1), iphaseTo: rrand(0.0, 1), iphaseSlope: rrand(0.01, 0.1), width: rrand(0.45, 1), widthTo: rrand(0.45, 1), widthSlope: rrand(0.01, 0.1), mul: rrand(0.78, 1), mulTo: rrand(0.75, 1), mulSlope: rrand(0.01, 0.1));)

(
Ndef(\mod1, {
	LFPulse.kr(
		freq: Phasor.kr(0.0, ~mod1Preset[\freqSlope], ~mod1Preset[\freq], ~mod1Preset[\freqTo], ~mod1Preset[\freqTo]) * (Ndef.kr(\mod2).cos),
		iphase: Phasor.kr(0.0, ~mod1Preset[\iphaseSlope], ~mod1Preset[\iphase], ~mod1Preset[\iphaseTo], ~mod1Preset[\iphaseTo]) , // 0..1
		width: Phasor.kr(0.0, ~mod1Preset[\widthSlope], ~mod1Preset[\width], ~mod1Preset[\widthTo], ~mod1Preset[\widthTo]),
		mul: Phasor.kr(0.0, ~mod1Preset[\mulSlope], ~mod1Preset[\mul], ~mod1Preset[\mulTo], ~mod1Preset[\mulTo])  * (Ndef.kr(\mod3).cos)
	);
})
)

(
Ndef(\mod2).fadeTime_(12);
)

(~mod2Preset = (freq: 0.6, freqTo: 2.33, freqSlope: 0.005, phase: 0.0, phaseTo: 0.15, phaseSlope: 0.01, mul: 0.85, mulTo: 0.95, mulSlope: 0.05);)

(~mod2Preset = (freq: 0.1, freqTo: 0.6, freqSlope: 0.05, phase: 0.15, phaseTo: 0.0, phaseSlope: 0.05, mul: 0.9, mulTo: 0.8, mulSlope: 0.01);)

(~mod2Preset = (freq: 0.1, freqTo: 0.55, freqSlope: 0.05, phase: 0.0, phaseTo: 0.001, phaseSlope: 0.0005, mul: 0.95, mulTo: 1, mulSlope: 0.001);)

(~mod2Preset = (freq: rrand(0.2, 3), freqTo: rrand(0.2, 2), freqSlope: rrand(0.01, 0.1), phase: rrand(0, pi), phaseTo: rrand(0, pi), phaseSlope: rrand(0.01, 0.1), mul: rrand(0.65, 0.95), mulTo: rrand(0.65, 0.95), mulSlope: rrand(0.01, 0.1));)

(
Ndef(\mod2, {
	SinOsc.kr(
		freq: Phasor.kr(0.0, ~mod2Preset[\freqSlope], ~mod2Preset[\freq], ~mod2Preset[\freqTo], ~mod2Preset[\freqTo]) , /*/  (Ndef(\mod1)).cos */
		phase: Phasor.kr(0.0, ~mod2Preset[\phaseSlope], ~mod2Preset[\phase], ~mod2Preset[\phaseTo], ~mod2Preset[\phaseTo]), // radians, 0..8pi
		mul: Phasor.kr(0.0, ~mod2Preset[\mulSlope], ~mod2Preset[\mul], ~mod2Preset[\mulTo], ~mod2Preset[\mulTo]) * (Ndef.kr(\mod3) * 0.25 + 0.75)
	)
})
)

(Ndef(\mod3).fadeTime_(9);)

(
~mod3Preset = ( 'mul': 0.91234159946442, 'freqSlope': 0.018481177091599, 'freqTo': 2.2791907787323, 'iphase': 0.31240141391754, 'iphaseTo': 0.62686514854431, 'freq': 0.41647090911865, 'iphaseSlope': 0.015020462274551, 'mulTo': 0.98722139000893, 'mulSlope': 0.013618535995483 )
)

(~mod3Preset = (freq: rrand(0.2, 3), freqTo: rrand(0.2, 3), freqSlope: rrand(0.01, 0.1), iphase: rrand(0.0, 1), iphaseTo: rrand(0.0, 1), iphaseSlope: rrand(0.01, 0.1),  mul: rrand(0.78, 1), mulTo: rrand(0.75, 1), mulSlope: rrand(0.01, 0.1));)

(
Ndef(\mod3, {
	LFTri.kr(
		freq: Phasor.kr(0.0, ~mod3Preset[\freqSlope], ~mod3Preset[\freq], ~mod3Preset[\freqTo], ~mod3Preset[\freqTo]) * (Ndef.kr(\mod1).cos),
		iphase: Phasor.kr(0.0, ~mod3Preset[\iphaseSlope], ~mod3Preset[\iphase], ~mod3Preset[\iphaseTo], ~mod3Preset[\iphaseTo]) , // 0..1
		mul: Phasor.kr(0.0, ~mod3Preset[\mulSlope], ~mod3Preset[\mul], ~mod3Preset[\mulTo], ~mod3Preset[\mulTo])  * (Ndef.kr(\mod2).cos)
	);
})
)

(
~circSegsPreset = (amp: 0.085, attack: 0.001, release: 1.4, freqs: [50.909089430214, 63.608512393358, 65.056484949596, 67.985432742352, 68.449254734715, 71.154462801524, 75.153162666907, 80.159090540174, 88.650405760834, 89.244467136653, 89.787749814836, 94.804318696787, 97.17438072031, 104.06610340747, 105.58273927332, 105.70848787891, 118.14763403707, 122.30357892333, 125.91379530205, 138.19911121285, 157.10948972852, 194.04854760832, 198.76041832049, 198.847779932, 201.92012940761, 230.06225552661, 237.68115421845, 290.73868194269, 293.38951591388, 336.31430916388, 341.91511960964, 349.4171680391, 393.59846721581, 409.2946639466, 413.5242979, 425.15780461208, 465.90490967238, 492.76629119068, 549.91655801867, 645.03288565102, 700.87369257369, 709.96409772057, 716.96599236393, 843.4571242342, 898.23211278398, 1024.3564550409, 1077.5384208642, 1122.7178267914, 1356.4674355527], phase: Array.rand(49, 0, 2*pi), sustain: 1, curve: 0, envPow: 1, tu: 1, segments: 49, xMajor: 10.0, yMajor: 1.0, rMajor: 100.1, rMinor: 1.1, circlefreq: 0.0001 );
) // default

(
// si tidal joue, max 13
~arraySize = rrand(8, 13);
Post << ~circSegsPreset = (amp: 0.085, attack: 0.001, release: 1.4, sustain: 1, curve: 0, envPow: 1, freqs: Array.exprand(~arraySize, 50, 1500).sort, phase: Array.rand(~arraySize, 0, 2*pi), tu: rrand(0.5, 2), segments: rrand(25, 49), xMajor: rrand(1.0, 12), yMajor: rrand(0.8, 1), rMajor: (rrand(1,12) * 10 + rrand(0.0, 1)), rMinor: rrand(0.8, 1.5), circlefreq: rrand(0.0001, 0.002) );
) // random

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
	xMinor = ~circSegsPreset[\xMajor] + (~circSegsPreset[\rMajor]  + Ndef.kr(\mod1) * SinOsc.ar(~circSegsPreset[\circlefreq] * (Ndef.kr(\mod1) * 2 + 2)));
	yMinor = ~circSegsPreset[\yMajor] + (~circSegsPreset[\rMajor] * SinOsc.ar(~circSegsPreset[\circlefreq]  * (Ndef.kr(\mod2) * 0.5 + 0.75), [pi, pi/2]));
    amps = Array.fill(~arraySize,
        {
            arg seg;
			var x = xMinor   + (~circSegsPreset[\rMinor] * sin(seg*2*pi/~circSegsPreset[\segments]));
			var y = yMinor + (~circSegsPreset[\rMinor] * cos(seg*2*pi/~circSegsPreset[\segments]));
            var grey = abs(shuheiKawachi.(x, y, 2*pi , 0.5))/12;
            grey
        }
    );
    sig = DynKlang.ar(
		`[
			~circSegsPreset[\freqs] * ~circSegsPreset[\tu],
			amps,
			~circSegsPreset[\phase] * cos(Ndef.kr(\mod3))
		]
	);
	sig = sig * ~circSegsPreset[\amp];
	sig = Limiter.ar(sig, 0.7);
});
)

Ndef(\circSegs).fadeTime_(12);

Ndef(\circSegs).play(2);

Ndef(\circSegs).release(10);

Ndef(\circSegs).clear;