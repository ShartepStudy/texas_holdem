class Game < ActiveRecord::Base
  belongs_to :player_a, class_name: 'User'
  belongs_to :player_b, class_name: 'User'
  belongs_to :a_card_1, class_name: 'PlayingCard'
  belongs_to :a_card_2, class_name: 'PlayingCard'
  belongs_to :b_card_1, class_name: 'PlayingCard'
  belongs_to :b_card_2, class_name: 'PlayingCard'
  belongs_to :card_1, class_name: 'PlayingCard'
  belongs_to :card_2, class_name: 'PlayingCard'
  belongs_to :card_3, class_name: 'PlayingCard'
  belongs_to :card_4, class_name: 'PlayingCard'
  belongs_to :card_5, class_name: 'PlayingCard'

  def winner
    hand_a = PokerHand.new([a_card_1, a_card_2, card_1, card_2, card_3, card_4, card_5].map{|c| c.name})
    hand_b = PokerHand.new([b_card_1, b_card_2, card_1, card_2, card_3, card_4, card_5].map{|c| c.name})

    hand_a > hand_b ? player_a : player_b
  end
end
