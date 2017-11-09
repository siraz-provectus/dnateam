class AddDocumentToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :document, :string
    add_column :users, :status, :string, default: 'pending'
  end
end
