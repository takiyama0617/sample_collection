# frozen_string_literal: true

require 'pdf/reader'
require 'optparse'

def main
  file = ''
  opt = OptionParser.new
  opt.on('-f', '--file [file_path]', 'file path') do |v|
    return 'file path' unless v

    file = v
  end
  opt.parse!(ARGV)
  parse_pdf(file)
end

def parse_pdf(file)
  reader = PDF::Reader.new(file)
  reader.pages.each do |page|
    puts "page num : #{page.number}"
    text = page.text.empty? ? 'empty' : page.text.slice(0, 10)
    puts "text : #{text}..."
    puts "orientation : #{page.orientation}"
    puts "color_spaces : #{page.color_spaces}"
#    puts "fonts : #{page.fonts}"
    pp page.attributes
    puts page.inspect
  end
end

main if $PROGRAM_NAME == __FILE__
