class RemoveUrlFromClouds < ActiveRecord::Migration
  def change
    remove_column :clouds, :url, :string
  end
end
