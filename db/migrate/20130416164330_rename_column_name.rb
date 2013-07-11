class RenameColumnName < ActiveRecord::Migration
  def up
  	rename_column :relationships, :friend_id, :followed_user_id
  end

  def down
  end
end
