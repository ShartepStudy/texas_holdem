class PlayingCard < ActiveRecord::Base
  has_many :cards_games
  has_many :games, through: :cards_games

  has_attached_file :avatar #, path: "#{Rails.root}/public/images/:filename"
  # validates_attachment_content_type :image, content_type: ['image/jpg']
  do_not_validate_attachment_file_type :avatar
  # validates_attachment :image, :presence => true,
  #                      :content_type => { :content_type => "image/jpeg" },
  #                      :size => { :in => 0..500.kilobytes }

  def self.random(game)
    not_used = where.not(id: game.playing_cards)
    not_used.offset(rand(not_used.count)).first
  end

  def name
    "#{range}#{suite}"
  end
end
