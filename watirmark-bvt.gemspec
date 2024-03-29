$:.unshift File.expand_path("../lib", __FILE__)
require "watirmark-bvt/version"

Gem::Specification.new do |s|
  name = Watirmark::BVT::VERSION::NAME
  s.name = name
  version = Watirmark::BVT::VERSION::STRING
  s.version = version
  s.authors = [%q{Hugh McGowan}]
  s.email = %q{hmcgowan@convio.com}
  s.description = %q{The watirmark_bvt library provides access to BVT configurations}
  s.homepage = %q{http://twiki.convio.com/twiki/bin/view/Engineering/WatirmarkBVT}
  s.summary = Watirmark::BVT::VERSION::SUMMARY
  s.files = Dir['lib/**/*']
  s.test_files =  Dir['spec/**/*.rb']
  s.require_paths = ["lib"]
  Watirmark::BVT::DEPENDENCIES.each do |gem|
    s.add_dependency gem[0], gem[1]
  end
end