class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, limit: 128, null: false
      t.belongs_to :cloud

      t.timestamps
    end
  end
end
