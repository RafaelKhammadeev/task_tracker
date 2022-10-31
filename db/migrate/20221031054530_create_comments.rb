class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :task
      t.string :content, null: false

      t.timestamps
    end
  end
end
