(
~scPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, sigAmp: 0.8, sig1Amp: 0.8, amp: 0.1);
)



(
Ndef(\sc, { arg freq=186, pan=0;
	var sig;
	var env1, env2, env3, env4, env5, env6, env7, env8;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var fac = 1/SelectX.kr( SinOsc.kr(1/75).range(0,16), [1/3,1,7,4,8,12,128] )/6;
	env1 = EnvGen.ar(Env([42,21,42,30,84],[4,4,7.5,0.5]/fac).circle, 1);
	env2 = EnvGen.kr(Env([1,4,2,3],[6,1,3]).circle, 1);
	env3 = XLine.kr(1,0.1,20*1);

	freq = 8.collect({ arg x;
		freq + ( env1 + (~scPreset[\planetDrone_3a] * 200) * x ) + [0, SinOsc.kr(x + (~scPreset[\planetDrone_2a] * 24), mul: env2 + (~scPreset[\planetDrone_4a] * 10)).range(0, 1 * x +(~scPreset[\planetDrone_effect_3] * 10))];
	});
	//freq.debug.shape.debug("freq");
	sig = SinOsc.ar( freq + (~scPreset[\planetDrone_1a] * 200) / [4,2,1]);
	//sig.shape.debug("sig1");
	sig = sig.collect({ arg isig, x;
		isig = SelectX.ar( PMOsc.kr(x + 1/34).range(0,1), [isig, isig.fold2(env3)]);
		isig = SelectX.ar( SinOsc.kr(1/223 + ~scPreset[\planetDrone_effect_2], 3pi/2).range(0,1), [isig, ( isig * SinOsc.kr(1/48 * ( x + 1 )).range(1,83) ).tanh]);
	});
	//sig.shape.debug("sig2");
	sig1 = sig.flop[1];
	sig = sig.flop[0];
	//sig.debug("sig");
	sig1 = Pan2.ar(sig1, SinOsc.ar(sig1.size.collect({ arg x; SinOsc.kr(x/100+1.32).range(0,8)/4 })) * SinOsc.kr(1/48).range(0,1), ~scPreset[\sig1Amp]).mean;
	sig = Pan2.ar(sig, SinOsc.ar(sig.size.collect({ arg x; SinOsc.kr(x/10+1.1).range(0,8) })) * SinOsc.kr(1/53).range(0,1), ~scPreset[\sigAmp]).mean;
	sig = sig + sig1;
	sig = sig / 2.0;
	sig = LPF.ar(sig, 1999+(~scPreset[\planetDrone_effect_1]*1900));
	sig = sig * ~scPreset[\amp] * 0.5;
});
)

Ndef(\sc).play(0);

Ndef(\sc).release(1);