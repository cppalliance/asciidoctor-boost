#           Copyright Dave O'Connor 2004 - 2024.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          https://www.boost.org/LICENSE_1_0.txt)

# frozen_string_literal: true

require 'rake/testtask'
task default: :test

Rake::TestTask.new do |t|
  t.libs << 'tests'
  t.test_files = FileList['tests/test_*.rb']
  t.verbose = true
end
