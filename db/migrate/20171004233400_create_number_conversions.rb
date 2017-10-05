class CreateNumberConversions < ActiveRecord::Migration[5.1]
  def change
    create_table :number_conversions do |t|
      t.integer :number
      t.integer :base

      t.timestamps
    end
  end
end
