class PurcheseManagementAddress

  include ActiveModel::Model
  attr_accessor :token, :zip_code,:shipping_area,:city,:address,:building,:phone,:user_id, :product_id

  with_options presence: true do
    validates :token
    validates :zip_code, format: { with: /\d{3}-\d{4}/ }
    validates :shipping_area
    validates :city
    validates :address
    validates :phone, format:{ with: /0\d{10}/ }
  end

  def save
    order = PurcheseManagement.create!(product_id: product_id, user_id: user_id)
    Address.create!(zip_code: zip_code, prefectures: shipping_area, city: city, address: address, building: building, phone: phone, purchese_management_id: order.id)
  end
end