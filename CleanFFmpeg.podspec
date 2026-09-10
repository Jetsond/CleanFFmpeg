Pod::Spec.new do |s|
  s.name         = 'CleanFFmpeg'
  s.version      = '1.0.0'
  s.summary      = 'Local clean FFmpeg for chat video muxing'
  s.description  = 'A local FFmpeg pod built from the workspace source package for chat video sending only.'
  s.homepage     = 'https://github.com/Jetsond/CleanFFmpeg.git'
  s.license = {
    :type => 'LGPL-2.1-or-later',
        :file => 'LICENSE'
  }
  s.author       = { 'Chao' => 'zhangc1993@icloud.com' }
  s.platform     = :ios, '13.0'
  s.source = {
    :git => 'https://github.com/Jetsond/CleanFFmpeg.git',
    :tag => s.version.to_s
  }
  s.requires_arc = true

    s.source_files = [
      'support/CleanFFmpegDummy.m',
      'include/**/*.h'
    ]

    s.public_header_files = [
      'include/CleanFFmpeg.h',
      'include/**/*.h'
    ]

    s.header_mappings_dir = 'include'
    s.vendored_frameworks = 'artifacts/CleanFFmpeg.xcframework'

    s.preserve_paths = [
      'artifacts',
      'include'
    ]

    s.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_TARGET_SRCROOT}/include"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'ENABLE_BITCODE' => 'NO'
    }
end
