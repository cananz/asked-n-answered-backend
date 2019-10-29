class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :user_id
      t.string :subtitle

      t.timestamps
    end
  end
end
