# -*- encoding: utf-8 -*-
# stub: deckar01-task_list 2.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "deckar01-task_list".freeze
  s.version = "2.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jared Deckard".freeze, "Matt Todd".freeze]
  s.date = "2019-01-24"
  s.description = "Markdown TaskList components".freeze
  s.email = ["jared.deckard@gmail.com".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Markdown TaskList components".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<html-pipeline>.freeze, [">= 0"])
      s.add_development_dependency(%q<commonmarker>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<coffee-script>.freeze, [">= 0"])
      s.add_development_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<rack>.freeze, [">= 0"])
      s.add_development_dependency(%q<sprockets>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.3.2"])
    else
      s.add_dependency(%q<html-pipeline>.freeze, [">= 0"])
      s.add_dependency(%q<commonmarker>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<coffee-script>.freeze, [">= 0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<rack>.freeze, [">= 0"])
      s.add_dependency(%q<sprockets>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.3.2"])
    end
  else
    s.add_dependency(%q<html-pipeline>.freeze, [">= 0"])
    s.add_dependency(%q<commonmarker>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<coffee-script>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<rack>.freeze, [">= 0"])
    s.add_dependency(%q<sprockets>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.3.2"])
  end
end
