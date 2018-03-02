#
# Be sure to run `pod lib lint Aha_CustomControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Aha_CustomControl'
  s.version          = '0.1.0'
  s.summary          = 'Aha_CustomControl is a cocoapod for Aha applications'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Aha_CustomControl is created by Aha developers.
Need to be shared.
                       DESC

  s.homepage         = 'https://github.com/son11592/Aha_CustomControl.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hoangson11592@gmail.com' => 'hoangson11592@gmail.com' }
  s.source           = { :git => 'https://github.com/son11592/Aha_CustomControl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Aha_CustomControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Aha_CustomControl' => ['Aha_CustomControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.resource              = 'Dependencies/GoogleMaps.framework/Resources/GoogleMaps.bundle'
  # s.vendored_frameworks   = "Dependencies/GoogleMaps.framework", "Dependencies/GoogleMapsBase.framework", "Dependencies/GoogleMapsCore.framework"
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'DynamicColor', '~> 4.0.2'
  s.dependency 'NibDesignable', '~> 3.0.0'
  s.dependency 'Localize-Swift', '~> 2.0.0'
  s.dependency 'AppRouter', '~> 4.1.2'
  s.dependency 'MaterialTextField', '~> 0.2.1'
  s.dependency 'Realm', '~> 3.1.1'
  s.dependency 'RealmSwift', '~> 3.1.1'
  s.dependency 'AlamofireObjectMapper', '~> 5.0'
  s.dependency 'AlamofireImage', '~> 3.3.0'
  s.dependency 'SideMenuController', '~> 0.2.4'
  s.dependency 'XLActionController', '~> 4.0.0'
  s.dependency 'KeychainAccess', '~> 3.1.0'
  s.dependency 'AlamofireNetworkActivityIndicator', '~> 2.0'
  s.dependency 'SwiftDate', '~> 4.3.0' #Swift 3
  s.dependency 'HandySwift', '~> 2.4.0'
  s.dependency 'RxRealm', '~> 0.7.5'
  s.dependency 'AlamofireObjectMapper', '~> 5.0'
  s.dependency 'AlamofireImage', '~> 3.3.0'
  s.dependency 'SideMenuController', '~> 0.2.4'
end
