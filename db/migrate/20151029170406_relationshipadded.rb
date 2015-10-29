class Relationshipadded < ActiveRecord::Migration
  def change
    add_reference :photos, :user
  end
end
