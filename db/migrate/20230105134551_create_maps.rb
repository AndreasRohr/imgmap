class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.string :title
      t.decimal :lat
      t.decimal :lng
      t.decimal :zoom

      t.timestamps
    end

  end
end
