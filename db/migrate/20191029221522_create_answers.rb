class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :prompt_id
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
