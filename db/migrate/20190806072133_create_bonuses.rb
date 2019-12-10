class CreateBonuses < ActiveRecord::Migration[5.2]
  def change
    create_table :bonuses do |t|
      t.belongs_to :project, foreign_key: true
      t.belongs_to :bonus, foreign_key: true

      t.timestamps
    end
  end
end
