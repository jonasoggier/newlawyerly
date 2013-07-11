class Secondtryremoval < ActiveRecord::Migration
  def change
  	change_column :users, :profile_picture, :string, :default => false
  end
end
