#
# Be sure to run `pod lib lint CMYRefresh.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CMYRefresh'
  s.version          = '0.1.3'
  s.summary          = '一句代码集成上下左右四个方向的拉动刷新'
  s.swift_version    = '4.2'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = '借鉴MJRefresh的思路封装的一个常用的刷新控件'

  s.homepage         = 'https://github.com/BeyChan/CMYRefresh'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'BeyChan' => 'beychan@qq.com' }
  s.source           = { :git => 'https://github.com/BeyChan/CMYRefresh.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CMYRefresh/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CMYRefresh' => ['CMYRefresh/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'CMYKit/Core'
end
