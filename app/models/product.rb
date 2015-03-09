class Product < ActiveRecord::Base
  # belongs_to :order, dependent: :destroy
  has_many :line_items
  has_many :orders, through: :line_items
  validates :title, presence: true, uniqueness: { case_sensitive: false}
  validates :price, presence: true, numericality: { greater_than: 0.0}
  validates :description, presence: true
  validates :img_url, allow_blank: true, format: { with: /\w+.[jpg|jpeg|png|gif]/, message: "file must of type jpeg, gif or png format"}
  before_destroy :ensure_not_referenced_by_any_line_item

  def self.latest
    order(:updated_at).last
  end

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
