
s.boot;

~bol = Buffer.read(s,"C:/Users/salam/Documents/ms_audiovisual_arts/zanos/zanos_ergasia_1/super_collider/01 - Bolero.flac");
~bol.play;
~bol.bufnum;
~bol.duration;
~bol.numChannels;
~bol.numFrames;
~bol.query;
~bol.free;


(
SynthDef.new(\bolero, {
	arg amp=3, buf, rate=2, loop, pos;
	var sig;

	sig = PlayBuf.ar(2, buf, BufRateScale.kr(buf) * rate, startPos: pos, loop: loop, doneAction: 2);
	sig = sig * amp;

	Out.ar(0, sig!2);

}).add;
)

//background_edit
(
Synth (\bolero,	[
		\buf, ~bol,
		\rel, 100,
		\spos, ~bol.numFrames*0.1,
		\rate, 0.2,
	]



).add;
)

//meme.melody
(
{
	var sig;
	sig = PlayBuf.ar(2);
	sig = LPF.ar(sig,1000, 3);
	sig = LPF.ar(sig,Saw.kr(10).exprange(50,1000) );
	sig = HPF.ar(sig, SinOsc.kr(10).exprange(50,100));

}.play;
)

	
