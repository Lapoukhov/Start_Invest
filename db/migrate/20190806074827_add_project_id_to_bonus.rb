class AddProjectIdToBonus < ActiveRecord::Migration[5.2]
  def change
    add_column :bonus, :project_id, :bigint
  end
end
