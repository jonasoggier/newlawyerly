class Changenotificationstable < ActiveRecord::Migration
	def change
   remove_column :notifications, :read
  end
end
