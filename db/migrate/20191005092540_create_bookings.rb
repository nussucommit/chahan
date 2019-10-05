class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.integer :category
      t.string :items
      t.integer :quantity
      t.text :purpose

      t.timestamps
    end
  end
end
