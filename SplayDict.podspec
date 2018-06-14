#
# Be sure to run `pod lib lint SplayDict.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SplayDict'
  s.version          = '0.1.2'
  s.summary          = 'It is a collection type based on law of Pareto, splay tree.'
  s.swift_version    = '4.0'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
SplayDict written in Swift, is a collection type like special ordered set. It is based on Splay tree which reflects tendency of search input data.
                       DESC

  s.homepage         = 'https://github.com/QuqqU/SplayDict'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'QuqqU' => 'rldnd913@naver.com' }
  s.source           = { :git => 'https://github.com/QuqqU/SplayDict.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SplayDict/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SplayDict' => ['SplayDict/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
