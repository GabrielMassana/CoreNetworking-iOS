Pod::Spec.new do |s|

  s.name         = "CoreNetworking"
  s.version      = "1.0.2"
  s.summary      = "A static library project that simplifies NSURLSession."

  s.homepage     = "https://github.com/GabrielMassana"
  s.license      = { :type => 'MIT', :file => 'LICENSE.md'}
  s.author       = { "Gabriel Massana" => "gabrielmassana@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/GabrielMassana/CoreNetworking-iOS.git", :tag => s.version, :branch => "master"}

  s.source_files  = "CoreNetworking-iOS/**/*.{h,m}"
  s.public_header_files = "CoreNetworking-iOS/**/*.{h}"

  s.requires_arc = true

end
