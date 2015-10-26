class User < ActiveRecord::Base
  attr_reader :password

  after_initialize :ensure_session_token
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :goals

  has_many(
    :goal_comments,
    class_name: "GoalComment",
    foreign_key: :author_id,
    primary_key: :id
  )

  # a user's comments on other users
  has_many(
    :user_comments,
    class_name: "UserComment",
    foreign_key: :author_id,
    primary_key: :id
    )

  # comments on this user
  has_many(
    :profile_comments,
    class_name: "UserComment",
    foreign_key: :user_id,
    primary_key: :id
    )


  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user && user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def public_goals
    self.goals.where(private: false)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end
