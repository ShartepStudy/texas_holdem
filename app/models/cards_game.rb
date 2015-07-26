class CardsGame < ActiveRecord::Base
  belongs_to :playing_card
  belongs_to :game

  scope :player_a, -> { where(owner_type_id: OwnerType::PLAYER_A) }
  scope :player_b, -> { where(owner_type_id: OwnerType::PLAYER_B) }
  scope :common, -> { where(owner_type_id: OwnerType::COMMON) }
end
