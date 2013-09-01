class AddParamsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :yes, :integer, default: 0
    add_column :posts, :no, :integer, default: 0
    add_column :posts, :total, :integer, default: 0
    add_column :posts, :ip_address, :string
  end
end
