class PhotosTableAdd < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    t.string :picture
    t.text :title

    t.timestamps null: false
    end
  end
end
