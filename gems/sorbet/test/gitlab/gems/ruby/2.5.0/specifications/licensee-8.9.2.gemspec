# -*- encoding: utf-8 -*-
# stub: licensee 8.9.2 ruby lib

Gem::Specification.new do |s|
  s.name = "licensee".freeze
  s.version = "8.9.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ben Balter".freeze]
  s.date = "2017-06-22"
  s.description = "    Licensee automates the process of reading LICENSE files and\n    compares their contents to known licenses using a fancy maths.\n".freeze
  s.email = "ben.balter@github.com".freeze
  s.executables = ["licensee".freeze]
  s.files = ["bin/licensee".freeze]
  s.homepage = "https://github.com/benbalter/licensee".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "A Ruby Gem to detect open source project licenses".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rugged>.freeze, ["~> 0.24"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.35"])
      s.add_development_dependency(%q<coveralls>.freeze, ["~> 0.8"])
    else
      s.add_dependency(%q<rugged>.freeze, ["~> 0.24"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.9"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.35"])
      s.add_dependency(%q<coveralls>.freeze, ["~> 0.8"])
    end
  else
    s.add_dependency(%q<rugged>.freeze, ["~> 0.24"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.9"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.35"])
    s.add_dependency(%q<coveralls>.freeze, ["~> 0.8"])
  end
end
