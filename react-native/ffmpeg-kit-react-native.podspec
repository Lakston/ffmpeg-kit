require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

  s.source       = { :git => "https://github.com/arthenica/ffmpeg-kit.git", :tag => "react.native.v#{s.version}" }

  s.default_subspec   = 'https-gpl'

  s.dependency "React-Core"

  s.subspec 'min' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.ios.deployment_target = '12.1'
      ss.vendored_frameworks = Dir['binaries/min/*.xcframework']
  end

  s.subspec 'min-gpl' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.ios.deployment_target = '12.1'
      ss.vendored_frameworks = Dir['binaries/min-gpl/*.xcframework']
  end

  s.subspec 'https' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-https', "6.0"
      ss.vendored_frameworks = Dir['binaries/https/*.xcframework']
  end

  s.subspec 'https-gpl' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.ios.deployment_target = '12.1'
      ss.vendored_frameworks = Dir['binaries/https-gpl/*.xcframework']
  end

  s.subspec 'audio' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.ios.deployment_target = '12.1'
      ss.vendored_frameworks = Dir['binaries/audio/*.xcframework']
  end

  s.subspec 'video' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.ios.deployment_target = '12.1'
      ss.vendored_frameworks = Dir['binaries/video/*.xcframework']
  end

  s.subspec 'full' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.ios.deployment_target = '12.1'
      ss.vendored_frameworks = Dir['binaries/full/*.xcframework']
  end

  s.subspec 'full-gpl' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.ios.deployment_target = '12.1'
      ss.vendored_frameworks = Dir['binaries/full-gpl/*.xcframework']
  end

end
