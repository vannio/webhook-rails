class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :emails, :category, :email_type
  end
end
