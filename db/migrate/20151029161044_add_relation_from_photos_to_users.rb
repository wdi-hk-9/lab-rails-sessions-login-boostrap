class AddRelationFromPhotosToUsers < ActiveRecord::Migration
  def change
    add_reference :photos, :user
  end
end
