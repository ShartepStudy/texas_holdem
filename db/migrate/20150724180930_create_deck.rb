class CreateDeck < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :suit
      t.string :range
    end
  end
end
