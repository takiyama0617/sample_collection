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
  # pp reader.methods.sort
  reader.pages.each do |page|
    # pp page.page_object.methods.sort
    # pp page.objects.methods.sort
    page.page_object.each do |obj|
      puts obj
    end
    puts 'PDF TEXT DATA -------------'
    puts "page num : #{page.number}"
    text = page.text.empty? ? 'empty' : page.text.slice(0, 10)
    puts "→ PDF page text : #{text}..."

    # File.open("./output/sample_#{page.number}.pdf", 'wb') do |f|
    #   f.write(page.text)
    # end
  end
end

main if $PROGRAM_NAME == __FILE__
