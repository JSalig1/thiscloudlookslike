class AddApprovalStatusToClouds < ActiveRecord::Migration
  def change
    add_column :clouds, :approval_status, :boolean, default: false
  end
end
