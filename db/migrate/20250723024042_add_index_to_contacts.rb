class AddIndexToContacts < ActiveRecord::Migration[8.0]
  def change
    add_index :contacts, :created_at
    add_index :contacts, :email
  end
end
