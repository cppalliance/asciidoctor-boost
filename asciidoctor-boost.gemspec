#           Copyright Dave O'Connor 2004 - 2024.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          https://www.boost.org/LICENSE_1_0.txt)

# frozen_string_literal: true

require File.expand_path('lib/version', __dir__)

Gem::Specification.new do |spec|
  spec.name          = 'asciidoctor-boost'
  spec.authors       = ["Dave O'Connor"]
  spec.email         = ['docgithub@dead-pixels.org']
  spec.version       = Boost::VERSION
  spec.files         = Dir['lib/**/*.rb']
  spec.summary       = 'Asciidoctor macros for Boost documentation'
  spec.description   = 'This library contains macros that can be used in Boost documentation.'
  spec.homepage      = 'https://github.com/cppalliance/asciidoctor-boost'
  spec.license       = 'BSL-1.0'
  spec.required_ruby_version = '>= 2.4.0'

  spec.metadata = {
    'bug_tracker_uri' => "#{spec.homepage}/issues",
    'homepage_uri' => spec.homepage.to_s,
    'source_code_uri' => spec.homepage.to_s,
    'changelog_uri' => "#{spec.homepage}/CHANGELOG.md"
  }

  spec.require_paths = ['lib']

  spec.add_dependency 'rake', '~> 13.2'
end
