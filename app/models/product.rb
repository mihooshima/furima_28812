class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase_management
  has_one_attached :image

  validates :category_id, :cost_id, :day_id, :products_status_id, :shipping_id, presence: true

  with_options presence: true do
    validates :image
    validates :name
    validates :category
    validates :products_status
    validates :shipping_cost
    validates :shipping
    validates :day
    validates :price
    validates_inclusion_of :price, in: 300..99_999_999
  end

  with_options numericality: { greater_than:1} do
    validates :category_id
    validates :products_status_id
    validates :shipping_cost_id
    validates :shipping_id
    validates :day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :cost
  belongs_to_active_hash :day
  belongs_to_active_hash :products_status
  belongs_to_active_hash :shipping
end
