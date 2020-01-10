# frozen_string_literal: true

require 'optparse'
require 'date'

def main
  hex = ''
  opt = OptionParser.new
  opt.on('-i', '--input VALUE', 'input hex_string value') do |v|
    return 'hex string' unless v

    hex = v
  end
  opt.parse!(ARGV)
  hex2bin(hex)
end

def hex2bin(hex)
  solt = Time.now.to_i
  f = open("sample_#{solt}.zip", 'wb')
  f.write([hex].pack('H*'))
end

main if $PROGRAM_NAME == __FILE__
