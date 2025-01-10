class Link < ApplicationRecord
  has_many :views, dependent: :destroy

  validates :url, presence: true, uniqueness: true

  after_save_commit -> { MetadataJob.perform_later(to_param) }, if: :url_previously_changed?

  scope :recent_first, -> { order(created_at: :desc) }

  def self.find(id)
    super(ShortCode.decode(id))
  end

  def to_param
    ShortCode.encode(id)
  end

  def domain
    URI.parse(url).host rescue nil
  end
end
