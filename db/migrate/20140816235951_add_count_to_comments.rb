class AddCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :count, :integer
  end
end
