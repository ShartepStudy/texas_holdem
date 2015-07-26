class CreateCardsGames < ActiveRecord::Migration
  def change
    create_table :cards_games do |t|
      t.belongs_to :playing_card
      t.belongs_to :game
      t.belongs_to :owner_type

      t.timestamps null: false
    end
  end
end
