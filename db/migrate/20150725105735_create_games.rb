class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :user, :player_a
      t.belongs_to :user, :player_b
      t.belongs_to :playing_card, :a_card_1
      t.belongs_to :playing_card, :a_card_2
      t.belongs_to :playing_card, :b_card_1
      t.belongs_to :playing_card, :b_card_2
      t.belongs_to :playing_card, :card_1
      t.belongs_to :playing_card, :card_2
      t.belongs_to :playing_card, :card_3
      t.belongs_to :playing_card, :card_4
      t.belongs_to :playing_card, :card_5

      t.timestamps null: false
    end
  end
end
