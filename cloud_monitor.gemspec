# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cloud_monitor/version"

Gem::Specification.new do |s|
  s.name        = "cloud_monitor"
  s.version     = CloudMonitor::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Write your name"]
  s.email       = [" Write your email address"]
  s.homepage    = ""
  s.summary     = %q{Write a gem summary}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "qcm"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
