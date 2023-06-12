class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :new_price
      t.string :end_date

      t.timestamps
    end
  end
end
