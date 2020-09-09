class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase_management
  has_one_attached :image
  
  validates :category_id,  :cost_id,  :day_id, :products_status_id,  :shipping_id, presence: true
  
    with_options presence: true do
      # validates :genre_id, format: { with:other_than: 1 } 
      validates :image
      validates :name
      validates_inclusion_of :price, in:300..99999999
    end
    
    # def image_presence
    #   unless image.attached?
    #     errors.add(:image, "を選択してください")
    #   end
    # end

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :cost
    belongs_to_active_hash :day
    belongs_to_active_hash :products_status
    belongs_to_active_hash :shipping
end
