// fabien l'a fait, rebircoler

Ndef(\sd).fadeTime_(3);

(
~sdPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1, planetDrone_1b: 0.13, planetDrone_2b: 0.145, planetDrone_3b: 0.2, planetDrone_4b: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
~sdPreset = (planetDrone_1a: rrand(0.01, 0.99), planetDrone_2a: rrand(0.1, 0.95), planetDrone_3a: rrand(0.1, 1), planetDrone_4a: rrand(0.1, 0.9), planetDrone_1b: rrand(0.1, 1), planetDrone_2b: rrand(0.1, 0.95), planetDrone_3b: rrand(0.1, 0.92), planetDrone_4b: rrand(0.1, 0.9),  planetDrone_effect_1: rrand(0.1, 0.93), planetDrone_effect_2: rrand(0.1, 0.925), planetDrone_effect_3: rrand(0.1, 0.9625), hz: rrand(65.41, 300), amp: 0.1);
)


(
Ndef(\sd, {

	var sig, n = rrand(3,99);

	sig = EnvGen.ar(Env({0.65.rand2 ** 3}!n, {exprand((1 + ~sdPreset[\planetDrone_3a]) * 1e-4, 4 - (~sdPreset[\planetDrone_1a] * 4) )} ! (n - 1), 0.05, n - 2, 0.0));

	sig = ({
		sig * Blip.ar((1 + (~sdPreset[\planetDrone_4a] * 0.75)) * 9e2.rand2,(1 + (~sdPreset[\planetDrone_2a] * 250)) * sig * 9 % [9,7])
	}!4).mean;

	sig = GVerb.ar(
		sig,
		roomsize:200,
		revtime:385,
		damping:0.5, inputbw:0.5,
		spread:50,
		drylevel:-4.0 + (~sdPreset[\planetDrone_effect_1] * 4),
		earlyreflevel:-3.2+(~sdPreset[\planetDrone_effect_2] * 4),
		taillevel:0.9+(~sdPreset[\planetDrone_effect_3] * 1.25));
	sig = Mix.ar(sig) * ~sdPreset[\amp] * 0.3;
	sig = Limiter.ar(sig, 0.5);
});
)

Ndef(\sd).play(0);

Ndef(\sd).clear(1);