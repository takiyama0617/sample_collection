# frozen_string_literal: true

require 'fileutils'
require 'optparse'

def main
  path = ''
  opt = OptionParser.new
  opt.on('-p', '--path [path]', 'path') do |v|
    return 'path' unless v

    path = v
  end
  opt.parse!(ARGV)
  rename_file(path)
end

def rename_file(path)
  if FileTest.directory? path
    FileUtils.cd(path)
    Dir.children(path).each do |item|
      rename = item.sub(/_\d{7}_\d{7}/, '')
      puts rename
      FileUtils.mv(item, rename)
    end
  elsif FileTest.file? path
    puts 'test'
  else
    raise '存在しないパスが指定されました。'
  end
end

main if $PROGRAM_NAME == __FILE__
