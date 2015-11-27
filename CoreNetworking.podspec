Pod::Spec.new do |s|

  s.name         = "CoreDataManager"
  s.version      = "1.0.0"
  s.summary      = "A static library project that simplifies NSURLSession."

  s.homepage     = "https://github.com/GabrielMassana"
  s.license      = { :type => 'BSD'}
  s.author       = { "Gabriel Massana" => "gabrielmassana@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/GabrielMassana/CoreNetworking-iOS.git", :tag => s.version, :branch => "master"}

  s.source_files  = "CoreNetworking/**/*.{h,m}"
  s.public_header_files = "CoreNetworking/**/*.{h}"

  s.requires_arc = true

end
