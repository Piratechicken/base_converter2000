class CreateNumberConversions < ActiveRecord::Migration[5.1]
  def change
    create_table :number_conversions do |t|
      t.string :input_number
      t.string :base
      t.string :output

      t.timestamps
    end
  end
end
