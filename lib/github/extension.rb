#           Copyright Dave O'Connor 2004 - 2024.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          https://www.boost.org/LICENSE_1_0.txt)

# frozen_string_literal: true

require 'asciidoctor'
require 'asciidoctor/extensions'

# handles the boost_github: macro
class GithubInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl
  named :boost_gh
  name_positional_attributes 'repo', 'number'

  def process(parent, target, attrs)
    content = "Target '#{target}' is invalid, check your syntax. Should be 'issue' or 'pr', not #{target}."
    if target == 'issue'
      content = "https://github.com/boostorg/#{attrs['repo']}/issues/#{attrs['number']}[#{attrs['number']}]"
    elsif target == 'pr'
      content = "https://github.com/boostorg/#{attrs['repo']}/pull/#{attrs['number']}[#{attrs['number']}]"
    end
    create_inline_pass parent, content
  end
end
