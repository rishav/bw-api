class CreateBrightWheelEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :bright_wheel_emails do |t|
      t.string :to, limit: 191
      t.string :to_name
      t.string :from, limit: 191
      t.string :from_name
      t.string :subject
      t.text :body
      t.timestamps
    end
  end
end
