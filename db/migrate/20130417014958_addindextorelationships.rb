class Addindextorelationships < ActiveRecord::Migration
  def change
  	add_index :relationships, :followed_user_id
  	add_index :relationships, :user_id
  end

end
