class AddStartedGameToUser < ActiveRecord::Migration
  def change
    add_column :users, :game_id, :integer, default: nil
  end
end
