# -*- encoding: utf-8 -*-
# stub: gpgme 2.0.18 ruby lib ext
# stub: ext/gpgme/extconf.rb

Gem::Specification.new do |s|
  s.name = "gpgme".freeze
  s.version = "2.0.18"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze, "ext".freeze]
  s.authors = ["Daiki Ueno".freeze, "Albert Llop".freeze]
  s.date = "2018-11-22"
  s.description = "Ruby-GPGME is a Ruby language binding of GPGME (GnuPG\nMade Easy). GnuPG Made Easy (GPGME) is a library designed to make access to\nGnuPG easier for applications. It provides a High-Level Crypto API for\nencryption, decryption, signing, signature verification and key management.".freeze
  s.email = "ueno@gnu.org".freeze
  s.extensions = ["ext/gpgme/extconf.rb".freeze]
  s.files = ["ext/gpgme/extconf.rb".freeze]
  s.homepage = "http://github.com/ueno/ruby-gpgme".freeze
  s.licenses = ["LGPL-2.1+".freeze]
  s.rubyforge_project = "ruby-gpgme".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Ruby binding of GPGME.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mini_portile2>.freeze, ["~> 2.3"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 0.9.12"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 2.1.0"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.9.11"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_development_dependency(%q<byebug>.freeze, ["~> 3.5.1"])
    else
      s.add_dependency(%q<mini_portile2>.freeze, ["~> 2.3"])
      s.add_dependency(%q<mocha>.freeze, ["~> 0.9.12"])
      s.add_dependency(%q<minitest>.freeze, ["~> 2.1.0"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.9.11"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<byebug>.freeze, ["~> 3.5.1"])
    end
  else
    s.add_dependency(%q<mini_portile2>.freeze, ["~> 2.3"])
    s.add_dependency(%q<mocha>.freeze, ["~> 0.9.12"])
    s.add_dependency(%q<minitest>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9.11"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<byebug>.freeze, ["~> 3.5.1"])
  end
end
