class Url < ApplicationRecord
  before_validation :generate_slug

  validates :name, presence: true
  validates :fullUrl, presence: true
  validates :fullUrl, format: URI::regexp(%w[http https])
  validates :slug, uniqueness: true

  def generate_slug
    self.slug = SecureRandom.hex(8) if self.slug.nil? || self.slug.empty?
  end
 end
