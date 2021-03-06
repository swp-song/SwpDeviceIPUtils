#
# Be sure to run `pod lib lint SwpDeviceIpUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwpDeviceIpUtils'
  s.version          = '1.1.1'
  s.summary          = ' 获取 iOS 设备 Ip 的工具 '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 获取 iOS 设备 Ip 的工具
                       DESC

  s.homepage         = 'https://github.com/swp-song/SwpDeviceIpUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'swp-song' => '396587868@qq.com' }
  s.source           = { :git => 'https://github.com/swp-song/SwpDeviceIpUtils.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files          = 'SwpDeviceIpUtils/Class/**/*.{h,m}'
  s.resource              = 'SwpDeviceIpUtils/Resources/SwpDeviceIpUtils.bundle'

  # s.resource_bundles = {
  #   'SwpDeviceIpUtils' => ['SwpDeviceIpUtils/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.requires_arc  = true
end
