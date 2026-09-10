Pod::Spec.new do |s|
  s.name = 'CleanFFmpeg'
  s.version = '1.0.3'
  s.summary = 'Local clean FFmpeg for chat video muxing'
  s.description = 'A clean FFmpeg pod for chat video muxing.'
  s.homepage = 'https://github.com/Jetsond/CleanFFmpeg.git'
  s.license = {
    :type => 'LGPL-2.1-or-later',
    :file => 'LICENSE.md'
  }
  s.author = {
    'Chao' => 'zhangc1993@icloud.com'
  }
  s.platform = :ios, '13.0'

  s.source = {
    :git => 'https://github.com/Jetsond/CleanFFmpeg.git',
    :tag => s.version.to_s
  }

  s.requires_arc = true

  # 不把整套 FFmpeg 原始头文件注册进 CocoaPods 全局 Header Map
  s.source_files = [
    'support/CleanFFmpegDummy.m'
  ]

  s.vendored_frameworks = 'build/CleanFFmpeg.xcframework'

  s.preserve_paths = [
    'include',
    'build'
  ]

  s.pod_target_xcconfig = {
    'ENABLE_BITCODE' => 'NO'
  }

  s.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_TARGET_SRCROOT}/include"',
    'OTHER_LDFLAGS' => '$(inherited) -force_load "$(PODS_XCFRAMEWORKS_BUILD_DIR)/CleanFFmpeg/libCleanFFmpegCore.a"'
  }
end
