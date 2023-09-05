#
#  Be sure to run `pod spec lint YZOpenSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "YZAppSDK"
  s.version      = "7.2.3"
  s.summary      = "An AppSDK for Youzanyun."
  s.description  = 'There are praise cloud AppSDK is for mobile applications to build the electricity trading system'   \
                   'through an SDK will be able to integrate in the APP to provide the entire transaction services.'
  s.homepage     = "https://www.youzanyun.com/"
  s.license      = "MIT"
  s.author       = { "pansheng" => "pansheng@youzan.com" }
  s.source       = { :http => "https://b.yzcdn.cn/youzanyun/appsdk/open_sdk_ios_basic_#{s.version.to_s}.zip" }

  s.frameworks   = 'WebKit', 'UIKit', 'Foundation'
  s.requires_arc = true

  s.ios.deployment_target = "11.0"
  s.default_subspec = 'Base'

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.subspec 'Core' do |core|
    core.ios.vendored_framework = 'Release/YZSDKCore.framework'
  end

  s.subspec 'Base' do |base|
    base.ios.vendored_framework = 'Release/YZBaseSDK.framework'
    base.dependency 'YZAppSDK/Core'

  end

end

