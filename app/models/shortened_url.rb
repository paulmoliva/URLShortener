class ShortenedURL < ActiveRecord::Base
  validates :long_url, :user_id, presence: true
  validates :long_url, :short_url, uniqueness: true

  def self.random_code
    short_url = SecureRandom::urlsafe_base64
    while ShortenedURL.exists?(:short_url => short_url)
      short_url = SecureRandom::urlsafe_base64
    end
    short_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    short_url = ShortenedURL.random_code
    ShortenedURL.create!(
      user_id: user,
      long_url: long_url,
      short_url:random_code)
  end

end
