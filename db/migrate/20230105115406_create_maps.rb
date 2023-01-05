class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.string :title
      t.float :lat
      t.float :lng
      t.float :zoom

      t.timestamps
    end
  end
end
