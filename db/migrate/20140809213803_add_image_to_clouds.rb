class AddImageToClouds < ActiveRecord::Migration
  def change
    add_column :clouds, :image, :string
  end
end
