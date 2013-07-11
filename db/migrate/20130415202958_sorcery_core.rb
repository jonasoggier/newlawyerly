class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email,            :null => false # if you use this field as a username, you might want to make it :null => false.
      t.string :first_name,       :default => nil  # if you use another field as a username, for example email, you can safely remove this field.
      t.string :last_name,        :default => nil  # if you use another field as a username, for example email, you can safely remove this field.
      t.text :teaser,             :default => nil
      t.text :description,        :default => nil
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end