class PlayingCard < ActiveRecord::Base
  has_many :cards_games
  has_many :games, through: :cards_games

  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg']

  def self.random(game)
    not_used = where.not(id: game.playing_cards)
    not_used.offset(rand(not_used.count)).first
  end

  def name
    "#{range}#{suite}"
  end
end
