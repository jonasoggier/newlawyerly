class Removeboolean < ActiveRecord::Migration
  def change

    remove_column :users, :company_account, :boolean
  
  end
end
