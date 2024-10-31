#           Copyright Dave O'Connor 2004 - 2024.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          https://www.boost.org/LICENSE_1_0.txt)

test_doc: clean
	asciidoctor -r ./lib/asciidoctor_boost.rb -o tests/test_data/output/basic_output.html tests/test_data/basic.adoc
	bundle exec rake test

test_doc_gem: clean gem gem_install
	asciidoctor -r asciidoctor_boost -o tests/test_data/output/basic_output.html tests/test_data/basic.adoc
	rake test

gem:
	@gem build asciidoctor-boost.gemspec

gem_install: gem
	gem install asciidoctor-boost-*.gem --user-install


clean:
	@$(RM) -r tests/test_data/output
	@$(RM) asciidoctor-boost-*.gem
	@2>/dev/null 1>&2  gem uninstall asciidoctor-boost --user-install
