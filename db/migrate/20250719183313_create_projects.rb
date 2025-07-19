class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :catrgory
      t.string :status
      t.string :technologies, array: true
      t.string :features, array: true
      t.string :results, array: true
      t.string :endpoints
      t.string :design_patterns
      t.string :github_url
      t.string :demo_url
      t.string :documentation_url
      t.boolean :is_featured
      t.string :order_index

      t.timestamps
    end
  end
end
