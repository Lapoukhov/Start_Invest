class AddVideoToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :video, :string
  end
end
