class AddImageToPlayingCard < ActiveRecord::Migration
  def up
    add_attachment :playing_cards, :avatar
  end

  def down
    remove_attachment :playing_cards, :avatar
  end
end
