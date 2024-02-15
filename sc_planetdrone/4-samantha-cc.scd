// 1402 refactor

Ndef(\scc).fadeTime_(7);

(
~sccPreset = (baseFreq: rrand(0.1,130), lfoFreq: rrand(0.1,70), lpfFreq: rrand(0.1,111), lpfLfo: rrand(0.1,25),  verb1Mix: rrand(0.3,0.99),  verb1Room: rrand(0.01,0.985), verb2Dry: rrand(0.1,3), amp: 0.1);
)

(
~sccPreset = (baseFreq: 0.13, lfoFreq: 0.145, lpfFreq: 0.2, lpfLfo: 0.1,  verb1Mix: 0.3, verb1Room: 0.25, verb2Dry: 0.625, amp: 0.1);
)

(
Ndef(\scc, {
	var sig;

	sig = {
		|int|
		LFNoise2.kr(int*[0.001,0.01]) * RLPF.ar(
			Saw.ar(
				(SinOsc.ar(
					freq: 0.00012,
					phase: Pulse.kr(SinOsc.kr(~sccPreset[\lfoFreq])), // 0.0,
					mul: ~sccPreset[\lfoFreq],
					add: ~sccPreset[\lfoFreq] / 2
				) + ~sccPreset[\baseFreq] + 25) + (int * 7.4).round(6.73), // saw freq
				0.1 // saw mul
			), // rlpf in
			(LFNoise2.kr(int*[0.001,0.01]) * 2e3).max(100 + abs(~sccPreset[\lpfFreq] + SinOsc.ar(
				freq: 0.000721,
				phase: 0.13,
				mul: ~sccPreset[\lpfLfo],
				add: ~sccPreset[\lpfLfo] / 2
			))), // rlpf freq
			(int+1)*0.001 // rlpf rq
		) // rlpf
	};

	sig = Mix.fill(
		50,
		sig
	);

	sig = FreeVerb.ar(
		sig,
		0.01 + ~sccPreset[\verb1Mix] ,
		0.015 + abs(~sccPreset[\verb1Room]),
		0.7
	);
	sig = GVerb.ar(
		sig,
		roomsize: 272,
		revtime: 3,
		damping: 0.65,
		inputbw: 0.35,
		spread: 14,
		drylevel: -7 + ~sccPreset[\verb2Dry],
		earlyreflevel: -1.47,
		taillevel: 0.56,
		maxroomsize: 301
	);

	sig = sig.sum * ~sccPreset[\amp] * 0.15;

	sig = Limiter.ar(sig, 0.5);


});
)

Ndef(\scc).play(0);

Ndef(\scc).release(1);

Ndef(\scc).clear(1); // fadeTime entre parentheses