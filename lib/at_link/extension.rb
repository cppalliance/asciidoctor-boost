#           Copyright Dave O'Connor 2004 - 2024.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          https://www.boost.org/LICENSE_1_0.txt)

# frozen_string_literal: true

require 'asciidoctor'
require 'asciidoctor/extensions'

# handles the boost_at: macro
class AtLinkInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl
  named :boost_at
  name_positional_attributes 'link'

  def process(parent, target, attrs)
    content = "link:#{target}[#{attrs['link']}]"
    create_inline_pass parent, content
  end
end
