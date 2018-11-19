class AddAdditionalInformationToServiceItems < ActiveRecord::Migration[5.2]
  def change
    add_column :service_items, :additional_information, :text
  end
end
