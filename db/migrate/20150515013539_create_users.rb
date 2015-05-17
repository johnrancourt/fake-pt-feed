class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password
      t.string :target
      t.string :rate

      t.timestamps null: false
    end
  end
end
