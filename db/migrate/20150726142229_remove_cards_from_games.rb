class RemoveCardsFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :a_card_1_id
    remove_column :games, :a_card_2_id
    remove_column :games, :a_card_1_id
    remove_column :games, :b_card_2_id
    remove_column :games, :b_card_1_id
    remove_column :games, :card_1_id
    remove_column :games, :card_2_id
    remove_column :games, :card_3_id
    remove_column :games, :card_4_id
    remove_column :games, :card_5_id
  end
end
