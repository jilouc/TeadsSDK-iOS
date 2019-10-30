frameworkFile = "#{__dir__}/TeadsSDK.framework"
frameworkZipFile = "#{frameworkFile}.zip"

Pod::Spec.new do |s|

s.name         = "TeadsSDK"
s.version      = "4.3.2"
s.summary      = "Teads' iOS SDK"

s.description  = <<-DESC
                 Teads allows you to integrate a single SDK into your app, and serve premium branded ads from Teads' SSP.
                 DESC

s.ios.deployment_target     = "9.0"

s.homepage     = "https://github.com/teads/TeadsSDK-iOS"
s.license      = "Apache 2.0"
s.author       = { "Teads" => "support-sdk@teads.tv" }

system("rm -f #{frameworkZipFile} && zip #{frameworkZipFile} #{frameworkFile} > /dev/null")

s.source       = { :http => 'file:' + frameworkZipFile }

s.requires_arc = true
s.preserve_paths = 'TeadsSDK.framework'
s.vendored_frameworks = 'TeadsSDK.framework'
s.ios.frameworks = 'AdSupport', 'AVFoundation', 'CoreMedia', 'CoreTelephony', 'MediaPlayer', 'SystemConfiguration'
s.framework = 'TeadsSDK'

end
