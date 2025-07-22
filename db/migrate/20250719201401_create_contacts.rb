class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :subject, null: false
      t.text :message, null: false

      t.timestamps
    end

    add_index :contact_messages, :created_at
    add_index :contact_messages, :email
  end
end
