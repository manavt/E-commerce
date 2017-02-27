class RemoveTableAshok < ActiveRecord::Migration[5.0]
  def change
    drop_table :ashoks
  end
end
