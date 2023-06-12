class CreateSearchedItems < ActiveRecord::Migration[7.0]
  def change
    create_table :search_suggestions do |t|
      t.string 'query_name'
      t.string 'table_name'

      t.timestamps
    end
  end
end
