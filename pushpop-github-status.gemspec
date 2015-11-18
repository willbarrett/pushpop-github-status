# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'pushpop-github-status/version'

Gem::Specification.new do |s|
  s.name = "pushpop-github-status"
  s.version = Pushpop::GithubStatusVersion
  s.authors = ["Will Barrett"]
  s.email = "will@tallgreentree.com"
  s.homepage = "https://github.com/willbarrett/pushpop-github-status"
  s.summary = "Pushpop plugin for reading Github's status"
  s.description = "A plugin for the pushpop integration system for reading Github's current status from status.github.com"

  s.add_dependency "pushpop"
  s.add_dependency "http"
  s.add_dependency "multi_json", "~> 1.11"

  s.add_development_dependency "rspec"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
