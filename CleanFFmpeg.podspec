Pod::Spec.new do |s|
  s.name         = 'CleanFFmpeg'
  s.version      = '1.0.2'
  s.summary      = 'Local clean FFmpeg for chat video muxing'
  s.description  = 'A local FFmpeg pod built from the workspace source package for chat video sending only.'
  s.homepage     = 'https://github.com/Jetsond/CleanFFmpeg.git'
  s.license = {
    :type => 'LGPL-2.1-or-later',
    :file => 'LICENSE.md'
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

    # These FFmpeg headers require non-iOS SDKs (DirectX, CUDA, Vulkan,
    # VA-API, VDPAU, Intel Media SDK, or AMD AMF). Exclude them from the
    # generated CocoaPods module umbrella on Apple platforms.
    s.exclude_files = [
      'include/libavcodec/d3d11va.h',
      'include/libavcodec/dxva2.h',
      'include/libavcodec/qsv.h',
      'include/libavcodec/vdpau.h',
      'include/libavutil/hwcontext_amf.h',
      'include/libavutil/hwcontext_cuda.h',
      'include/libavutil/hwcontext_d3d11va.h',
      'include/libavutil/hwcontext_d3d12va.h',
      'include/libavutil/hwcontext_dxva2.h',
      'include/libavutil/hwcontext_opencl.h',
      'include/libavutil/hwcontext_qsv.h',
      'include/libavutil/hwcontext_vaapi.h',
      'include/libavutil/hwcontext_vdpau.h',
      'include/libavutil/hwcontext_vulkan.h'
    ]

    s.header_mappings_dir = 'include'
    s.vendored_frameworks = 'build/CleanFFmpeg.xcframework'

    s.preserve_paths = 'include'

    s.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_TARGET_SRCROOT}/include"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'ENABLE_BITCODE' => 'NO'
    }
end
