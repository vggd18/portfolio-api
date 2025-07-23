class AddIndexToSkills < ActiveRecord::Migration[8.0]
  def change
    add_index :skills, :category
    add_index :skills, :is_featured
    add_index :skills, :proficiency 
  end
end
