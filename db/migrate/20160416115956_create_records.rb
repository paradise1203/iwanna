class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.text :content
      t.references :goal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
