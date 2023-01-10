class CreateCurrency < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string 'name'
      t.integer 'postal_code'
      t.integer 'country_code'
      t.string 'currency_name'
      t.string 'currency_symbol'
      t.integer 'exchange'
      t.text 'icon' 

      t.timestamps
    end
  end
end
