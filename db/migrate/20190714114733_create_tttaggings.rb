class CreateTttaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :tttaggings do |t|
      t.belongs_to :project, foreign_key: true
      t.belongs_to :tttag, foreign_key: true

      t.timestamps
    end
  end
end
