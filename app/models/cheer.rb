class Cheer < ActiveRecord::Base
  validates :user_id, :goal_id, presence: true
  validate :user_has_remaining_cheers

  belongs_to :user
  belongs_to :goal

  def user_has_remaining_cheers
    self.errors[:user] << "No remaining cheers." unless self.user.remaining_cheers > 0
  end


end
