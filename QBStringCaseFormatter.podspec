#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "QBStringCaseFormatter"
  s.version          = "1.0.0"
  s.summary          = "A formatter to convert string case."
  s.description      = "QBStringCaseFormatter can be used to convert camel-case string to snake-case string, and vice versa."
  s.homepage         = "https://github.com/questbeat/QBStringCaseFormatter"
  s.license          = 'MIT'
  s.author           = { "questbeat" => "questbeat@gmail.com" }
  s.source           = { :git => "https://github.com/questbeat/QBStringCaseFormatter.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/questbeat'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
end
