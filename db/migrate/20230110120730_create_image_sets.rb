class CreateImageSets < ActiveRecord::Migration[7.0]
  def change
    create_table :image_sets do |t|
      t.string :title
      t.string :typ
      t.string :color
      t.references :map, null: false, foreign_key: true

      t.timestamps
    end
  end
end
