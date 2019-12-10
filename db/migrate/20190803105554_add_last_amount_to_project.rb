class AddLastAmountToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :last_amount, :string, default: "0"
  end
end
