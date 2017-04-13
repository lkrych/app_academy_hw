require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true
  validate :no_spamming
  validate :no_premium_max

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: 'Visit'

  has_many :visitors,
    through: :visits,
    source: :visitor

  has_many :unique_visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: 'Tagging'

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while find_by(short_url: code)
      code = SecureRandom.urlsafe_base64
    end

    code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    self.create!(long_url: long_url, short_url: random_code, user_id: user.id)
  end

  def self.prune(n)
    ShortenedUrl.joins('LEFT JOIN visits ON visits.url_id = shortened_urls.id')
      .where('visits.created_at < ? OR visits.id IS NULL ', n.minutes.ago)
      .delete_all
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    unique_visitors.count
  end

  def num_recent_uniques
    visits.select(:user_id).where(created_at: (10.minutes.ago..Time.now)).distinct.count
  end


  private

  def no_spamming
    urls_by_curr_user = submitter.submitted_urls
    num_submitted = urls_by_curr_user.where(created_at: (5.minutes.ago..Time.now)).count
    if num_submitted >= 5
      errors[:created_at] << "cant create more than 5 URLs in a minute"
    end
  end

  def no_premium_max
    urls_by_curr_user = submitter.submitted_urls.count
    premium = submitter.premium
    if !premium && urls_by_curr_user > 5
      errors[:user_id] << "non-premium users are limited to 5 URLs, please upgrade for 99 Schmeckels ($168)"
    end
  end
end
