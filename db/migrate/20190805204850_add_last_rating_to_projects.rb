class AddLastRatingToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :last_rating, :string, default: "0"
  end
end
