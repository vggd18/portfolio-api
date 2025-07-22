class CreateSkills < ActiveRecord::Migration[8.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.integer :proeficiency, null: false
      t.boolean :is_featured, default: false
      t.integer :order_index

      t.timestamps
    end

    add_index :projects, :category
    add_index :projects, :is_featured
    add_index :projects, :proeficiency
  end
end
