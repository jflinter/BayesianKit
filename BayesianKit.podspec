Pod::Spec.new do |s|

  s.name         = "BayesianKit"
  s.version      = "0.0.1"
  s.summary      = "A Cocoa framework implementing a bayesian classifier"

  s.homepage     = "https://github.com/jflinter/BayesianKit"

  s.license      = 'MIT'

  s.author             = { "Samuel Mendes" => "samuel.mendes@gmail.com" }

  s.source       = { :git => "https://github.com/jflinter/BayesianKit.git", :commit => "013a317c901460cd1af84f34e04fb985052fbc12" }

  s.source_files  = 'src'

  s.dependency 'ParseKit'
  s.platform     = :ios
end
