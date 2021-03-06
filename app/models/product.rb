class Product < ApplicationRecord
  belongs_to :user
  has_one :purchese_management
  has_one_attached :image

  # validates :category_id, :cost_id, :day_id, :products_status_id, :shipping_id, presence: true

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :products_status_id
    validates :shipping_cost_id
    validates :shipping_id
    validates :day_id
    validates :price
    # validates_inclusion_of :price, in: 300..99_999_999
  end

  with_options numericality: { greater_than:0} do
    validates :category_id
    validates :products_status_id
    validates :shipping_cost_id
    validates :shipping_id
    validates :day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :day
  belongs_to_active_hash :products_status
  belongs_to_active_hash :shipping

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

end
