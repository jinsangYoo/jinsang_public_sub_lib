Pod::Spec.new do |s|
    s.name             = 'jinsang_public_sub_lib'
    s.version          = '0.0.1'
    s.summary          = 'subspec of jinsang_public_lib.'
    s.swift_version = '4.2'

  s.homepage         = 'https://github.com/milkybboy/jinsang_public_sub_lib'
  s.license          = { :type => 'Apache License, Version 2.0', :file => 'jinsang_public_lib-' + s.version.to_s + '/LICENSE.md' }
  s.author           = { 'jinsang' => 'jinsang@nhnent.com' }
  s.source           = { :http => 'https://github.com/milkybboy/jinsang_public_lib/archive/' + s.version.to_s + '.zip' }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

   s.ios.vendored_frameworks = 'jinsang_public_sub_lib-' + s.version.to_s + '/Framework/AceTM.framework'
  # s.frameworks = 'Foundation', 'UIKit'
end
