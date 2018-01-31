class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  create_table :users do |t|
    t.string :name
    t.string :password_digest
    t.string :email
    t.integer :tickets
    t.integer :height
    t.integer :nausea
    t.integer :happiness
    t.boolean :admin, default: false
  end
end
