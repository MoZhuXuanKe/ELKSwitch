#
# Be sure to run `pod lib lint ELKSwitch.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ELKSwitch'
  s.version          = '0.1.0'
  s.summary          = 'A simple control that can be used to replace UIswitch'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A simple control that can be used to replace UIswitch,You can customize the frame and the color when it is not selected, and you can also set the tintColor'

  s.homepage         = 'https://github.com/MoZhuXuanKe/ELKSwitch'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MoZhuXuanKe' => 'mozhuxuanke@icloud.com' }
  s.source           = { :git => 'https://github.com/MoZhuXuanKe/ELKSwitch.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ELKSwitch/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ELKSwitch' => ['ELKSwitch/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
