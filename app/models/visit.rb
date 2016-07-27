class Visit < ActiveRecord::Base

  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.record_visit!(user, shortened_url)
    Visit.create!(
      user_id: User.find_by_email(user).id,
      url_id: ShortenedURL.find_by_short_url(shortened_url).id
    )
  end
end
