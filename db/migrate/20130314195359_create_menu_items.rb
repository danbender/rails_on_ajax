class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :menu
    end
    add_index :menu_items, :menu_id
  end
end
