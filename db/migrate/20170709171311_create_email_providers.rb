class CreateEmailProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :email_providers do |t|
      t.string :name
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
