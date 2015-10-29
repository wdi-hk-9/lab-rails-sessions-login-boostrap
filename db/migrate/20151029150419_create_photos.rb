class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :picture
      t.string :user

      t.timestamps null: false
    end
  end
end
