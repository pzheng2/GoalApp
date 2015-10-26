class User < ActiveRecord::Base
  MAX_CHEERS = 5
  attr_reader :password

  after_initialize :ensure_session_token
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many(
    :comments,
    class_name: "Comment",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many :cheers

  has_many(
    :cheered_goals,
    through: :cheers,
    source: :goal
    )

  has_many :goals

  # comments on this user
  has_many(
    :profile_comments,
    as: :commentable,
    class_name: "Comment",
    foreign_key: :commentable_id,
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

  def remaining_cheers
    MAX_CHEERS - self.cheers.count
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end
