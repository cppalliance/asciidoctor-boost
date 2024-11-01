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
  name_positional_attributes 'text', 'link'

  def process(parent, target, attrs)
    role = target
    text = attrs['text'] || target
    link = attrs['link']
    backend = parent.document.backend

    if link && !link.strip.empty?
      process_with_link(parent, role, text, link, backend)
    else
      process_without_link(parent, role, text)
    end
  end

  private

  def process_with_link(parent, role, text, link, backend)
    if backend == 'html5'
      generate_html_output(role, link, text)
    else
      create_anchor_with_role(parent, role, text, link)
    end
  end

  def process_without_link(parent, role, text)
    span_node = create_inline parent, :quoted, text, type: :unquoted
    span_node.add_role role
    span_node
  end

  def generate_html_output(role, link, text)
    %(<span class="#{role}"><a href="#{link}">#{text}</a></span>)
  end

  def create_anchor_with_role(parent, role, text, link)
    anchor_node = create_inline parent, :anchor, text, type: :link, target: link
    anchor_node.add_role role
    anchor_node
  end
end
