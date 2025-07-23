class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_enum :project_category, %w[data backend]
    create_enum :project_status, %w[pending in_progress completed]

    create_table :projects do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.enum :category, enum_type: "project_category", null: false
      t.enum :status, enum_type: "project_status", default: "pending", null: false
      t.string :technologies, array: true, default: []
      t.string :features, array: true, default: []
      t.string :results, array: true, default: []
      t.string :endpoints, array: true, default: []
      t.string :design_patterns, array: true, default: []
      t.string :github_url
      t.string :demo_url
      t.string :documentation_url
      t.boolean :is_featured, default: false
      t.string :order_index

      t.timestamps
    end
  end
end
