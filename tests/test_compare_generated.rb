#           Copyright Dave O'Connor 2004 - 2024.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          https://www.boost.org/LICENSE_1_0.txt)

# frozen_string_literal: true

def compare_output_files(file1, file2)
  File.open(file1, 'r') do |f1|
    File.open(file2, 'r') do |f2|
      return compare_lines(f1, f2) && check_extra_content(f1, f2, file1, file2)
    end
  end
end

def compare_lines(file1, file2)
  file1.each_line.zip(file2.each_line).each_with_index do |(line1, line2), index|
    return log_difference(index + 1, line1, line2) if line1 != line2
  end
  true
end

def log_difference(line_number, line1, line2)
  puts "Files differ at line #{line_number}: #{line1} != #{line2}"
  false
end

def check_extra_content(file_data1, file_daa2, file1, file2)
  if file_data1.gets
    puts "Extra content in #{file1} after matching lines."
    false
  elsif file_daa2.gets
    puts "Extra content in #{file2} after matching lines."
    false
  else
    true
  end
end

expected_output_file = File.expand_path('tests/test_data/basic_output.html')
generated_output_file = File.expand_path('tests/test_data/output/basic_output.html')
system('asciidoctor -r asciidoctor_boost -o tests/test_data/output/basic_output.html tests/test_data/basic.adoc')
raise 'Test failed!' unless compare_output_files(expected_output_file, generated_output_file)
