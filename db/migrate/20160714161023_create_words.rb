class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.string :meaning
      t.references :category, index: true, foreign_key: true

      t.timestamps 
    end
  end
end
