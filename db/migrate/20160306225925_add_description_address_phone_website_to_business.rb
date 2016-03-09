class AddDescriptionAddressPhoneWebsiteToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :description, :string, after: :name
    add_column :businesses, :address, :string, after: :name
    add_column :businesses, :phone, :string, after: :name
    add_column :businesses, :website, :string, after: :name
  end
end
