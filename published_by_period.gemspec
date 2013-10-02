require "./lib/published_by_period/version"

Gem::Specification.new do |s|
  s.name        = "published_by_period"
  s.version     = PublishedByPeriod::VERSION
  s.description = "Published content by period"
  s.summary     = s.description
  s.author      = "Renato Alencar"
  s.email       = "pedrozo.alencar@gmail.com"
  s.files       = Dir["lib/**/*"]
  s.test_files  = Dir["test/**/*"]
  s.homepage    = "http://github.com/pedrozoalencar/published_by_period"
end

