Pod::Spec.new do |spec|

  spec.name         = "locationAppSDK"
  spec.version      = "0.0.4"
  spec.summary      = "Para localizar pessoas."
  spec.description  = "Ferramenta usada para localizar seu celular com latitude e longitude"
  spec.homepage     = "https://github.com/maxFider67/locationApp"
  spec.license      = "MIT"
  spec.author       = { "Gabriel Caldeira" => "gabriel.caldeira@dtidigital.com.br" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/maxFider67/locationApp.git", :tag => "#{spec.version}" }
  
  spec.vendored_frameworks = "locationAppSDK.xcframework"

   # spec.dependency "JSONKit", "~> 1.4"

end
