// moins bien


(
~jwPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)



(
Ndef(\jw,{
	var sig;
	d=Duty;
    f=d.kr(1/[1,2,4],0,Dseq([
		-10+(~jwPreset[\planetDrone_1a] * 10),
		-5+(~jwPreset[\planetDrone_2a] * 10),
		0+(~jwPreset[\planetDrone_3a] * 10),
		3+(~jwPreset[\planetDrone_4a] * 10),
		7+(~jwPreset[\planetDrone_1b] * 10),
		12+(~jwPreset[\planetDrone_2b] * 10),
		17+(~jwPreset[\planetDrone_3b] * 10),
		22+(~jwPreset[\planetDrone_4b] * 10)] + 24 + (~jwPreset[\planetDrone_effect_2] * 24), inf));
	sig = GVerb.ar(Blip.ar(f.midicps*[1,4,8],LFNoise1.kr(1/8+abs(~jwPreset[\planetDrone_effect_3] * 10), 3, 4)).sum, 275, 1+abs(~jwPreset[\planetDrone_effect_1] * 3));
	sig = sig * ~jwPreset[\amp] * 0.4;
	sig = Limiter.ar(sig, 0.5);

   });

)


Ndef(\jw).play(0);

Ndef(\jw).clear(1);