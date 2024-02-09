class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile, :bigint
    add_column :users, :address, :string
  end
end
