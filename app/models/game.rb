class Game < ActiveRecord::Base
  belongs_to :player_a, class_name: 'User'
  belongs_to :player_b, class_name: 'User'
  has_many :cards_games
  has_many :playing_cards, through: :cards_games

  def generate_cards
    2.times {
      cards_games << CardsGame.create(playing_card: PlayingCard.random(self), game: self, owner_type_id: OwnerType::PLAYER_A)
      cards_games << CardsGame.create(playing_card: PlayingCard.random(self), game: self, owner_type_id: OwnerType::PLAYER_B)
    }
    5.times { cards_games << CardsGame.create(playing_card: PlayingCard.random(self), game: self, owner_type_id: OwnerType::COMMON) }
  end

  def winner
    common = cards_games.common.map{|c| c.playing_card.name}
    cards_a = cards_games.player_a.map{|c| c.playing_card.name}
    cards_b = cards_games.player_b.map{|c| c.playing_card.name}
    hand_a = PokerHand.new(cards_a + common)
    hand_b = PokerHand.new(cards_b + common)

    hand_a > hand_b ? player_a : player_b
  end
end
