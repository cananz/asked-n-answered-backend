class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :pin
      t.integer :project_id
      t.boolean :is_live

      t.timestamps
    end
  end
end
