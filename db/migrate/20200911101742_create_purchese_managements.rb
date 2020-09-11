class CreatePurcheseManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :purchese_managements do |t|
      t.references :user
      t.references  :product
      t.timestamps
    end
  end
end
