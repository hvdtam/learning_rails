class CreateUserDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_details do |t|
      t.string :full_name, null: false, default: ""
      t.string :dob
      t.string :age
      t.string :location
      t.string :email

      t.timestamps
    end
  end
end
