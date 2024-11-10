class CreateStoreContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :store_contacts do |t|
      t.string :location
      t.string :phone
      t.string :email
      t.string :open_mon
      t.string :open_tue
      t.string :open_wed
      t.string :open_thu
      t.string :open_fri
      t.string :open_sat
      t.string :open_sun

      t.timestamps
    end
  end
end
