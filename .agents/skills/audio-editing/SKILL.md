---
name: audio-editing
description: A skill for editing audio files, including cutting, merging, and applying effects.
disable-model-invocation: true
---

## Capabilities

### Trim the Dead Air

```sh
ffmpeg -i recording.wav -af "silenceremove=start_periods=1:start_duration=0.15:start_threshold=-35dB:detection=peak" trimmed.wav
```

### Automatic Post-Processing

1. Cuts the bass rumble to below 80Hz
2. Rolls off harsh highs above 12kHz
3. Reduces background noise
4. Compresses dynamic range so quiet parts are audible and loud parts won't clip
5. Normalizes volume to a broadcast standard

```sh
ffmpeg -i input.m4a -af "highpass=f=80,lowpass=f=12000,afftdn=nf=-25,acompressor=threshold=-20dB:ratio=3:attack=5:release=50,loudnorm=I=-16:TP=-1.5:LRA=11" output.m4a
```

### Speed Up

_Anything under 1.15x is imperceptible._

```sh
ffmpeg -i raw.mp4 -filter_complex "[0:v]setpts=PTS/1.15[v];[0:a]atempo=1.15[a]" -map "[v]" -map "[a]" final.mp4
```
