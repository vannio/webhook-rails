class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :address
      t.string :type
      t.string :event

      t.timestamps
    end
  end
end
