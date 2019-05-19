class AddAuthyIdToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :authy_id, :string
    add_column :users, :country_code, :string
    add_column :users, :phone_number, :string
    add_column :users, :otp, :string
    add_column :users, :otp_verified, :boolean, default: false
  end
end
