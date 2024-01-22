(
~sccPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
Ndef(\scc, {
	var pd_1a = (~sccPreset[\planetDrone_1a] * 130), pd_2a = (~sccPreset[\planetDrone_2a] * 70), pd_3a = (~sccPreset[\planetDrone_3a] * 111), pd_4a = (~sccPreset[\planetDrone_4a] * 25),
	pd_eff3 = ~sccPreset[\planetDrone_effect_3] * 3, sig;
	sig = GVerb.ar(
		FreeVerb.ar(
			Mix.fill(50,{|i| var a=LFNoise2.kr(i*[0.001,0.01]); a*RLPF.ar(Saw.ar((
				SinOsc.ar(freq: 0.00012, phase: 0.0, mul: pd_2a, add: 0.0)+

				pd_1a+25)+(i*7.4).round(6.73),0.035),(a*2e3).max(100+abs(pd_3a+

				SinOsc.ar(freq: 0.000721, phase: 0.13, mul: pd_4a, add: 0.0))),(i+1)*0.001)}),

			0.01+abs(~sccPreset[\planetDrone_effect_1]),0.015 + abs(~sccPreset[\planetDrone_effect_2]),0.7),

		roomsize: 272, revtime: 3, damping: 0.65, inputbw: 0.35, spread: 14, drylevel: -7 - pd_eff3, earlyreflevel: -1.47, taillevel: 0.56, maxroomsize: 301, mul: 0.85, add: 0);

	sig = sig.sum * ~sccPreset[\amp] * 0.15;

	sig = Limiter.ar(sig, 0.5);


});
)

Ndef(\scc).play(0);

Ndef(\scc).release(1);

Ndef(\scc).clear(1); // fadeTime entre parentheses