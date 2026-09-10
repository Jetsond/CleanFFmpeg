#import <Foundation/Foundation.h>

FOUNDATION_EXPORT double CleanFFmpegVersionNumber;
FOUNDATION_EXPORT const unsigned char CleanFFmpegVersionString[];

#import "cleanffmpeg_prefix.h"
#import <libavutil/error.h>
#import <libavutil/opt.h>
#import <libavutil/mem.h>
#import <libavutil/avutil.h>
#import <libavcodec/avcodec.h>
#import <libavcodec/packet.h>
#import <libavcodec/codec_par.h>
#import <libavformat/avformat.h>
#import <libavformat/avio.h>
