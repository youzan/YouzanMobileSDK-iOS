#
#  Be sure to run `pod spec lint YZOpenSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "YZOpenSDK"
  s.version      = "0.1.0"
  s.summary      = "A short description of YZOpenSDK."
  s.description  = 'youzanyun app sdk'
  s.homepage     = "https://www.youzanyun.com/"
  s.license      = "MIT"
  s.author             = { "liuyang" => "liuyang@youzan.com" }
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/youzan/YouzanMobileSDK-iOS.git", :tag => s.version.to_s }
  s.default_subspec = 'Base'

  s.subspec 'Base' do |base|
    base.ios.vendored_framework = './YZBaseSDK/YZBaseSDK.framework'
  end
  
  s.subspec 'Native' do |native|
    native.ios.vendored_framework = './YZNativeSDK/YZNativeSDK.framework'
    native.resources = './YZNativSDK/YZNativeRes.bundle'
    native.dependency 'YZOpenSDK/Base'
  end

end
