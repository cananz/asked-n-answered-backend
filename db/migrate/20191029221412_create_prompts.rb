class CreatePrompts < ActiveRecord::Migration[6.0]
  def change
    create_table :prompts do |t|
      t.integer :project_id
      t.string :content
      t.string :img
      t.string :type

      t.timestamps
    end
  end
end
