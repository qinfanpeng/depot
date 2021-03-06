class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  validates :title, :description, :image_url, :price, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  has_many :line_items

#  has_friendly_id :title
#  extend FriendlyId
# friendly_id :title

  def to_param
    "#{id} #{title}".parameterize
  end

  before_destroy :ensure_not_referenced_by_any_line_item

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Item prevent')
      return false
    end
  end
end
