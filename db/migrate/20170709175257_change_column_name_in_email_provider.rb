class ChangeColumnNameInEmailProvider < ActiveRecord::Migration[5.1]
  def change
    rename_column :email_providers, :status, :active
  end
end
