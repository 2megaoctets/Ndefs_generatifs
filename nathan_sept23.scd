// sept23 à porter en ndefs + mods

SynthDef(\nathaniel_variation2, { arg out = 0, amp = 0.6, pan = 0, atk =
0.0001, dcy = 0.1, stn = 1, rls = 1.2, gate = 1, doneAction = 2;
     var sig, env, a, bohlen;
     env = EnvGen.ar(Env.adsr(atk, dcy, stn, rls), gate, doneAction:
doneAction);
     bohlen =
\bohlen.kr([1,27/25,25/21,9/7,7/5,75/49,5/3,9/5,49/25,15/7,7/3,63/25,25/9,3]);
     sig = {
         a = LFTri.ar(bohlen.choose/3);
         4.do{
             a = BAllPass.ar(a, PinkNoise.kr(11, 30 *
[1,3,9/7,9/5,7/3,25/9].choose),0.01);
             a = BAllPass.ar(a, PinkNoise.kr(23, 270 * [1, 3, 9].choose *
bohlen.choose), 0.003);
             a = ((a * LFNoise0.ar(bohlen.choose/7, 7, 3)) +
WhiteNoise.ar(Lag.ar(Dust2.ar(LFNoise1.kr(1,25,3), 1,
PinkNoise.kr(0.001)), 0.02), 0)).tanh;
             a = LPF.ar(LeakDC.ar(a, 0.996), 10000)
         };
         a = (a/10)
     } ! 8;
     sig = Pan2.ar(Splay.ar(sig), pan, amp * env);
     OffsetOut.ar(out, sig);
}).play;

~monsynth = Synth(\nathaniel_variation5);

~monsynth.release;

SynthDef(\nathaniel_variation5, { arg out = 0, amp = 0.6, pan = 0, atk =
0.0001, dcy = 0.1, stn = 1, rls = 1.2, gate = 1, doneAction = 2;
     var sig, env, a, bohlen;
     env = EnvGen.ar(Env.adsr(atk, dcy, stn, rls), gate, doneAction:
doneAction);
     bohlen =
\bohlen.kr([1,27/25,25/21,9/7,7/5,75/49,5/3,9/5,49/25,15/7,7/3,63/25,25/9,3]);
     sig = {
         a = LFTri.ar(bohlen.choose * 10/27, 0, 11);
         5.do{
             a = BAllPass.ar(a, PinkNoise.kr(1, 30 * bohlen.choose), 2,
1);
             a = BAllPass.ar(a, PinkNoise.kr(1, 270 * bohlen.choose *
[27, 3, 9].choose),0.001,17);
             a = ((a * LFNoise1.ar(bohlen.choose/9, 3, 1)) +
WhiteNoise.ar(PinkNoise.ar(0.1) * LFNoise2.ar(3, 0.001))).tanh;
             a = LPF.ar(LeakDC.ar(a, 0.995), 10000)
         };
         a = (a/50)
     } ! 8;
     sig = Pan2.ar(Splay.ar(sig), pan, amp * env);
     OffsetOut.ar(out, sig);
}).add;

SynthDef(\nathaniel_variation6, { arg out = 0, amp = 0.6, pan = 0, atk =
0.0001, dcy = 0.1, stn = 1, rls = 1.2, gate = 1, doneAction = 2;
     var sig, env, a;
     env = EnvGen.ar(Env.adsr(atk, dcy, stn, rls), gate, doneAction:
doneAction);
     sig = {
         a = LFTri.ar(1/3);
         7.do{
             a = BAllPass.ar(a, PinkNoise.kr(0.1, 40),1);
             a = BAllPass.ar(a, LFNoise0.kr(7/8, 2400, 2200),2);
             a = (a * LFNoise0.kr(3/4, 7, 2)).tanh;
             a = LeakDC.ar(a)
         };
         a/10
     } ! 8;
     sig = Pan2.ar(Splay.ar(sig), pan, amp * env);
     OffsetOut.ar(out, sig);
}).add;

SynthDef(\nathaniel_variation13, { arg out = 0, amp = 0.6, pan = 0, atk
= 0.0001, dcy = 0.1, stn = 1, rls = 1.2, gate = 1, doneAction = 2;
     var sig, env, a, f;
     env = EnvGen.ar(Env.adsr(atk, dcy, stn, rls), gate, doneAction:
doneAction);
     sig = {
         a = LFSaw.ar(5/4);
         17.do{
             a = BAllPass.ar(a, 30, 0.7);
             a = (a * LFNoise0.kr(4/3, 3, 1)).tanh;
             a = LeakDC.ar(a, 0.997)
         };
         a/10
     } ! 8;
     sig = Pan2.ar(Splay.ar(sig), pan, amp * env);
     OffsetOut.ar(out, sig);
}).add;