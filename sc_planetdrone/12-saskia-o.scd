(
~soPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1, planetDrone_1c: 0.13, planetDrone_2c: 0.145, planetDrone_3c: 0.2, planetDrone_4c: 0.1, planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
Ndef(\so, {
	var sig;
	sig = FreqShift.ar(
		FreeVerb.ar(
			LPF.ar(
				Ringz.ar(
					CoinGate.ar([8,4,8,2]/10 * Line.kr(0,1,30), T2A.ar(Impulse.kr([4 + floor(~soPreset[\planetDrone_1a] * 4),8 + floor(~soPreset[\planetDrone_2a] * 4), 2 + floor(~soPreset[\planetDrone_3a] * 4), 4 + floor(~soPreset[\planetDrone_4a] * 4)]))),
					[45 + abs(~soPreset[\planetDrone_1b] * 25),9e3 + abs(~soPreset[\planetDrone_2b] * 4e3),50 + abs(~soPreset[\planetDrone_3b] * 25), 8e3 + abs(~soPreset[\planetDrone_4b] * 4e3)],
					[6 + abs(~soPreset[\planetDrone_1c] * 25),1 + abs(~soPreset[\planetDrone_2c] * 25), 10 + abs(~soPreset[\planetDrone_3c] * 25), 3 + abs(~soPreset[\planetDrone_4c] * 25)] / 7, [4,2,8,4]).sin.sum.tanh!2

				, freq: 1750)

			, mix: abs(~soPreset[\planetDrone_effect_1]), room: abs(~soPreset[\planetDrone_effect_2]), damp:  0.33, mul: 1.0, add: 0.0)

		, abs(~soPreset[\planetDrone_effect_3]*8)/(4..16));
	sig = Splay.ar(sig, 1);
	sig = sig * ~soPreset[\amp] * 0.25;


	sig = Limiter.ar(sig, 0.5);

});
)


Ndef(\so).play(0);

Ndef(\so).clear(1);