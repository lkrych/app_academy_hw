class TagTopic < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: 'Tagging'

  has_many :urls,
    through: :taggings,
    source: :url

  def popular_links
    click_hash = Hash.new(0)

    urls.each do |url|
      click_hash[url.long_url] = url.num_clicks
    end

    click_hash.to_a.sort_by { |_, v| v }.reverse[0..4]

  end
end
