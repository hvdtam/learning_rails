class CreateUserDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_details do |t|
      t.string :full_name
      t.string :email
      t.string :country
      t.integer :age

      t.timestamps
    end
  end
end
