class RenameColumntoServiceItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :service_items, :type, :category
  end
end
