#
# Be sure to run `pod lib lint STTimerView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'STTimerView'
  s.version          = '1.0.3'
  s.summary          = 'This is a simple view with a Circle Progress Count Down using Swift 2.3 and XCode 7.3.1.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is a simple view with a Circle Progress Count Down using Swift 2.3 and XCode 7.3.1.
Required:
- Swift 2.3
- XCode 7.3.1
                       DESC

  s.homepage         = 'https://github.com/stefanthomsen/STTimerView'
  #s.screenshots     = ''
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Stefan Thomsen' => 'stefan.pgt@gmail.com' }
  s.source           = { :git => 'https://github.com/stefanthomsen/STTimerView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/stefanthomsen'

  s.ios.deployment_target = '8.0'

  s.source_files = 'STTimerView/Classes/*'
  
  # s.resource_bundles = {
  #   'STTimerView' => ['STTimerView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
