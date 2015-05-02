class SorceryCore < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :email
      t.string :crypted_password
      t.string :salt
    end

    add_index :users, :email, unique: true
  end
end