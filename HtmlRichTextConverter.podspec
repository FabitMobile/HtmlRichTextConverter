#
# Be sure to run `pod lib lint HtmlRichTextConverter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'HtmlRichTextConverter'
    s.version          = '1.0.0'
    s.summary          = 'Wrapper on DTCoreText'
    
    s.homepage         = 'https://github.com/FabitMobile/HtmlRichTextConverter'
    s.license          = { :type => 'BSD-2-Clause License', :file => 'LICENSE' }
    s.author           = { 'fabit_mobile' => "aleksandr.zherebtsov@gorparkovki.ru"}
    s.source           = { :git => 'https://github.com/FabitMobile/HtmlRichTextConverter.git', :tag => s.version.to_s }
    s.swift_version     = '5.2'
    
    s.ios.deployment_target = '8.0'
    
    s.source_files = 'HtmlRichTextConverter/Classes/**/*'
    
    s.dependency 'DTCoreText', '~> 1.6'
end
