class CreateSkills < ActiveRecord::Migration[8.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :category
      t.string :proficiency
      t.boolean :is_featured
      t.integer :order_index

      t.timestamps
    end
  end
end
