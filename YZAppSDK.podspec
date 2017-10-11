#
#  Be sure to run `pod spec lint YZOpenSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "YZAppSDK"
  s.version      = "0.1.2"
  s.summary      = "An AppSDK for Youzanyun."
  s.description  = 'There are praise cloud AppSDK is for mobile applications to build the electricity trading system'   \
                   'through an SDK will be able to integrate in the APP to provide the entire transaction services.'
  s.homepage     = "https://www.youzanyun.com/"
  s.license      = "MIT"
  s.author       = { "pansheng" => "pansheng@youzan.com" }
  s.source       = { :git => "https://github.com/youzan/YouzanMobileSDK-iOS.git", :tag => s.version.to_s }

  s.frameworks   = 'WebKit', 'UIKit', 'Foundation'
  s.requires_arc = true

  s.ios.deployment_target = "7.0"
  s.default_subspec = 'Base'
  s.subspec 'Base' do |base|
    base.ios.vendored_framework = 'YZBaseSDK/YZBaseSDK.framework'
  end
  s.subspec 'Native' do |native|
    native.ios.vendored_framework = 'YZNativeSDK/YZNativeSDK.framework'
    native.resources = 'YZNativeSDK/YZNativeRes.bundle'
    native.dependency 'YZAppSDK/Base'
  end

end

