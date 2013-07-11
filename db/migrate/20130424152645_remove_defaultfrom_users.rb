class RemoveDefaultfromUsers < ActiveRecord::Migration
  def change
  	change_column :users, :profile_picture, :string
  end
end
