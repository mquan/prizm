# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "prizm/version"

Gem::Specification.new do |s|
  s.name        = "prizm"
  s.version     = Prizm::VERSION
  s.authors     = ["Quan Nguyen"]
  s.email       = ["mquannie@gmail.com <mailto:mquannie@gmail.com>"]
  s.homepage    = ""
  s.summary     = %q{Prizm is a ruby gem that extracts colors from an input image}
  s.description = %q{Prizm uses rmagick to extract colors from images}

  s.rubyforge_project = "prizm"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rmagick"
  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
