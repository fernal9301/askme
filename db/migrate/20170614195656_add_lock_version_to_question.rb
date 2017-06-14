class AddLockVersionToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :lock_version, :integer, :default => 0
  end
end
