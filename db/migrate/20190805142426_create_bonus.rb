class CreateBonus < ActiveRecord::Migration[5.2]
  def change
    create_table :bonus do |t|
      t.string :name
      t.string :sum
      t.text :description
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
