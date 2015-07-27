class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  belongs_to :invited_user, class_name: 'User'
  belongs_to :game
  scope :not_invited, -> { where(invited_user: nil) }
  scope :in_game, -> { where(logged_in: true) }

  def clear_game
    User.where(invited_user: self).update_all(invited_user_id: nil)
    self.update(game_id: nil)
  end
end
