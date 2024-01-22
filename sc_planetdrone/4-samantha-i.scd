bof,, m oizo

(
~siPreset = (planetDrone_1a: 0.13, planetDrone_2a: 0.145, planetDrone_3a: 0.2, planetDrone_4a: 0.1,  planetDrone_effect_1: 0.3, planetDrone_effect_2: 0.25, planetDrone_effect_3: 0.0625, amp: 0.1);
)

(
Ndef(\si,	{

	var output;
	var delayTime;
	var delayMax = 0.02;
	var delayAdd = 0.1;
	var pulseFreq = 0.015;
	var proxyMul = 2;
	var pulseMin = 13;
	var pulseMax = 0;
	var numOfEchos = 0;
	var mainPulse = LFPulse.ar(pulseFreq + (~siPreset[\planetDrone_effect_3] * 1.75), 0, 0.5).range(pulseMin - (~siPreset[\planetDrone_2a] * 250), pulseMax + (~siPreset[\planetDrone_3a] * 250));
	var proxy = /*Ndef(\si).ar **/ proxyMul + (~siPreset[\planetDrone_4a] * 350);
	var ampModFreq = SinOsc.ar(0.01, 0).range(0.3, 30);
	var ampMod = LFNoise1.ar(ampModFreq, 6+(~siPreset[\planetDrone_1a] * 75));
	var sig;
	output = SinOsc.ar(mainPulse + proxy, 0, ampMod).tanh;
	numOfEchos.do{
	delayTime = {delayMax.rand + delayAdd}!2;
		output = AllpassL.ar(output, 0.7, abs(0.1 + delayTime + (~siPreset[\planetDrone_effect_2] * 1.72)), 5 + (~siPreset[\planetDrone_effect_1] * 4));
		};
	sig = output.tanh;
	sig = Splay.ar(sig) * ~siPreset[\amp] * 0.25;
	});
)

Ndef(\si).play(0);

Ndef(\si).clear(1);