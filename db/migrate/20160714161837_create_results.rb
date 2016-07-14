class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :correct
      t.references :user, index: true, foreign_key: true
      t.references :lesson, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true

      t.timestamps
    end
  end
end
