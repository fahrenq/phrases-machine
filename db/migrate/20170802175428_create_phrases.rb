class CreatePhrases < ActiveRecord::Migration[5.1]
  def change
    create_table :phrases do |t|
      t.text :text, default: "", null: false
      t.timestamps
    end
  end
end
