class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user
      t.integer :follower_id
      t.boolean :read, :default => false

      t.timestamps
    end
    add_index :notifications, :user_id
  end
end
