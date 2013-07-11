class Changenotificationstable2 < ActiveRecord::Migration
	def change
    add_column :notifications, :commenter_id, :integer
		add_column :notifications, :post_id, :integer

    add_index :notifications, :commenter_id
    add_index :notifications, :post_id
  end
end
