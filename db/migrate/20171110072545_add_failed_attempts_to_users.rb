class AddFailedAttemptsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :failed_attempts, :integer, default: 0, null: false
  end
end
