(
~saPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
 Ndef(\sa,{
	var freq = 100+(~saPreset[\planetDrone_1a] * 800);
	var rt = 0.75;
	var src = PinkNoise.ar(1!2) - abs(~saPreset[\planetDrone_4a] * 2);
	var sig;

	sig = FreqShift.ar(
		FreeVerb.ar(
			4.do{src=BRF.ar(src,rrand(1900,3600).round(2)+(freq*LFNoise0.ar(rt.rand!2)),0.25)};
			2.do{src=BRF.ar(src,rrand(100,600).round(8)+(freq*LFNoise1.ar(rt.rand!2)),0.14)};
			4.do{src=BRF.ar(src,rrand(900,2600).round(16)+(freq*LFNoise1.ar(rt.rand!4)),0.2)};
			6.do{src=BRF.ar(src,rrand(250,7500).round(8)+(freq*LFNoise1.ar(rt.rand!6)),0.11)};
			4.do{src=BRF.ar(src,rrand(2500,5000).round(12)+(freq*LFNoise1.ar(rt.rand!2)),0.2)};
			src=FreqShift.ar(src,Duty.ar(6,0,Dwhite(-1*freq*12,freq*10).round(freq/16)),0, ~saPreset[\planetDrone_2a] * 2) + src;
			src=CombC.ar(src,1,1,7);
			Limiter.ar(LPF.ar(src,2500+(~saPreset[\planetDrone_3a] * 3000)+LFNoise1.ar(rt.rand!2,1250))),
			mix:  abs(~saPreset[\planetDrone_effect_1]),
			room: abs(~saPreset[\planetDrone_effect_2]),
			damp:  0.25,
			mul: 1.0,
			add: 0.0),
		abs(~saPreset[\planetDrone_effect_3] * 8) / (4..16));
	sig = Splay.ar(sig);
	sig = sig * ~saPreset[\amp] * 0.5;

});
)

Ndef(\sa).play(0);

Ndef(\sa).clear(1);