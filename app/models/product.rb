class Product < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :price, :image_url, presence: true

  enum availabilities: {
      'Нет в наличии' => 0,
      'В наличии' => 1
  }

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
