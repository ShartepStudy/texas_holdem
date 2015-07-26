class AddImageToPlayingCard < ActiveRecord::Migration
  def up
    add_attachment :playing_cards, :image
  end

  def down
    remove_attachment :playing_cards, :image
  end
end
