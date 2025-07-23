class AddIndexToSkills < ActiveRecord::Migration[8.0]
  def change
    add_index :projects, :category
    add_index :projects, :is_featured
    add_index :projects, :proficiency 
  end
end
