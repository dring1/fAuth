class AddFileChecksumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :checksum, :string
  end
end
