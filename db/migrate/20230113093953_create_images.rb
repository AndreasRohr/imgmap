class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :title
      t.float :lat
      t.float :lng
      t.float :rotation
      t.string :tag
      t.date :date
      t.string :source
      t.string :uploadedBy
      t.references :image_set, null: false, foreign_key: true

      t.timestamps
    end
  end
end
