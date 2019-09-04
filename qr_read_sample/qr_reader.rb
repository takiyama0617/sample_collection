require 'zbar'
require 'optparse'


# ZBar::Image.from_jpeg(Filbree.read('../sample/QR_BC1001.pdf')).process

def main
  file = ''
  opt = OptionParser.new
  opt.on('-f', '--file [file_path]', 'file path') do |v|
    return 'file path' unless v

    file = v
  end
  opt.parse!(ARGV)
  parse_barcode(file)
end

def parse_barcode(file)
  
end


main if $PROGRAM_NAME == __FILE__
