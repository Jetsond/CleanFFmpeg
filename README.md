# CleanFFmpeg

This local pod is intended for the chat video send pipeline only.

It builds FFmpeg from the bundled `FFmpeg-master` source tree and exposes the public headers needed by the muxing layer.

Build:

```bash
bash 3rd/CleanFFmpeg/build_clean_ffmpeg.sh
```

Then run CocoaPods installation:

```bash
pod install
```
