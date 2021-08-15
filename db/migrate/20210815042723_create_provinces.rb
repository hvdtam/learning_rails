class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :code
      t.string :division_type
      t.string :phone_code
      t.string :codename

      t.timestamps
    end
  end
end
