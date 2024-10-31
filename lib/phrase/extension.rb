#           Copyright Dave O'Connor 2004 - 2024.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          https://www.boost.org/LICENSE_1_0.txt)

# frozen_string_literal: true

require 'asciidoctor'
require 'asciidoctor/extensions'

# handles the boost_phrase: macro
class PhraseInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl
  named :boost_phrase
  name_positional_attributes 'text'

  def process(parent, target, attrs)
    node = create_inline parent, :quoted, attrs['text'], type: :unquoted
    node.add_role target
    node
  end
end
