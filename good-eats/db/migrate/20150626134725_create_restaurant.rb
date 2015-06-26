class CreateRestaurant < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, presence: true
      t.string :state, presence: true
      t.string :zipcode, presence: true
      t.string :description
      t.string :category
    end
  end
end
