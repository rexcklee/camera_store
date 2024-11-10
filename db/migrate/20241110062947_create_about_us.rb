class CreateAboutUs < ActiveRecord::Migration[8.0]
  def change
    create_table :about_us do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
