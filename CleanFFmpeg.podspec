Pod::Spec.new do |s|
  s.name         = 'CleanFFmpeg'
  s.version      = '1.0.0'
  s.summary      = 'Local clean FFmpeg for chat video muxing'
  s.description  = 'A local FFmpeg pod built from the workspace source package for chat video sending only.'
  s.homepage     = 'https://ffmpeg.org'
  s.license      = { :type => 'LGPL-2.1-or-later', :file => '../FFmpeg-master/LICENSE.md' }
  s.author       = { 'Codex' => 'codex@openai.com' }
  s.platform     = :ios, '13.0'
  s.source       = { :path => '.' }
  s.requires_arc  = true
 
  # Headers must also be source files; public_header_files only filters the
  # headers exposed from source_files and does not add them by itself.
  s.source_files = ['support/CleanFFmpegDummy.m']
  s.vendored_frameworks = 'build/CleanFFmpeg.xcframework'

  s.preserve_paths = [
    'FFmpeg-master',
    'build_clean_ffmpeg.sh',
    'include',
    'support',
    'build'
  ]

  s.pod_target_xcconfig = {
    'ENABLE_BITCODE' => 'NO'
  }

  # The XCFramework slice contains a static core library. CocoaPods' generated
  # XCFramework output list can lag behind a renamed static binary and make a
  # force_load against the intermediate directory fail before the copy phase.
  # Link the device slice from the local pod source directly. Device builds are
  # the supported validation target for this pod; the simulator is not used for
  # this app's FFmpeg validation.
  s.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/../../CleanFFmpeg/include"',
    'OTHER_LDFLAGS' => '$(inherited) -force_load "${PODS_ROOT}/../../CleanFFmpeg/build/CleanFFmpeg.xcframework/ios-arm64/libCleanFFmpegCore.a"'
  }
end
