# frozen_string_literal: true

require 'faker'

def main
  Faker::Config.locale = :ja
  puts Faker::Name.name
  puts Faker::Name.unique.name
  puts '---------------------'
  puts Faker::Internet.email
  puts Faker::Internet.unique.email
  puts '---------------------'
  puts Faker::Creature::Cat.name
  puts '---------------------'
  puts Faker::JapaneseMedia::OnePiece.character
  puts Faker::JapaneseMedia::OnePiece.akuma_no_mi
end

main if $PROGRAM_NAME == __FILE__
