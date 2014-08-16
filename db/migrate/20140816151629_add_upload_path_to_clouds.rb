class AddUploadPathToClouds < ActiveRecord::Migration
  def change
    add_column :clouds, :upload_path, :string
  end
end
