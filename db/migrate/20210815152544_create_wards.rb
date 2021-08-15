class CreateWards < ActiveRecord::Migration[6.1]
  def change
    create_table :wards do |t|
      t.string :name
      t.string :code
      t.string :division_type
      t.string :codename
      t.string :district_code

      t.timestamps
    end
  end
end
