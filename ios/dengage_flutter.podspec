#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint dengage_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'dengage_flutter'
  s.version          = '5.0.0'
  s.summary          = 'A new flutter plugin project.'
  s.description      = 'Customer Driven Marketing with built-in Customer Data Platform powered by full marketing automation capabilities'
  s.homepage         = 'https://github.com/wiseminds/dengage-flutter-sdk'  
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Wiseminds' => 'ekeh.wisdom@gmail.com' }
  # s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.source           = { :git => 'https://github.com/dengage-tech/dengage-ios-sdk.git', :tag => s.version.to_s }

  s.dependency 'Dengage', '~> 5.0.0'
  s.dependency "Dengage.Framework.Extensions", '1.0.10'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
