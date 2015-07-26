# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

suits = ['C', 'D', 'H', 'S']
ranges = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']

suits.each do |suite|
  ranges.each do |range|
    PlayingCard.create(suite: suite, range: range)
    # PlayingCard.create(suite: suite, range: range, image: File.new("#{Rails.root}/public/card_images/#{range + suite}.jpg"))
  end
end

User.create(name: 'player_a', password: 'aaaa')
User.create(name: 'player_b', password: 'bbbb')
User.create(name: 'player_c', password: 'cccc')
User.create(name: 'player_d', password: 'dddd')