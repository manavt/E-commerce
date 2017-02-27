class CreateAshoks < ActiveRecord::Migration[5.0]
  def change
    create_table :ashoks do |t|
      t.string :name

      t.timestamps
    end
  end
end
