class ChangeCategoryToBeStringInBookings < ActiveRecord::Migration[6.0]
  def change
      change_column :bookings, :category, :string
  end
end
