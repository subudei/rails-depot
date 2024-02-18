class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private
  def ensure_not_referenced_by_any_line_item
    # unless is a keyword that is used to define a conditional statement. It is used to execute a block of code if a condition is false. In this case, it is used to check if the product has any associated line items. If it does, an error is added to the base attribute of the product and the method returns false, which will prevent the product from being destroyed.
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
