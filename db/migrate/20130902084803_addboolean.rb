class Addboolean < ActiveRecord::Migration
  def change

    add_column :users, :company_account, :boolean, :default => false
 
  end
end
