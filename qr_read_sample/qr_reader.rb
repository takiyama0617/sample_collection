require 'zbar'
require 'optparse'

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
  datas = ZBar::Image.from_jpeg(File.binread(file)).process
  datas.each do |data|
    puts data.data
    p data.location
    puts data.symbology
  end
end


main if $PROGRAM_NAME == __FILE__
