/****************************************************************************
aL, aR SfPlay2 Sfil, kspeed [, iskip [, iloop]]
Plays a stereo signal from a mono or stereo soundfile

Gives stereo output regardless a soundfile is mono or stereo (if mono, this signal is sent to both channels).
written by joachim heintz

Sfil - Sound file name (or path) in double quotes
iskip - skiptime in seconds (default=0)
iloop - 1 = loop, 0 = no loop (default=0)
kspeed - speed to read the file (1 = normal, 2 = octave higher, 0.5 = octave lower)
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

  opcode SfPlay2, aa, Skoo
Sfil, kspeed, iskip, iloop xin
ichn       filenchnls Sfil
if ichn == 1 then
aL         diskin2    Sfil, kspeed, iskip, iloop
aR         =          aL
           else
aL, aR     diskin2    Sfil, kspeed, iskip, iloop
endif
           xout       aL, aR
  endop


instr 1
aL, aR     SfPlay2  "../_sourcefiles/fox.wav", 1
           outs       aL, aR
endin

instr 2
aL, aR     SfPlay2  "../_sourcefiles/2_channel_file.wav", 1
           outs       aL, aR
endin
</CsInstruments>
<CsScore>
i 1 0 5
i 2 5 5
</CsScore>
</CsoundSynthesizer>

