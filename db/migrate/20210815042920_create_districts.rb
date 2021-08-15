class CreateDistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :code
      t.string :codename
      t.string :division_type
      t.string :province_code

      t.timestamps
    end
  end
end
