(
~stPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
 Ndef(\st,{
	var sig;

     a=Saw;

     sig = FreqShift.ar(
		FreeVerb.ar(
			GVerb.ar(
				Splay.ar(
					BBandPass.ar(
						a.ar("8234986".ascii),a.ar((2 + (~stPreset[\planetDrone_4a] * 45)) / "slow".ascii) * 1000 + (800 + (~stPreset[\planetDrone_1a] * 475)),a.ar((8.6 +(~stPreset[\planetDrone_3a] * 30))/"c7ding".ascii)+(0.0162+abs(~stPreset[\planetDrone_2a] * 0.75)))/1.75)),

			0.1 + ~stPreset[\planetDrone_effect_1], 0.1 + ~stPreset[\planetDrone_effect_2]),

		(0 + (~stPreset[\planetDrone_effect_3]*0.75)) / (4..8)
     );

	sig = Limiter.ar(LeakDC.ar(Splay.ar(sig)),0.5,0.13);

	sig = sig.sum * ~stPreset[\amp] * 0.35;

   });
)


Ndef(\st).play(0);

Ndef(\st).clear(0);