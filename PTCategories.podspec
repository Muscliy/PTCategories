Pod::Spec.new do |s|
  s.name             = 'PTCategories'
  s.version          = '0.1.0'
  s.summary          = 'Useful categories for Foundation and UIKit'
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '8.0'
  s.homepage         = 'https://github.com/Muscliy/PTCategories'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'leehu' => 'leehudev@gmail.com' }
  s.source           = { :git => 'https://github.com/Muscliy/PTCategories.git', :tag => s.version.to_s }
  s.social_media_url = 'http://muscliy.github.io/'

  s.requires_arc = true
  s.source_files = 'PTCategories/**/*.{h,m}'
  s.public_header_files = 'PTCategories/**/*.{h}'

  # s.resource_bundles = {
  #   '${POD_NAME}' => ['${POD_NAME}/Assets/*.png']
  # }
  s.frameworks = 'UIKit', 'MapKit','CoreFoundation' ,'QuartzCore', 'CoreGraphics', 'CoreImage', 'CoreText', 'ImageIO', 'Accelerate'
  # s.dependency 'AFNetworking', '~> 2.3'
end