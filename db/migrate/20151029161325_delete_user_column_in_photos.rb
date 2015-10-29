class DeleteUserColumnInPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :user
  end
end
