class AddIndexToPosts < ActiveRecord::Migration
  def change
  	add_index :posts, :user_id, :name => 'user_id_ix'
  end
end
