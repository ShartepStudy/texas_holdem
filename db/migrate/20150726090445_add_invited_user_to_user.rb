class AddInvitedUserToUser < ActiveRecord::Migration
  def change
    add_column :users, :invited_user_id, :integer, default: nil
  end
end
