class Newcolumns < ActiveRecord::Migration
  def change
 
	change_table :users do |t|
	  t.string :company
	  t.string :homepage
	  t.string :background_picture
	  t.boolean :company_account
	end
 end
end
