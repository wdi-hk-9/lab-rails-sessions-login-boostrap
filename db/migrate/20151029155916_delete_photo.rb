class DeletePhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :picture
  end
end
