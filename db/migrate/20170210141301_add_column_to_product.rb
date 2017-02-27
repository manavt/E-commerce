class AddColumnToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :content, :boolean
  end
end
