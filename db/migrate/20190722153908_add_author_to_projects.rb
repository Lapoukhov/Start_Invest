class AddAuthorToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :author, :string
  end
end
