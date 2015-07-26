class PlayingCard < ActiveRecord::Base
  has_many :cards_games
  has_many :games, through: :cards_games

  def self.random(game)
    not_used = where.not(id: game.playing_cards)
    not_used.offset(rand(not_used.count)).first
  end

  def name
    "#{range}#{suite}"
  end
end
