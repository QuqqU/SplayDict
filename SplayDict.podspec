Pod::Spec.new do |s|
  s.name             = 'SplayDict'
  s.version          = '0.2.3'
  s.summary          = 'It is a collection type based on law of Pareto, splay tree.'
  s.description      = <<-DESC
SplayDict written in Swift, is a collection type like special ordered set. It is based on Splay tree which reflects tendency of search input data.
                       DESC

  s.cocoapods_version = '>= 1.5.3'
  s.homepage         = 'https://github.com/QuqqU/SplayDict'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'QuqqU' => 'rldnd913@naver.com' }
  s.source           = { :git => 'https://github.com/QuqqU/SplayDict.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'SplayDict/Classes/**/*'
  
end
