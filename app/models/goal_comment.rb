class GoalComment < ActiveRecord::Base
  validates :body, :author_id, :goal_id, presence: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
    )
  belongs_to :goal
end
