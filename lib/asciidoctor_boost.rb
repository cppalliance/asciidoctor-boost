#           Copyright Dave O'Connor 2004 - 2024.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          https://www.boost.org/LICENSE_1_0.txt)

# frozen_string_literal: true

require 'asciidoctor'
require_relative 'at_link/extension'
require_relative 'github/extension'
require_relative 'phrase/extension'

Asciidoctor::Extensions.register do
  inline_macro AtLinkInlineMacro
  inline_macro GithubInlineMacro
  inline_macro PhraseInlineMacro
end
