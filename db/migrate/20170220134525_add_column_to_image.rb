class AddColumnToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :entity_id, :integer
    add_column :images, :entity_type, :string
  end
end
