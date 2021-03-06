class Goal < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :cheers
end
