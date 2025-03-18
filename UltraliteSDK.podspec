Pod::Spec.new do |s|
  s.name             = "UltraliteSDK"
  s.version          = "1.9.0"
  s.summary          = "Connect to the Vuzix Z100™ smart glasses. Easily connect, send notifications, send text, or send images to the glasses display."
  s.homepage         = "https://github.com/Vuzix/UltraliteSDK-releases-iOS"
  s.license          = { :type => "Vuzix Corporation", :file => "LICENSE.md" }

  s.license	     = { :type => "Vuzix Corporation", :text => "
                   Copyright (c) 2017-2023, Vuzix Corporation

		   This software is distributed under the VUZIX® SOFTWARE DEVELOPMENT KIT LICENSE AND CONFIDENTIALITY AGREEMENT.

		   The terms of this agreement are available from: https://www.vuzix.com/pages/vuzix%C2%AE-software-development-kit-license-and-confidentiality-agreement"
               }

  s.author           = { "Vuzix" => "developer@vuzix.com" }
  s.source           = { :http => "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v1.9.0/UltraliteSDK.zip" }
  
  s.vendored_frameworks = "UltraliteSDK.xcframework"

  s.ios.deployment_target = "14.0"
  s.osx.deployment_target = "11.0"
  s.watchos.deployment_target = "9.0"

  s.swift_version = "5.7"


end