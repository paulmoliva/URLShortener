class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedURL

  has_many :visits,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visited_urls,
    -> {distinct},
    through: :visits,
    source: :url
end
