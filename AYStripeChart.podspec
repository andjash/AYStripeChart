Pod::Spec.new do |s|
  s.name             = "AYStripeChart"
  s.version          = "1.0.1"
  s.summary          = "Simple and configurable stripe chart."
  s.license          = 'MIT'
  s.homepage         = 'https://github.com/andjash/AYStripeChart'
  s.author           = { "Andrey Yashnev" => "andjash@gmail.com" }
  s.source           = { :git => "https://github.com/andjash/AYStripeChart.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'AYStripeChart'

end
