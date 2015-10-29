class AddPhotoColumnUrl < ActiveRecord::Migration
  def change
    add_column :photos, :picture, :text
  end
end
