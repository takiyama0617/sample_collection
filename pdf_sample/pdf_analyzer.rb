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
  pp reader.methods
end

main if $PROGRAM_NAME == __FILE__
