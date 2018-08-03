class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name
      t.text :price
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end
