class Link < ActiveRecord::Base
  belongs_to :user

  validate :url_is_properly_formatted
  validates :url, presence: true,
                  uniqueness: true
  validates :title, presence: true,
                    uniqueness: true

  def url_is_properly_formatted
    uri = URI.parse(self.url)
    uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    errors.add(:url, "improper format")
  end
end
