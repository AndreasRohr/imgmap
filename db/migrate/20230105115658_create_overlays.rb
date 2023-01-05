class CreateOverlays < ActiveRecord::Migration[7.0]
  def change
    create_table :overlays do |t|
      t.string :title
      t.float :lat
      t.float :lng
      t.float :rotation
      t.float :year
      t.references :map, null: false, foreign_key: true

      t.timestamps
    end
  end
end
